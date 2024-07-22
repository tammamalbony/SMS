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
        Schema::create('collaboration_and_activities', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('verified_student_id');
            $table->decimal('value', 8, 2);
            $table->text('note')->nullable();
            $table->timestamps();

            // Foreign key constraint
            $table->foreign('verified_student_id')->references('id')->on('verified_students')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('collaboration_and_activities');
    }
};
