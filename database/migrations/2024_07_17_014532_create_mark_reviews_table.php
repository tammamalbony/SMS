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
        Schema::create('mark_reviews', function (Blueprint $table) {
            $table->id();
            $table->decimal('min_mark', 5, 2); // Minimum mark
            $table->decimal('max_mark', 5, 2); // Maximum mark
            $table->string('result'); // Result (e.g., "Pass", "Fail")
            $table->string('color'); // Color for the result (e.g., "#ff0000" for red)
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mark_reviews');
    }
};
