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
        Schema::create('columns', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->enum('text_direction', ['vertical', 'horizontal']);
            $table->integer('min_width');
            $table->integer('max_text_width');
            $table->integer('font_size');
            $table->boolean('is_active_for_finals')->default(false);
            $table->unsignedBigInteger('tableheader_id');
            $table->unsignedBigInteger('parent_id')->nullable();
            $table->timestamps();

            // Define the foreign key constraints
            $table->foreign('tableheader_id')->references('id')->on('tableheaders')->onDelete('cascade');
            $table->foreign('parent_id')->references('id')->on('columns')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('columns');
    }
};
