<?php

namespace App\Models;

use App\Models\StudentCourseLocation;
use App\Models\StudentCourseType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentCourse extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'location_id', 'type_id'];

    public function location() {
        return $this->belongsTo(StudentCourseLocation::class, 'location_id');
    }

    public function type() {
        return $this->belongsTo(StudentCourseType::class, 'type_id');
    }
}
