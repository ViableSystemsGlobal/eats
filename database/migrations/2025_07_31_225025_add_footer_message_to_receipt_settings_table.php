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
        Schema::table('receipt_settings', function (Blueprint $table) {
            $table->text('footer_message')->nullable()->after('show_payment_details');
            $table->string('footer_image')->nullable()->after('footer_message');
            $table->boolean('show_footer_image')->default(false)->after('footer_image');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('receipt_settings', function (Blueprint $table) {
            $table->dropColumn(['footer_message', 'footer_image', 'show_footer_image']);
        });
    }
};
