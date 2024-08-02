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
        Schema::table('columns', function (Blueprint $table) {
            $table->unsignedBigInteger('term_id')->nullable()->after('parent_id');
            $table->boolean('is_final')->default(false)->after('term_id');
            $table->integer('order')->default(0)->after('is_final');
            $table->foreign('term_id')->references('id')->on('terms')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('columns', function (Blueprint $table) {
            $table->dropForeign(['term_id']);
            $table->dropColumn('term_id');
            $table->dropColumn('is_final');
            $table->dropColumn('order');
        });
    }
};
