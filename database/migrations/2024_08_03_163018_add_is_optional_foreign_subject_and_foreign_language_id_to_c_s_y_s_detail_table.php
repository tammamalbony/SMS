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
        Schema::table('c_s_y_s_detail', function (Blueprint $table) {
            $table->boolean('is_optional_foreign_subject')->default(false);
            $table->foreignId('foreign_language_id')->nullable()->constrained('languages')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('c_s_y_s_detail', function (Blueprint $table) {
            $table->dropColumn('is_optional_foreign_subject');
            $table->dropForeign(['foreign_language_id']);
            $table->dropColumn('foreign_language_id');
        });
    }
};
