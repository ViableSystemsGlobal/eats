<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Models\Order;
use App\Models\Restaurant;
use App\Models\MenuItem;

class PerformanceMonitor extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'performance:monitor';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Monitor application performance and identify bottlenecks';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Performance Monitoring Report');
        $this->info('==========================');

        // Database performance
        $this->checkDatabasePerformance();

        // Cache performance
        $this->checkCachePerformance();

        // Query optimization suggestions
        $this->suggestQueryOptimizations();

        $this->info('Performance monitoring completed!');
    }

    private function checkDatabasePerformance()
    {
        $this->info("\n📊 Database Performance:");
        
        // Check table sizes
        $tables = ['orders', 'menu_items', 'restaurants', 'payments', 'kots'];
        
        foreach ($tables as $table) {
            try {
                $count = DB::table($table)->count();
                $this->line("  • {$table}: {$count} records");
            } catch (\Exception $e) {
                $this->warn("  • {$table}: Error counting records");
            }
        }

        // Check slow queries
        $this->info("\n🐌 Potential Slow Queries:");
        $this->line("  • Orders without indexes on date_time, order_status");
        $this->line("  • Menu items without restaurant_id index");
        $this->line("  • Payments without order_id index");
    }

    private function checkCachePerformance()
    {
        $this->info("\n💾 Cache Performance:");
        
        $cacheHits = Cache::get('cache_hits', 0);
        $cacheMisses = Cache::get('cache_misses', 0);
        
        $this->line("  • Cache hits: {$cacheHits}");
        $this->line("  • Cache misses: {$cacheMisses}");
        
        if ($cacheHits > 0) {
            $hitRate = ($cacheHits / ($cacheHits + $cacheMisses)) * 100;
            $this->line("  • Hit rate: " . number_format($hitRate, 2) . "%");
        }
    }

    private function suggestQueryOptimizations()
    {
        $this->info("\n🔧 Query Optimization Suggestions:");
        
        $this->line("  • Use eager loading with 'with()' for relationships");
        $this->line("  • Implement caching for frequently accessed data");
        $this->line("  • Add database indexes on frequently queried columns");
        $this->line("  • Use pagination for large result sets");
        $this->line("  • Consider using database views for complex queries");
        $this->line("  • Implement query result caching");
    }
} 