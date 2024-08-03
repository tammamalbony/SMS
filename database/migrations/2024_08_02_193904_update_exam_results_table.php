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
        Schema::table('exam_results', function (Blueprint $table) {
            // Drop the existing foreign key constraint for exam_id
            $table->dropForeign(['exam_id']);
            $table->dropColumn('exam_id');

            // Add the new part_id column
            $table->foreignId('part_id')->after('id')->constrained('parts');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('exam_results', function (Blueprint $table) {
            // Drop the foreign key constraint for part_id
            $table->dropForeign(['part_id']);
            $table->dropColumn('part_id');

            // Add the exam_id column back
            $table->foreignId('exam_id')->after('id')->constrained();
        });
    }
};
