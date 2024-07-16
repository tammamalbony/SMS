<?php

namespace Database\Seeders;

use App\Models\SchoolYear;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SchoolYearTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        SchoolYear::insert([  ['id' => 1, 'name' => 'العام الدراسي الأول', 'start_year' => '08/2022', 'end_year' => '07/2023','is_active'=> true]]);
    }
}
