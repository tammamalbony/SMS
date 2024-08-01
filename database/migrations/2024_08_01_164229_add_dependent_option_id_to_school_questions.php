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
        Schema::table('school_questions', function (Blueprint $table) {
            $table->unsignedBigInteger('dependent_option_id')->nullable()->after('order');
            $table->foreign('dependent_option_id')->references('id')->on('question_options')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('school_questions', function (Blueprint $table) {
            $table->dropForeign(['dependent_option_id']);
            $table->dropColumn('dependent_option_id');
        });
    }
};
