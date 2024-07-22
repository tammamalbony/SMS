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
       
        Schema::table('subject_details', function (Blueprint $table) {
            $table->integer('min_grade')->default(0)->after('max_grade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('subject_details', function (Blueprint $table) {
            $table->dropColumn('min_grade');
        });
    }
};
