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
        Schema::create('question_option_relations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('question_id')->references('id')->on('school_questions')->onDelete('cascade');
            $table->foreignId('option_id')->references('id')->on('question_options')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('question_option_relations');
    }
};
