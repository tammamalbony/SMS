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
        Schema::create('wives', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('father_id');
            $table->string('name');
            $table->string('name_en');
            $table->string('job');
            $table->string('job_en');
            $table->string('national_id');
            $table->string('passport_id');
            $table->string('phone');
            $table->unsignedBigInteger('nationality_id');
            $table->unsignedBigInteger('blood_type_id');
            $table->unsignedBigInteger('religion_id');
            $table->timestamps();

            // Foreign key constraints
            $table->foreign('father_id')->references('id')->on('fathers')->onDelete('cascade');
            $table->foreign('nationality_id')->references('id')->on('nationalities')->onDelete('restrict');
            $table->foreign('blood_type_id')->references('id')->on('blood_types')->onDelete('restrict');
            $table->foreign('religion_id')->references('id')->on('religions')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('wives', function (Blueprint $table) {
            $table->dropForeign(['father_id']);
            $table->dropForeign(['nationality_id']);
            $table->dropForeign(['blood_type_id']);
            $table->dropForeign(['religion_id']);
        });

        Schema::dropIfExists('wives');
    }
};
