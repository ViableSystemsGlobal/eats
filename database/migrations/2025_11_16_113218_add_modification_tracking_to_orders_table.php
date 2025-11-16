<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->timestamp('last_modified_at')->nullable()->after('updated_at');
            $table->foreignId('last_modified_by')->nullable()->after('last_modified_at')->constrained('users')->onDelete('set null');
            $table->integer('modification_count')->default(0)->after('last_modified_by');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropForeign(['last_modified_by']);
            $table->dropColumn(['last_modified_at', 'last_modified_by', 'modification_count']);
        });
    }
};
