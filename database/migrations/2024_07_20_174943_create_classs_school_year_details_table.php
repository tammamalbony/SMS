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
        Schema::create('classs_school_year_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('classs_school_year_id')->constrained()->onDelete('cascade');
            $table->integer('first_term_days')->nullable();
            $table->integer('second_term_days')->nullable();
            $table->text('note')->nullable();
            $table->integer('max_students')->nullable();
            $table->boolean('status')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('classs_school_year_details');
    }
};
