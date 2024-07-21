<?php

namespace App\Helpers;
use App\Models\ExamResult;

if (!function_exists('findOrCreateExamResult')) {
    /**
     * Check if an exam result exists by subject_detail_id and class_id.
     * If it exists, return the result. If not, create one and return it.
     *
     * @param int $subjectDetailId
     * @param int $classId
     * @param int $examId
     * @param int $verifiedStudentId
     * @param array $attributes
     * @return ExamResult
     */
    if (!function_exists('getExamResult')) {
        /**
         * Check if an exam result exists by subject_detail_id and class_id.
         * If it exists, return the result. If not, return null.
         *
         * @param int $subjectDetailId
         * @param int $classId
         * @param int $examId
         * @param int $verifiedStudentId
         * @return ExamResult|null
         */
        function getExamResult($subjectDetailId, $classId, $examId, $verifiedStudentId)
        {
            return ExamResult::where('subject_detail_id', $subjectDetailId)
                ->where('class_id', $classId)
                ->where('exam_id', $examId)
                ->where('verified_student_id', $verifiedStudentId)
                ->first();
        }
    }
}
