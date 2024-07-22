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
        Schema::table('verified_students', function (Blueprint $table) {
            $table->string('general_record')->nullable()->after('status');
            $table->unsignedBigInteger('language_id')->nullable()->after('general_record');
            $table->foreign('language_id')->references('id')->on('languages')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('verified_students', function (Blueprint $table) {
            $table->dropForeign(['foreign_language_id']);
            $table->dropColumn('general_record');
            $table->dropColumn('foreign_language_id');
        });
    }
};
