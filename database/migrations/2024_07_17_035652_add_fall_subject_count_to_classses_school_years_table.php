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
        Schema::table('classses_school_years', function (Blueprint $table) {
            $table->unsignedInteger('fall_subject_count')->default(0)->after('school_year_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('classses_school_years', function (Blueprint $table) {
            $table->dropColumn('fall_subject_count');
        });
    }
};
