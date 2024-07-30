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
        Schema::create('youth_activity_locations', function (Blueprint $table) {
            $table->id();
            $table->string('location');
            
            $table->timestamps();
            
        });

        Schema::create('youth_activities', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->foreignId('type_id')->constrained('youth_activity_types')->onDelete('cascade');
            $table->foreignId('location_id')->nullable()->constrained('youth_activity_locations')->onDelete('cascade');
            $table->text('note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('youth_activities');
        Schema::dropIfExists('youth_activity_locations');
    }
};
