<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Models\Order;
use App\Models\Restaurant;
use App\Models\MenuItem;
use Carbon\Carbon;

class TestPerformance extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'test:performance';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Test performance optimizations and caching';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Testing Performance Optimizations');
        $this->info('===============================');

        // Test 1: Database query performance
        $this->testDatabasePerformance();

        // Test 2: Caching performance
        $this->testCachingPerformance();

        // Test 3: Asset loading
        $this->testAssetPerformance();

        $this->info('Performance tests completed!');
    }

    private function testDatabasePerformance()
    {
        $this->info("\n📊 Database Performance Test:");
        
        // Test orders query with index
        $startTime = microtime(true);
        $orders = Order::whereDate('date_time', Carbon::today())->count();
        $endTime = microtime(true);
        $queryTime = ($endTime - $startTime) * 1000;
        
        $this->line("  • Today's orders query: {$queryTime}ms ({$orders} orders)");

        // Test menu items query
        $startTime = microtime(true);
        $menuItems = MenuItem::where('is_available', 1)->count();
        $endTime = microtime(true);
        $queryTime = ($endTime - $startTime) * 1000;
        
        $this->line("  • Menu items query: {$queryTime}ms ({$menuItems} items)");

        // Test restaurant query
        $startTime = microtime(true);
        $restaurants = Restaurant::where('is_active', 1)->count();
        $endTime = microtime(true);
        $queryTime = ($endTime - $startTime) * 1000;
        
        $this->line("  • Active restaurants query: {$queryTime}ms ({$restaurants} restaurants)");
    }

    private function testCachingPerformance()
    {
        $this->info("\n💾 Caching Performance Test:");
        
        // Test cache hit
        $startTime = microtime(true);
        $globalSettings = Cache::remember('test_global_settings', 60, function () {
            return \App\Models\GlobalSetting::first();
        });
        $endTime = microtime(true);
        $cacheTime = ($endTime - $startTime) * 1000;
        
        $this->line("  • Global settings cache: {$cacheTime}ms");

        // Test cache hit (should be faster)
        $startTime = microtime(true);
        $globalSettings = Cache::get('test_global_settings');
        $endTime = microtime(true);
        $cacheTime = ($endTime - $startTime) * 1000;
        
        $this->line("  • Global settings cache hit: {$cacheTime}ms");

        // Clean up test cache
        Cache::forget('test_global_settings');
    }

    private function testAssetPerformance()
    {
        $this->info("\n📦 Asset Performance Test:");
        
        $assetPath = public_path('build/manifest.json');
        if (file_exists($assetPath)) {
            $manifest = json_decode(file_get_contents($assetPath), true);
            
            if ($manifest) {
                $this->line("  • Main JS bundle: " . (isset($manifest['resources/js/app.js']) ? 'Optimized' : 'Not found'));
                $this->line("  • Vendor bundle: " . (isset($manifest['_vendor-C4fRkSc4.js']) ? 'Optimized' : 'Not found'));
                $this->line("  • UI bundle: " . (isset($manifest['_ui-CwnR3iu7.js']) ? 'Optimized' : 'Not found'));
                $this->line("  • Charts bundle: " . (isset($manifest['_charts-DoFBzinz.js']) ? 'Optimized' : 'Not found'));
                
                // Check bundle sizes
                $mainBundle = public_path('build/assets/app-YfZGKopw.js');
                $vendorBundle = public_path('build/assets/vendor-C4fRkSc4.js');
                $uiBundle = public_path('build/assets/ui-CwnR3iu7.js');
                $chartsBundle = public_path('build/assets/charts-DoFBzinz.js');
                
                if (file_exists($mainBundle)) {
                    $size = round(filesize($mainBundle) / 1024, 2);
                    $this->line("  • Main bundle size: {$size}KB");
                }
                if (file_exists($vendorBundle)) {
                    $size = round(filesize($vendorBundle) / 1024, 2);
                    $this->line("  • Vendor bundle size: {$size}KB");
                }
            }
        } else {
            $this->warn("  • Asset manifest not found. Run 'npm run build' first.");
        }
    }
} 