<?php

namespace Database\Seeders;

use Carbon\Carbon;
use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SubjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subjects = [
            ['id' => 1, 'name_ar' => 'التربية الدينية', 'name_en' => 'ISL1', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 2, 'name_ar' => 'اللغة العربية', 'name_en' => 'ar', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 3, 'name_ar' => 'المهارات الشفوية', 'name_en' => 'ar11', 'order' => 0, 'parent_id' => 2, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 4, 'name_ar' => 'المهارات الكتابية', 'name_en' => 'ar12', 'order' => 0, 'parent_id' => 2, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 5, 'name_ar' => 'اللغة الأجنبية', 'name_en' => 'EN', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 6, 'name_ar' => 'الرياضيات', 'name_en' => 'MATH', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 7, 'name_ar' => 'الدراسات الإجتماعية', 'name_en' => 'IS', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 8, 'name_ar' => 'العلوم و التربية الصحية', 'name_en' => 'ALM', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 9, 'name_ar' => 'التربية الفنية البصرية والجمالية', 'name_en' => 'ART', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 10, 'name_ar' => 'التربية البدنية و الرياضة', 'name_en' => 'SPORT', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 11, 'name_ar' => 'التربية الزراعية', 'name_en' => 'AGR', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 12, 'name_ar' => 'المشروع', 'name_en' => 'pr', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 13, 'name_ar' => 'السلوك', 'name_en' => 'SL', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 14, 'name_ar' => 'النشاط المدرسي و الطلائع', 'name_en' => 'NST', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 16, 'name_ar' => 'التربية المهنية', 'name_en' => 'MHN', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 18, 'name_ar' => 'اللغة الإنجليزية', 'name_en' => 'EN', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 19, 'name_ar' => 'اللغة الفرنسية / الروسية', 'name_en' => 'FR/RUS', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 20, 'name_ar' => 'العلوم العامة', 'name_en' => 'SI', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 21, 'name_ar' => 'تكنولوجيا المعلومات والاتصالات', 'name_en' => 'INF', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 22, 'name_ar' => 'التربية الموسيقية', 'name_en' => 'MUS', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 23, 'name_ar' => 'التربية الوطنية', 'name_en' => 'WAT', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 24, 'name_ar' => 'التاريخ', 'name_en' => 'HIST', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 25, 'name_ar' => 'الجغرافية', 'name_en' => 'GEO', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 26, 'name_ar' => 'الفلسفة والعلوم الإنسانية', 'name_en' => 'FALS', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 27, 'name_ar' => 'الفيزياء', 'name_en' => 'FIS', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 28, 'name_ar' => 'الكيمياء', 'name_en' => 'KEM', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 29, 'name_ar' => 'علم الأحياء والبيئة', 'name_en' => 'ALOM', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 30, 'name_ar' => 'الرياضيات / الاحصاء والاحتمال', 'name_en' => 'MATH/11L', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 31, 'name_ar' => 'قضايا فلسفية وإجتماعية ونفسية', 'name_en' => 'PHLS', 'order' => 0, 'parent_id' => NULL, 'note' => NULL, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
        ];

        DB::table('subjects')->insert($subjects);
    }
}
