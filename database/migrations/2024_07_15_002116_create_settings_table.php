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
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->enum('page', ['general', 'financial', 'personalization', 'notifications', 'seo', 'customization', 'other'])->default('other');
            $table->string('name');
            $table->timestamps();
            
            $table->index('name');
        });

        Schema::create('setting_translations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('setting_id');
            $table->string('locale');
            $table->longText('value');
            $table->timestamps();

            $table->foreign('setting_id')->references('id')->on('settings')->onDelete('cascade');
            $table->index(['setting_id', 'locale']);
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('setting_translations', function (Blueprint $table) {
            $table->dropForeign(['setting_id']);
        });
        
        Schema::dropIfExists('setting_translations');
        Schema::dropIfExists('settings');

    }
};
