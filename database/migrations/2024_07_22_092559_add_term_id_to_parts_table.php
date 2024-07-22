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
        Schema::table('parts', function (Blueprint $table) {
            $table->foreignId('term_id')->nullable()->constrained('terms')->onDelete('set null');
            $table->boolean('is_in_results')->default(true);
            $table->boolean('is_in_final')->default(true);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('parts', function (Blueprint $table) {
            $table->dropForeign(['term_id']);
            $table->dropColumn('term_id');
            $table->dropColumn('is_in_results');
            $table->dropColumn('is_in_final');
            
        });
    }
};
