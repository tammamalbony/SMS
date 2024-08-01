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
        Schema::table('grades', function (Blueprint $table) {
            // Add stage_id without a foreign key constraint initially
            $table->unsignedBigInteger('stage_id')->after('id');
        });
        DB::table('grades')->update(['stage_id' => 4]);

        Schema::table('grades', function (Blueprint $table) {
            // Apply foreign key constraint after all values have been set
            $table->foreign('stage_id')->references('id')->on('stages')->onDelete('cascade');
            $table->foreignId('parent_id')->nullable()->constrained('grades')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('grades', function (Blueprint $table) {
            $table->dropForeign(['stage_id']);
            $table->dropColumn('stage_id');
            $table->dropForeign(['parent_id']);
            $table->dropColumn('parent_id');
        });
    }
};
