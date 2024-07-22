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
            $table->string('short_name')->nullable()->after('exam_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
      
        Schema::table('exam_results', function (Blueprint $table) {
            $table->dropColumn('short_name');
        });
    }
};
