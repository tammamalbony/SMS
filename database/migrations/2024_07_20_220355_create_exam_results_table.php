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
        Schema::create('exam_results', function (Blueprint $table) {
            $table->id();
            $table->foreignId('exam_id')->constrained()->onDelete('cascade');
            $table->foreignId('class_id')->constrained('classs_school_years')->onDelete('cascade');
            $table->foreignId('verified_student_id')->constrained('verified_students')->onDelete('cascade');
            $table->foreignId('subject_detail_id')->constrained('c_s_y_s_detail')->onDelete('cascade'); 
            $table->decimal('max_grade', 5, 2);
            $table->decimal('failing_grade', 5, 2);
            $table->decimal('value', 5, 2);
            $table->boolean('subject_is_failing');
            $table->boolean('islocked');
            $table->boolean('isverfied');
            $table->integer('atemptes');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_results');
    }
};
