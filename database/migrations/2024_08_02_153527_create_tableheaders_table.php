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
        Schema::create('tableheaders', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('class_id');
            $table->integer('min_height');
            $table->integer('max_width');
            $table->integer('left_margin');
            $table->timestamps();

            // Define the foreign key constraint
            $table->foreign('class_id')->references('id')->on('classses')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tableheaders');
    }
};
