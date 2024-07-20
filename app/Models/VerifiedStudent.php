<?php

namespace App\Models;

use App\Enums\VerifiedStudentStatus;
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
        'status'
    ];

    protected $casts = [
        'status' => VerifiedStudentStatus::class,
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
}
