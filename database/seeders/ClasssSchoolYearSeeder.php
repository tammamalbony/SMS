<?php

namespace Database\Seeders;

use Carbon\Carbon;
use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ClasssSchoolYearSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $classsSchoolYears = [
            ['id' => 1, 'classs_id' => 1, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 2, 'classs_id' => 2, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 3, 'classs_id' => 3, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 4, 'classs_id' => 4, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 5, 'classs_id' => 5, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 6, 'classs_id' => 6, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 7, 'classs_id' => 7, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 8, 'classs_id' => 8, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 9, 'classs_id' => 9, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 10, 'classs_id' => 10, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 11, 'classs_id' => 11, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 12, 'classs_id' => 12, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 13, 'classs_id' => 13, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 14, 'classs_id' => 14, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 15, 'classs_id' => 15, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 16, 'classs_id' => 16, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 17, 'classs_id' => 17, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 18, 'classs_id' => 18, 'school_year_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],

            
        ];
        DB::table('classses_school_year')->insert($classsSchoolYears);
    }
}
