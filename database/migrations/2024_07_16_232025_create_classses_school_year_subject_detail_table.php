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
        Schema::create('c_s_y_s_detail', function (Blueprint $table) {
            $table->id();
            $table->foreignId('c_s_y_id')->constrained('classs_school_years')->onDelete('cascade');
            $table->foreignId('subject_detail_id')->constrained('subject_details')->onDelete('cascade');
            $table->timestamps();

            $table->unique(['c_s_y_id', 'subject_detail_id']);
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('c_s_y_s_detail');
    }
};
