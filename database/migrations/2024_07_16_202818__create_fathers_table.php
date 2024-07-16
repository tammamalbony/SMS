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
        Schema::create('fathers', function (Blueprint $table) {
            $table->id();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('name');
            $table->string('name_en');
            $table->string('last_name');
            $table->string('job');
            $table->string('job_en');
            $table->string('national_id');
            $table->string('passport_id');
            $table->string('phone');
            $table->unsignedBigInteger('nationality_id');
            $table->unsignedBigInteger('blood_type_id');
            $table->unsignedBigInteger('religion_id');
            $table->text('address');
            $table->timestamps();

            // Setting up foreign key constraints
            $table->foreign('nationality_id')->references('id')->on('nationalities')
                  ->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('blood_type_id')->references('id')->on('blood_types')
                  ->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('religion_id')->references('id')->on('religions')
                  ->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('fathers', function (Blueprint $table) {
            // Drop foreign key constraints
            $table->dropForeign(['nationality_id']);
            $table->dropForeign(['blood_type_id']);
            $table->dropForeign(['religion_id']);
        });

        Schema::dropIfExists('fathers');
    }
};
