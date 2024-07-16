<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ReligionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $religions = [
            ['name' => 'مسلم'],
            ['name' => 'مسيحي'],
            ['name' => 'غيرذلك'],
        ];

        DB::table('religions')->insert($religions);
    }
}
