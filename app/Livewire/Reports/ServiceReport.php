<?php

namespace App\Livewire\Reports;

use App\Models\Order;
use Livewire\Component;
use Livewire\WithPagination;
use Carbon\Carbon;

class ServiceReport extends Component
{
    use WithPagination;

    public $startDate;
    public $endDate;
    public $search = '';
    public $orderType = '';
    public $status = '';
    public $perPage = 15;

    protected $queryString = [
        'startDate' => ['except' => ''],
        'endDate' => ['except' => ''],
        'search' => ['except' => ''],
        'orderType' => ['except' => ''],
        'status' => ['except' => ''],
    ];

    public function mount()
    {
        $this->startDate = now()->subDays(30)->format('Y-m-d');
        $this->endDate = now()->format('Y-m-d');
    }

    public function updatedSearch()
    {
        $this->resetPage();
    }

    public function updatedStartDate()
    {
        $this->resetPage();
    }

    public function updatedEndDate()
    {
        $this->resetPage();
    }

    public function updatedOrderType()
    {
        $this->resetPage();
    }

    public function updatedStatus()
    {
        $this->resetPage();
    }

    public function render()
    {
        $query = Order::with(['table', 'customer', 'waiter'])
            ->whereBetween('date_time', [
                Carbon::parse($this->startDate)->startOfDay(),
                Carbon::parse($this->endDate)->endOfDay()
            ]);

        // Apply search filter
        if ($this->search) {
            $query->where(function ($q) {
                $q->where('order_number', 'like', '%' . $this->search . '%')
                  ->orWhereHas('customer', function ($customerQuery) {
                      $customerQuery->where('name', 'like', '%' . $this->search . '%');
                  })
                  ->orWhereHas('table', function ($tableQuery) {
                      $tableQuery->where('table_code', 'like', '%' . $this->search . '%');
                  });
            });
        }

        // Apply order type filter
        if ($this->orderType) {
            $query->where('order_type', $this->orderType);
        }

        // Apply status filter
        if ($this->status) {
            $query->where('order_status', $this->status);
        }

        $orders = $query->orderBy('date_time', 'desc')
                       ->paginate($this->perPage);

        // Calculate service time statistics
        $serviceStats = $this->calculateServiceStats($query);

        return view('livewire.reports.service-report', [
            'orders' => $orders,
            'serviceStats' => $serviceStats,
        ]);
    }

    private function calculateServiceStats($query)
    {
        $orders = $query->get();
        
        $serviceTimes = [];
        $totalOrders = 0;
        $completedOrders = 0;

        foreach ($orders as $order) {
            $totalOrders++;
            
            // Only calculate for orders that have been served/delivered
            if (in_array($order->order_status->value, ['served', 'delivered'])) {
                $completedOrders++;
                
                // Calculate service time (from order placed to served)
                $orderTime = Carbon::parse($order->date_time);
                $servedTime = null;
                
                // Find when the order was served/delivered
                if ($order->order_status->value === 'served') {
                    // For served orders, use updated_at as proxy for served time
                    $servedTime = Carbon::parse($order->updated_at);
                } elseif ($order->order_status->value === 'delivered') {
                    // For delivered orders, use delivered_at if available, otherwise updated_at
                    $servedTime = $order->delivered_at ? Carbon::parse($order->delivered_at) : Carbon::parse($order->updated_at);
                }
                
                if ($servedTime) {
                    $serviceTime = $orderTime->diffInMinutes($servedTime);
                    // Only include reasonable service times (less than 24 hours)
                    if ($serviceTime > 0 && $serviceTime < 1440) {
                        $serviceTimes[] = $serviceTime;
                    }
                }
            }
        }

        if (empty($serviceTimes)) {
            return [
                'averageServiceTime' => 0,
                'minServiceTime' => 0,
                'maxServiceTime' => 0,
                'totalOrders' => $totalOrders,
                'completedOrders' => $completedOrders,
                'completionRate' => 0,
            ];
        }

        return [
            'averageServiceTime' => round(array_sum($serviceTimes) / count($serviceTimes), 2),
            'minServiceTime' => round(min($serviceTimes), 2),
            'maxServiceTime' => round(max($serviceTimes), 2),
            'totalOrders' => $totalOrders,
            'completedOrders' => $completedOrders,
            'completionRate' => round(($completedOrders / $totalOrders) * 100, 2),
        ];
    }

    public function getServiceTime($order)
    {
        if (!in_array($order->order_status->value, ['served', 'delivered'])) {
            return '-';
        }

        $orderTime = Carbon::parse($order->date_time);
        
        // Use appropriate served time based on order status
        if ($order->order_status->value === 'served') {
            $servedTime = Carbon::parse($order->updated_at);
        } elseif ($order->order_status->value === 'delivered') {
            $servedTime = $order->delivered_at ? Carbon::parse($order->delivered_at) : Carbon::parse($order->updated_at);
        } else {
            return '-';
        }
        
        $minutes = $orderTime->diffInMinutes($servedTime);
        
        // Only show reasonable service times (less than 24 hours)
        if ($minutes > 0 && $minutes < 1440) {
            if ($minutes < 60) {
                return round($minutes, 2) . ' min';
            } else {
                $hours = floor($minutes / 60);
                $remainingMinutes = round($minutes % 60, 2);
                return $hours . 'h ' . $remainingMinutes . 'm';
            }
        } else {
            return '-';
        }
    }

    public function getStatusColor($status)
    {
        return match ($status) {
            'placed' => 'bg-blue-100 text-blue-800',
            'confirmed' => 'bg-yellow-100 text-yellow-800',
            'preparing' => 'bg-orange-100 text-orange-800',
            'ready_for_pickup' => 'bg-purple-100 text-purple-800',
            'out_for_delivery' => 'bg-indigo-100 text-indigo-800',
            'served' => 'bg-green-100 text-green-800',
            'delivered' => 'bg-green-100 text-green-800',
            'cancelled' => 'bg-red-100 text-red-800',
            default => 'bg-gray-100 text-gray-800',
        };
    }
} 