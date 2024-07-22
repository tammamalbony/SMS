<?php

namespace App\Models;

use App\Models\VerifiedStudent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamResult extends Model
{
    use HasFactory;

    protected $fillable = [
        'exam_id',
        'class_id',
        'max_grade',
        'isverfied',
        'value',
        'islocked',
        'atemptes',
        'failing_grade',
        'subject_is_failing',
        'verified_student_id',
        'subject_detail_id',
        'short_name'
    ];

    public function exam()
    {
        return $this->belongsTo(Exam::class);
    }

    public function classsSchoolYear()
    {
        return $this->belongsTo(ClasssSchoolYear::class, 'class_id');
    }

    public function verifiedStudent()
    {
        return $this->belongsTo(VerifiedStudent::class, 'verified_student_id');
    }

    public function subjectDetail()
    {
        return $this->belongsTo(SubjectDetail::class, 'subject_detail_id');
    }
}
