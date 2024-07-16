<?php

namespace Database\Seeders;

use Carbon\Carbon;
use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ClassesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('classses')->insert([
            [
                'id' => 1,
                'grade_id' => 1,
                'class_name_ar' => 'الأول',
                'class_name_en' => 'First',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 2,
                'grade_id' => 1,
                'class_name_ar' => 'الثاني',
                'class_name_en' => 'Second grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 3,
                'grade_id' => 1,
                'class_name_ar' => 'الثالث',
                'class_name_en' => 'Third grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 4,
                'grade_id' => 1,
                'class_name_ar' => 'الرابع',
                'class_name_en' => 'Fourth grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 5,
                'grade_id' => 1,
                'class_name_ar' => 'الخامس',
                'class_name_en' => 'Fifth grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 6,
                'grade_id' => 1,
                'class_name_ar' => 'السادس',
                'class_name_en' => 'Sixth grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 7,
                'grade_id' => 2,
                'class_name_ar' => 'السابع',
                'class_name_en' => 'Seventh grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 8,
                'grade_id' => 2,
                'class_name_ar' => 'الثامن',
                'class_name_en' => 'Eighth grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 9,
                'grade_id' => 2,
                'class_name_ar' => 'التاسع',
                'class_name_en' => 'Ninth grade',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 10,
                'grade_id' => 3,
                'class_name_ar' => 'الأول الثانوي العام - الفرع العلمي',
                'class_name_en' => 'sc1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 11,
                'grade_id' => 3,
                'class_name_ar' => 'الثاني الثانوي العام - الفرع العلمي',
                'class_name_en' => 'sc2',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 12,
                'grade_id' => 3,
                'class_name_ar' => 'الثالث الثانوي العام - الفرع العلمي',
                'class_name_en' => 'sc3',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 13,
                'grade_id' => 3,
                'class_name_ar' => 'الأول الثانوي العام - الفرع الادبي',
                'class_name_en' => 'li1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 14,
                'grade_id' => 3,
                'class_name_ar' => 'الثاني الثانوي العام - الفرع الادبي',
                'class_name_en' => 'li2',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 15,
                'grade_id' => 3,
                'class_name_ar' => 'الثالث الثانوي العام - الفرع الادبي',
                'class_name_en' => 'li3',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 16,
                'grade_id' => 4,
                'class_name_ar' => 'فئة ب مستوى 1',
                'class_name_en' => 'B1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 17,
                'grade_id' => 4,
                'class_name_ar' => 'فئة ب مستوى 2',
                'class_name_en' => 'B2',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 18,
                'grade_id' => 4,
                'class_name_ar' => 'فئة ب مستوى 3',
                'class_name_en' => 'B3',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ]);
    }
}
