<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentAdditionalDetail extends Model
{
    use HasFactory;

   
    protected $fillable = [
        'student_id',
        'number_of_fail_years',
        'previous_school',
        'registration_type_id',
    ];

    // Relationships
    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function registrationType()
    {
        return $this->belongsTo(RegistrationType::class);
    }
}
