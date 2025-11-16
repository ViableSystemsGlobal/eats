<?php

namespace App\Livewire\Dashboard;

use App\Events\TodayOrdersUpdated;
use App\Models\Kot;
use App\Models\Order;
use App\Services\PerformanceOptimizationService;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;
use Illuminate\Support\Facades\Cache;

class TodayOrders extends Component
{

    use LivewireAlert;

    public function render()
    {
        // Use cached data for better performance
        $count = Cache::remember('today_orders_count_' . auth()->id(), 60, function () {
            return Order::whereDate('orders.date_time', '>=', now()->startOfDay()->toDateTimeString())
                ->whereDate('orders.date_time', '<=', now()->endOfDay()->toDateTimeString())
                ->where('status', '<>', 'canceled')
                ->where('status', '<>', 'draft')
                ->count();
        });

        $todayKotCount = Cache::remember('today_kot_count_' . auth()->id(), 60, function () {
            return Kot::join('orders', 'kots.order_id', '=', 'orders.id')
                ->whereDate('kots.created_at', '>=', now()->startOfDay()->toDateTimeString())
                ->whereDate('kots.created_at', '<=', now()->endOfDay()->toDateTimeString())
                ->where('orders.status', '<>', 'canceled')
                ->where('orders.status', '<>', 'draft')
                ->count();
        });

        $playSound = false;

        if (session()->has('today_order_count') && session('today_order_count') < $todayKotCount) {
            $playSound = true;

            $this->alert('success', __('messages.newOrderReceived'), [
                'toast' => true,
                'position' => 'top-end'
            ]);

            $this->dispatch('refreshOrders');
        }

        session(['today_order_count' => $todayKotCount]);

        return view('livewire.dashboard.today-orders', [
            'count' => $count,
            'playSound' => $playSound,
        ]);
    }

    /**
     * Handle refresh from Pusher event
     */
    public function refreshOrders()
    {
        // Clear cache when new orders arrive
        Cache::forget('today_orders_count_' . auth()->id());
        Cache::forget('today_kot_count_' . auth()->id());
        
        // This method will be called when Pusher sends data
        // The component will automatically re-render with fresh data
        $this->dispatch('$refresh');
    }
}
