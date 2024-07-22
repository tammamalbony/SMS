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
        Schema::create('book_verified_student', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('verified_student_id');
            $table->unsignedBigInteger('book_id');
            $table->timestamps();

            $table->foreign('verified_student_id')->references('id')->on('verified_students')->onDelete('cascade');
            $table->foreign('book_id')->references('id')->on('books')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('book_verified_student');
    }
};
