<?php

namespace Database\Seeders;

use Carbon\Carbon;
use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SubjectDetailSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subjectDetails = [
            ['id' => 1, 'subject_id' => 1, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 2, 'subject_id' => 3, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 3, 'subject_id' => 4, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 5, 'subject_id' => 5, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 6, 'subject_id' => 6, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 7, 'subject_id' => 8, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 8, 'subject_id' => 7, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 9, 'subject_id' => 9, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 10, 'subject_id' => 10, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 11, 'subject_id' => 11, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 0, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 12, 'subject_id' => 12, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 13, 'subject_id' => 13, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 14, 'subject_id' => 14, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 15, 'subject_id' => 16, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 16, 'subject_id' => 1, 'max_grade' => 200, 'failing_grade' => 99, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 17, 'subject_id' => 2, 'max_grade' => 600, 'failing_grade' => 300, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 18, 'subject_id' => 18, 'max_grade' => 400, 'failing_grade' => 200, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 19, 'subject_id' => 19, 'max_grade' => 300, 'failing_grade' => 150, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 20, 'subject_id' => 7, 'max_grade' => 600, 'failing_grade' => 300, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 21, 'subject_id' => 6, 'max_grade' => 600, 'failing_grade' => 300, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 22, 'subject_id' => 21, 'max_grade' => 200, 'failing_grade' => 100, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 23, 'subject_id' => 22, 'max_grade' => 200, 'failing_grade' => 100, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 24, 'subject_id' => 22, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 1, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 25, 'subject_id' => 9, 'max_grade' => 200, 'failing_grade' => 100, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 26, 'subject_id' => 10, 'max_grade' => 200, 'failing_grade' => 100, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 27, 'subject_id' => 12, 'max_grade' => 200, 'failing_grade' => 100, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 28, 'subject_id' => 16, 'max_grade' => 200, 'failing_grade' => 100, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 29, 'subject_id' => 13, 'max_grade' => 200, 'failing_grade' => 100, 'is_failing' => 1, 'is_active' => 1, 'grade_id' => 2, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 30, 'subject_id' => 1, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 0, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 31, 'subject_id' => 2, 'max_grade' => 500, 'failing_grade' => 250, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 32, 'subject_id' => 18, 'max_grade' => 400, 'failing_grade' => 80, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 33, 'subject_id' => 19, 'max_grade' => 300, 'failing_grade' => 60, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 34, 'subject_id' => 23, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 35, 'subject_id' => 24, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 36, 'subject_id' => 25, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 37, 'subject_id' => 26, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 38, 'subject_id' => 6, 'max_grade' => 400, 'failing_grade' => 80, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 39, 'subject_id' => 21, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 40, 'subject_id' => 27, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 41, 'subject_id' => 28, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 42, 'subject_id' => 29, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 43, 'subject_id' => 9, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 44, 'subject_id' => 10, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 45, 'subject_id' => 12, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 46, 'subject_id' => 13, 'max_grade' => 200, 'failing_grade' => 140, 'is_failing' => 1, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 47, 'subject_id' => 2, 'max_grade' => 500, 'failing_grade' => 200, 'is_failing' => 0, 'is_active' => 0, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 48, 'subject_id' => 2, 'max_grade' => 600, 'failing_grade' => 300, 'is_failing' => 1, 'is_active' => 0, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 49, 'subject_id' => 24, 'max_grade' => 300, 'failing_grade' => 60, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 50, 'subject_id' => 25, 'max_grade' => 300, 'failing_grade' => 60, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 51, 'subject_id' => 26, 'max_grade' => 400, 'failing_grade' => 80, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 52, 'subject_id' => 30, 'max_grade' => 100, 'failing_grade' => 20, 'is_failing' => 0, 'is_active' => 0, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 53, 'subject_id' => 2, 'max_grade' => 400, 'failing_grade' => 160, 'is_failing' => 1, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 54, 'subject_id' => 18, 'max_grade' => 300, 'failing_grade' => 60, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 55, 'subject_id' => 19, 'max_grade' => 200, 'failing_grade' => 40, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 56, 'subject_id' => 6, 'max_grade' => 600, 'failing_grade' => 120, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 57, 'subject_id' => 27, 'max_grade' => 300, 'failing_grade' => 60, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 58, 'subject_id' => 29, 'max_grade' => 300, 'failing_grade' => 60, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 59, 'subject_id' => 19, 'max_grade' => 400, 'failing_grade' => 80, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 60, 'subject_id' => 31, 'max_grade' => 400, 'failing_grade' => 80, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 3, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 61, 'subject_id' => 1, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 0, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 62, 'subject_id' => 3, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 63, 'subject_id' => 4, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 64, 'subject_id' => 5, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 65, 'subject_id' => 6, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 66, 'subject_id' => 7, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 67, 'subject_id' => 8, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 68, 'subject_id' => 22, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 69, 'subject_id' => 9, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 70, 'subject_id' => 10, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 71, 'subject_id' => 11, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 0, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 72, 'subject_id' => 12, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 73, 'subject_id' => 13, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['id' => 74, 'subject_id' => 14, 'max_grade' => 100, 'failing_grade' => 50, 'is_failing' => 0, 'is_active' => 1, 'grade_id' => 4, 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
        ];
        DB::table('subject_details')->insert($subjectDetails);
    }
}
