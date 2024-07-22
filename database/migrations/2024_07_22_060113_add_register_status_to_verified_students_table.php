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
            $table->enum('register_status', ['waiting', 'normal', 'pending', 'graduated', 'moved', 'else'])
                  ->default('normal')
                  ->after('status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('verified_students', function (Blueprint $table) {
            // Dropping the enum column
            $table->dropColumn('register_status');
        });
    }
};
