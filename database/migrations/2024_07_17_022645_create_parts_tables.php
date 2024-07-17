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
            $table->foreignId('mark_review_id')->nullable()->constrained('mark_reviews')->onDelete('set null');
            $table->string('name'); // Part name
            $table->decimal('value', 10, 2)->nullable();
            $table->string('operation')->nullable();;// e.g., 'add', 'subtract', 'multiply', 'divide'
            $table->boolean('is_final_result')->nullable();
            $table->boolean('max_per_cent')->nullable();
            $table->boolean('has_mark_review')->nullable();
            $table->boolean('is_semi_final_result')->nullable();
            $table->boolean('is_result_part')->default(false); // Indicates if this part contributes to the result
            $table->boolean('is_sealed')->default(false); // Indicates if this part is sealed
            $table->boolean('is_visible')->default(true); // Indicates if this part is visible
            $table->boolean('is_active')->default(true); // Indicates if this part is active
            $table->boolean('must_be_calculated')->default(false); // Indicates if this part must be calculated
            $table->boolean('must_be_ceiled')->default(false); // Indicates if this part's value should be ceiled to the upper integer
            $table->timestamps();
        });

        Schema::create('part_operations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('part_id')->constrained('parts')->onDelete('cascade');
            $table->foreignId('operand_part_id')->constrained('parts')->onDelete('cascade');
            $table->string('operation'); // e.g., 'add', 'subtract', 'multiply', 'divide'
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('part_operations');
        Schema::dropIfExists('parts');
    }
};
