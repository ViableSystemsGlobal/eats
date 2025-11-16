<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Models\Restaurant;
use App\Models\MenuItem;
use Carbon\Carbon;

class PerformanceOptimizationService
{
    /**
     * Cache frequently accessed data
     */
    public static function cacheFrequentlyAccessedData()
    {
        // Cache restaurant count
        Cache::remember('total_restaurants', 3600, function () {
            return Restaurant::count();
        });

        // Cache today's orders count
        Cache::remember('today_orders_count', 300, function () {
            return Order::whereDate('date_time', Carbon::today())->count();
        });

        // Cache active restaurants
        Cache::remember('active_restaurants', 1800, function () {
            return Restaurant::where('is_active', 1)->count();
        });
    }

    /**
     * Optimize order queries with proper eager loading
     */
    public static function getOptimizedOrders($filters = [])
    {
        $query = Order::with([
            'items.menuItem',
            'customer',
            'table',
            'branch',
            'payments'
        ]);

        if (isset($filters['date'])) {
            $query->whereDate('date_time', $filters['date']);
        }

        if (isset($filters['status'])) {
            $query->where('order_status', $filters['status']);
        }

        return $query->latest()->paginate(20);
    }

    /**
     * Optimize menu item queries
     */
    public static function getOptimizedMenuItems($restaurantId)
    {
        return Cache::remember("menu_items_{$restaurantId}", 1800, function () use ($restaurantId) {
            return MenuItem::with(['category', 'variations', 'modifierGroups'])
                ->where('restaurant_id', $restaurantId)
                ->where('is_enabled', 1)
                ->orderBy('sort_order')
                ->get();
        });
    }

    /**
     * Clear specific caches
     */
    public static function clearOrderCache()
    {
        Cache::forget('today_orders_count');
        Cache::forget('today_orders');
    }

    /**
     * Optimize dashboard queries
     */
    public static function getDashboardStats($restaurantId = null)
    {
        $cacheKey = $restaurantId ? "dashboard_stats_{$restaurantId}" : 'dashboard_stats_global';
        
        return Cache::remember($cacheKey, 300, function () use ($restaurantId) {
            $query = Order::query();
            
            if ($restaurantId) {
                $query->whereHas('branch', function ($q) use ($restaurantId) {
                    $q->where('restaurant_id', $restaurantId);
                });
            }

            return [
                'today_orders' => (clone $query)->whereDate('date_time', Carbon::today())->count(),
                'today_earnings' => (clone $query)->whereDate('date_time', Carbon::today())->sum('total'),
                'monthly_orders' => (clone $query)->whereMonth('date_time', Carbon::now()->month)->count(),
                'monthly_earnings' => (clone $query)->whereMonth('date_time', Carbon::now()->month)->sum('total'),
            ];
        });
    }

    /**
     * Database query optimization
     */
    public static function optimizeDatabaseQueries()
    {
        // Add database indexes for frequently queried columns
        $indexes = [
            'orders' => ['date_time', 'order_status', 'branch_id'],
            'menu_items' => ['restaurant_id', 'is_enabled', 'sort_order'],
            'restaurants' => ['is_active', 'hash'],
            'payments' => ['order_id', 'payment_method'],
        ];

        foreach ($indexes as $table => $columns) {
            foreach ($columns as $column) {
                $indexName = "idx_{$table}_{$column}";
                try {
                    DB::statement("CREATE INDEX IF NOT EXISTS {$indexName} ON {$table} ({$column})");
                } catch (\Exception $e) {
                    // Index might already exist
                }
            }
        }
    }
} 