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
        Schema::table('section_teacher', function (Blueprint $table) {
            $table->foreignId('year_class_subject_id')->nullable()->constrained('c_s_y_s_detail')->onDelete('cascade')->after('teacher_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('section_teacher', function (Blueprint $table) {
            $table->dropForeign(['year_class_subject_id']);
            $table->dropColumn('year_class_subject_id');
        });
    }
};
