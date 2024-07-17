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
        Schema::create('parts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('year_class_subject_id')->constrained('c_s_y_s_detail')->onDelete('cascade');
            $table->decimal('value', 10, 2)->nullable();
            $table->string('calculation_formula')->nullable(); // e.g., "part1 + part2 * 0.5"
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parts');
    }
};
