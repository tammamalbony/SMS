<?php

namespace App\Models;

use App\Models\ExamResult;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClasssSchoolYear extends Model
{
    use HasFactory;

    protected $table = 'classs_school_years';

    protected $fillable = [
        'classs_id',
        'school_year_id',
        'fall_subject_count',
    ];

    public function classs()
    {
        return $this->belongsTo(Classs::class);
    }


    public function schoolYear()
    {
        return $this->belongsTo(SchoolYear::class);
    }

    public function classsSchoolYears()
    {
        return $this->belongsToMany(ClasssSchoolYear::class, 'c_s_y_s_detail', 'subject_detail_id', 'c_s_y_id')
                    ->withTimestamps();
    }

    public function parts()
    {
        return $this->hasMany(Part::class, 'year_class_subject_id');
    }

    public function details()
    {
        return $this->hasOne(ClasssSchoolYearDetail::class);
    }

    public function exams()
    {
        return $this->hasMany(Exam::class);
    }

    public function examResults()
    {
        return $this->hasMany(ExamResult::class, 'class_id');
    }

    public function svgIds()
    {
        return $this->hasMany(SvgId::class);
    }
}
