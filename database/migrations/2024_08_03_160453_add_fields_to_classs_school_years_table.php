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
        Schema::table('classs_school_years', function (Blueprint $table) {
            $table->boolean('is_final_result_failing')->default(false);
            $table->integer('min_required_result')->unsigned()->nullable();
            $table->boolean('is_attendance_required')->default(false);
            $table->integer('min_required_attendance_percent')->unsigned()->nullable();
            $table->boolean('help_for_subjects')->default(false);
            $table->foreignId('learning_type_id')->nullable()->constrained('learning_types')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('classs_school_years', function (Blueprint $table) {
            $table->dropColumn('is_final_result_failing');
            $table->dropColumn('min_required_result');
            $table->dropColumn('is_attendance_required');
            $table->dropColumn('min_required_attendance_percent');
            $table->dropColumn('help_for_subjects');
            $table->dropForeign(['learning_type_id']);
            $table->dropColumn('learning_type_id');
        });
    }
};
