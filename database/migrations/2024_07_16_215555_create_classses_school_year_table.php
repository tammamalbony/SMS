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
        Schema::create('classs_school_years', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('classs_id');
            $table->unsignedBigInteger('school_year_id');
            $table->timestamps();

            $table->foreign('classs_id')->references('id')->on('classses')->onDelete('cascade');
            $table->foreign('school_year_id')->references('id')->on('school_years')->onDelete('cascade');

            $table->unique(['classs_id', 'school_year_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('classs_school_years');
    }
};
