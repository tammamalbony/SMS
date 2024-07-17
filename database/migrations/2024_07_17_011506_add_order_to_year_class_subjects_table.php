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
        Schema::table('c_s_y_s_detail', function (Blueprint $table) {
            $table->integer('order')->after('subject_detail_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('c_s_y_s_detail', function (Blueprint $table) {
            $table->dropColumn('order');
        });
    }
};
