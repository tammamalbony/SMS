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
            $table->timestamp('confirm_register_date')->nullable()->after('register_status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('verified_students', function (Blueprint $table) {
            $table->dropColumn('confirm_register_date');
        });
    }
};
