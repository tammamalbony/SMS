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
        Schema::create('schools', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('statistical_number');
            $table->string('school_name');
            $table->unsignedTinyInteger('type_of_education');
            $table->boolean('typeB')->default(false);
            $table->boolean('kindergarten')->default(false);
            $table->boolean('education_p')->default(false);
            $table->boolean('education_p1')->default(false);
            $table->boolean('education_s')->default(false);
            $table->string('school_state');
            $table->string('school_city');
            $table->string('school_region');
            $table->string('school_village')->nullable();
            $table->string('school_Neigh')->nullable();
            $table->unsignedTinyInteger('Admin_division');
            $table->unsignedTinyInteger('School_gender');
            $table->boolean('School_build')->default(false);
            $table->unsignedTinyInteger('School_access');
            $table->boolean('Shared_construction')->default(false);
            $table->unsignedTinyInteger('School_type');
            $table->unsignedTinyInteger('type_of_attend');
            $table->unsignedTinyInteger('build_m');
            $table->unsignedTinyInteger('build_t');
            $table->unsignedInteger('build_class')->nullable();
            $table->unsignedInteger('build_area')->nullable();
            $table->unsignedInteger('count_floor')->nullable();
            $table->unsignedInteger('count_build')->nullable();
            $table->unsignedInteger('petrol_count')->nullable();
            $table->unsignedInteger('petrol_cap')->nullable();
            $table->unsignedInteger('internet_coount')->nullable();
            $table->string('internet_type')->nullable();
            $table->unsignedTinyInteger('electric_type');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('schools');
    }
};
