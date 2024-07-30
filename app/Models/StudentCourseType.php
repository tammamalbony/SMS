<?php

namespace App\Models;

use App\Models\StudentCourse;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentCourseType extends Model
{
    use HasFactory;


    protected $fillable = ['type'];

    public function courses() {
        return $this->hasMany(StudentCourse::class, 'type_id');
    }
}
