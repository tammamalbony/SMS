<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SectionTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('section_types')->insert([
            ['name' => 'مختلط'],
            ['name' => 'بنين'],
            ['name' => 'بنات'],
        ]);
    }
}
