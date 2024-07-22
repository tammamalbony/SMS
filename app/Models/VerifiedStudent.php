<?php

namespace App\Models;

use App\Enums\RegisterStatus;
use App\Enums\VerifiedStudentStatus;
use App\Models\ExamResult;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VerifiedStudent extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'section_id',
        'is_confirmed',
        'order',
        'status',
         'general_record',
        'language_id',
        'register_status',
        'confirm_register_date'
    ];

    protected $casts = [
        'status' => VerifiedStudentStatus::class,
          'register_status' => RegisterStatus::class
    ];
    // Relationships
    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function section()
    {
        return $this->belongsTo(Section::class);
    }

    public function adminNotes()
    {
        return $this->hasMany(VerifiedStudentAdminNote::class);
    }

    public function teacherNotes()
    {
        return $this->hasMany(VerifiedStudentTeacherNote::class);
    }

    public function attendances()
    {
        return $this->hasMany(Attendance::class);
    }

    public function examResults()
    {
        return $this->hasMany(ExamResult::class, 'verified_student_id');
    }

    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
