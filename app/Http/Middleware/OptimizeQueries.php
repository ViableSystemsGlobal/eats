<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class OptimizeQueries
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        // Enable query logging in debug mode
        if (config('app.debug')) {
            DB::enableQueryLog();
        }

        $response = $next($request);

        // Cache frequently accessed data
        if ($request->is('dashboard*') || $request->is('admin*')) {
            $this->cacheFrequentlyAccessedData();
        }

        return $response;
    }

    /**
     * Cache frequently accessed data
     */
    private function cacheFrequentlyAccessedData()
    {
        // Cache global settings
        Cache::remember('global_settings', 3600, function () {
            try {
                return \App\Models\GlobalSetting::first();
            } catch (\Exception $e) {
                return null;
            }
        });

        // Cache restaurant data for current user
        if (auth()->check() && auth()->user()->restaurant_id) {
            Cache::remember('restaurant_' . auth()->user()->restaurant_id, 1800, function () {
                try {
                    return \App\Models\Restaurant::with('currency')->find(auth()->user()->restaurant_id);
                } catch (\Exception $e) {
                    return null;
                }
            });
        }
    }
} 