<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VerifiedStudentTeacherNote extends Model
{
    use HasFactory;

    protected $fillable = [
        'verified_student_id',
        'note'
    ];

    public function verifiedStudent()
    {
        return $this->belongsTo(VerifiedStudent::class);
    }
}
