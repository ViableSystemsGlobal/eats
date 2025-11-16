<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use App\Services\PerformanceOptimizationService;

class OptimizeDatabase extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:optimize';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Optimize database performance with indexes and table analysis';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Starting database optimization...');

        // Create indexes for frequently queried columns
        $this->createIndexes();

        // Analyze tables for better query planning
        $this->analyzeTables();

        // Cache frequently accessed data
        PerformanceOptimizationService::cacheFrequentlyAccessedData();

        $this->info('Database optimization completed successfully!');
    }

    private function createIndexes()
    {
        $this->info('Creating database indexes...');

        $indexes = [
            'orders' => [
                'date_time' => 'CREATE INDEX idx_orders_date_time ON orders (date_time)',
                'order_status' => 'CREATE INDEX idx_orders_status ON orders (order_status)',
                'branch_id' => 'CREATE INDEX idx_orders_branch_id ON orders (branch_id)',
                'customer_id' => 'CREATE INDEX idx_orders_customer_id ON orders (customer_id)',
            ],
            'menu_items' => [
                'restaurant_id' => 'CREATE INDEX idx_menu_items_restaurant_id ON menu_items (restaurant_id)',
                'is_enabled' => 'CREATE INDEX idx_menu_items_enabled ON menu_items (is_enabled)',
                'sort_order' => 'CREATE INDEX idx_menu_items_sort_order ON menu_items (sort_order)',
            ],
            'restaurants' => [
                'is_active' => 'CREATE INDEX idx_restaurants_active ON restaurants (is_active)',
                'hash' => 'CREATE INDEX idx_restaurants_hash ON restaurants (hash)',
            ],
            'payments' => [
                'order_id' => 'CREATE INDEX idx_payments_order_id ON payments (order_id)',
                'payment_method' => 'CREATE INDEX idx_payments_method ON payments (payment_method)',
            ],
            'kots' => [
                'order_id' => 'CREATE INDEX idx_kots_order_id ON kots (order_id)',
                'created_at' => 'CREATE INDEX idx_kots_created_at ON kots (created_at)',
            ],
        ];

        foreach ($indexes as $table => $tableIndexes) {
            foreach ($tableIndexes as $column => $sql) {
                try {
                    DB::statement($sql);
                    $this->line("✓ Created index on {$table}.{$column}");
                } catch (\Exception $e) {
                    $this->warn("⚠ Index on {$table}.{$column} already exists or failed: " . $e->getMessage());
                }
            }
        }
    }

    private function analyzeTables()
    {
        $this->info('Analyzing tables for better query planning...');

        $tables = [
            'orders', 'menu_items', 'restaurants', 'payments', 'kots',
            'order_items', 'customers', 'branches', 'users'
        ];

        foreach ($tables as $table) {
            try {
                DB::statement("ANALYZE TABLE {$table}");
                $this->line("✓ Analyzed table: {$table}");
            } catch (\Exception $e) {
                $this->warn("⚠ Failed to analyze table {$table}: " . $e->getMessage());
            }
        }
    }
} 