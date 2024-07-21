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
        Schema::create('svg_ids', function (Blueprint $table) {
            $table->id();
            $table->foreignId('exam_id')->constrained()->onDelete('cascade');
            $table->foreignId('classs_school_years_id')->constrained('classs_school_years')->onDelete('cascade');
            $table->foreignId('subject_detail_id')->constrained('subject_details')->onDelete('cascade');
            $table->string('svg_id');
            $table->string('name')->nullable();
            $table->text('note')->nullable();
            $table->integer('max_width')->nullable();
            $table->integer('max_height')->nullable();
            $table->string('font_size')->nullable();
            $table->string('fill_color')->nullable();
            $table->string('anchortext')->nullable();
            $table->string('transform')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('svg_ids');
    }
};
