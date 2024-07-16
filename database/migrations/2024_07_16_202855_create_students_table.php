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
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->string('first_name')->comment('الاسم الأول');
            $table->string('last_name')->comment('الاسم الأخير');
            $table->string('name_ar')->comment('الاسم باللغة العربية');
            $table->string('name_en')->comment('الاسم باللغة الانجليزية');
            $table->string('email')->unique()->comment('البريد الإلكتروني');
            $table->string('password')->comment('كلمة المرور');
            $table->date('birthdate')->comment('تاريخ الميلاد');
            $table->enum('gender', ['male', 'female'])->comment('الجنس');
            $table->unsignedBigInteger('nationality_id')->comment('الجنسية');
            $table->unsignedBigInteger('blood_type_id')->comment('فصيلة الدم');
            $table->unsignedBigInteger('religion_id')->comment('الديانة');
            $table->string('national_id')->unique()->comment('الرقم الوطني');
            $table->string('passport_id')->unique()->comment('رقم جواز السفر');
            $table->string('phone')->comment('رقم الهاتف');
            $table->string('mobile')->comment('رقم الموبايل');
            $table->unsignedBigInteger('father_id')->comment('الأب');
            $table->unsignedBigInteger('mother_id')->comment('الأم');
            $table->string('record_place')->comment('مكان القيد');
            $table->string('record_id')->comment('رقم القيد');
            $table->timestamps();

            // Foreign key constraints
            $table->foreign('nationality_id')->references('id')->on('nationalities')->onDelete('restrict');
            $table->foreign('blood_type_id')->references('id')->on('blood_types')->onDelete('restrict');
            $table->foreign('religion_id')->references('id')->on('religions')->onDelete('restrict');
            $table->foreign('father_id')->references('id')->on('fathers')->onDelete('cascade');
            $table->foreign('mother_id')->references('id')->on('wives')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
