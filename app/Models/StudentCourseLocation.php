<?php

namespace App\Models;

use App\Models\StudentCourse;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentCourseLocation extends Model
{
    use HasFactory;
    protected $fillable = ['location'];

    public function courses() {
        return $this->hasMany(StudentCourse::class, 'location_id');
    }
}
