<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;

    protected $fillable = [
        'verified_student_id',
        'date',
        'is_present',
        'absence_id'
    ];

    public function verifiedStudent()
    {
        return $this->belongsTo(VerifiedStudent::class);
    }

    public function absence()
    {
        return $this->belongsTo(Absence::class);
    }
}
