<?php

namespace App\Livewire\Dashboard;

use App\Models\Order;
use Livewire\Component;
use Illuminate\Support\Facades\Cache;

class UnservedOrders extends Component
{
    protected $listeners = ['refreshOrders' => '$refresh'];

    public function render()
    {
        // Use cached data for better performance
        $count = Cache::remember('unserved_orders_count_' . auth()->id(), 60, function () {
            // Check if we have a restaurant context
            if (!restaurant()) {
                return 0; // No restaurant context, return 0
            }
            
            // Always show today's unserved orders (as the label says "Unserved Orders Today")
            return Order::whereNotIn('order_status', ['served', 'delivered', 'cancelled'])
                ->whereHas('branch', function($query) {
                    $query->where('restaurant_id', restaurant()->id);
                })
                ->whereDate('date_time', today())
                ->count();
        });

        return view('livewire.dashboard.unserved-orders', [
            'count' => $count,
        ]);
    }

    /**
     * Handle refresh from Pusher event
     */
    public function refreshOrders()
    {
        // Clear cache when new orders arrive
        Cache::forget('unserved_orders_count_' . auth()->id());
        
        // This method will be called when Pusher sends data
        // The component will automatically re-render with fresh data
        $this->dispatch('$refresh');
    }
} 