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
        Schema::create('sort_of_employments', function (Blueprint $table) {
            $table->id();
            $table->string('name');  // Description or title of the employment sort
            $table->unsignedBigInteger('kind_of_employment_id');  // Foreign key to kind_of_employments
            $table->foreign('kind_of_employment_id')->references('id')->on('kind_of_employments')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sort_of_employments');
    }
};
