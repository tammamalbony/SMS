<?php

namespace Database\Seeders;

use Carbon\Carbon;
use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class GradesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
    */
    public function run(): void
    {
        DB::table('grades')->insert([
            [
                'id' => 1,
                'grade_name_ar' => 'مرحلة التعليم الاساسي الحلقة الاولى',
                'grade_name_en' => 'Primary stage',
                'grade_notes' => NULL,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 2,
                'grade_name_ar' => 'مرحلة التعليم الاساسي الحلقة الثانية',
                'grade_name_en' => 'Mid school',
                'grade_notes' => NULL,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 3,
                'grade_name_ar' => 'مرحلة التعليم الثانوي العام',
                'grade_name_en' => 'hs',
                'grade_notes' => NULL,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ]);
    }
}
