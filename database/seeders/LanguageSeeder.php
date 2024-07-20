<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LanguageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('languages')->insert([
            [
                'name' => 'اللغة الإنجليزية',
                'short_name' => 'ك',
                'created_at' => '2024-07-17 06:33:59',
                'updated_at' => '2024-07-17 06:35:10',
            ],
            [
                'name' => 'اللغة العربية',
                'short_name' => 'ف',
                'created_at' => '2024-07-17 06:35:29',
                'updated_at' => '2024-07-17 06:35:29',
            ],
            [
                'name' => 'الروسية',
                'short_name' => 'الروسية',
                'created_at' => '2024-07-17 06:35:40',
                'updated_at' => '2024-07-17 06:35:40',
            ],
        ]);
    }
}
