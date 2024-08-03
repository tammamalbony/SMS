<?php

namespace App\Models;

use App\Models\ExamResult;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exam extends Model
{
    use HasFactory;

    protected $fillable = [
        'classs_school_year_id',
        'title',
        'max_degree',
        'min_mark',
        'total',
        'part_id',
        'term_id',
        'short_name',
    ];

    public function classsSchoolYear()
    {
        return $this->belongsTo(ClasssSchoolYear::class);
    }

    public function examResults()
    {
        return $this->hasMany(ExamResult::class);
    }

    public function part()
    {
        return $this->belongsTo(Part::class);
    }
    public function term()
    {
        return $this->belongsTo(Term::class);
    }
    public function marks()
    {
        return $this->hasMany(Mark::class);
    }

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
    public function getExamResult($subjectDetailId, $classsSchoolYearId, $partId, $verifiedStudentId)
    {
        return ExamResult::where('subject_detail_id', $subjectDetailId)
            ->where('class_id', $classsSchoolYearId)
            ->where('part_id', $partId)
            ->where('verified_student_id', $verifiedStudentId)
            ->first();
    }
    public function svgIds()
    {
        return $this->hasMany(SvgId::class);
    }
}
