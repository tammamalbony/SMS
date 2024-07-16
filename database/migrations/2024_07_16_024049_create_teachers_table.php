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
        Schema::create('teachers', function (Blueprint $table) {
            $table->id();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('name_ar');
            $table->string('name_en');
            $table->string('mother');
            $table->unsignedBigInteger('specialization_id');
            $table->unsignedBigInteger('gender_id');
            $table->unsignedTinyInteger('marital_status');
            $table->date('birthdate');
            $table->string('address_birth');
            $table->string('add_num')->unique();
            $table->string('tel');
            $table->string('mobile');
            $table->string('gern');
            $table->string('religion');
            $table->string('work_type');
            $table->date('joining_date');
            $table->text('address');
            $table->string('address_fixed');
            $table->string('state');
            $table->string('certificates');
            $table->string('highest_cert');
            $table->date('date_obtained');
            $table->decimal('salary', 8, 2);
            $table->string('type_job');
            $table->string('type_dis');
            $table->unsignedTinyInteger('type_of_job');
            $table->string('cityI');
            $table->date('date_admin_work');
            $table->string('belongs_him');
            $table->string('subjet');
            $table->unsignedInteger('quorum_hours')->default(0);
            $table->unsignedInteger('e_quorum_hours')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('teachers');
    }
};
