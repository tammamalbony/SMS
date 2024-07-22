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
        Schema::table('schools', function (Blueprint $table) {
            $table->string('manager_name')->nullable()->after('electric_type');
            $table->string('mobile')->nullable()->after('manager_name');
            $table->string('telephone')->nullable()->after('mobile');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('schools', function (Blueprint $table) {
            $table->dropColumn('manager_name');
            $table->dropColumn('mobile');
            $table->dropColumn('telephone');
        });
    }
};
