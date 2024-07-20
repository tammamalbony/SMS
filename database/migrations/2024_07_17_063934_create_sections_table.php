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
         // Create section_types table
         Schema::create('section_types', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->timestamps();
        });

        // Create sections table
        Schema::create('sections', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('classs_school_year_id');
            $table->unsignedBigInteger('section_type_id');
            $table->unsignedBigInteger('teacher_id');
            $table->string('name');
            $table->timestamps();

            // Foreign key constraints
            $table->foreign('classs_school_year_id')->references('id')->on('classs_school_years')->onDelete('cascade');
            $table->foreign('section_type_id')->references('id')->on('section_types')->onDelete('cascade');
            $table->foreign('teacher_id')->references('id')->on('teachers')->onDelete('cascade');
        });
        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {

        Schema::table('sections', function (Blueprint $table) {
            $table->dropForeign(['classs_school_year_id']);
            $table->dropForeign(['section_type_id']);
            $table->dropForeign(['teacher_id']);
        });

        // Drop sections table
        Schema::dropIfExists('sections');

        // Drop section_types table
        Schema::dropIfExists('section_types');


    }
};
