<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubjectDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'subject_id',
        'max_grade',
        'failing_grade',
        'is_failing',
        'is_active',
        'grade_id'
    ];

    public function subject()
    {
        return $this->belongsTo(Subject::class);
    }

    public function grade()
    {
        return $this->belongsTo(Grade::class);
    }

    public function classsSchoolYears()
    {
        return $this->belongsToMany(ClasssSchoolYear::class, 'c_s_y_s_detail', 'subject_detail_id', 'c_s_y_id')
                    ->withTimestamps();
    }


    public function svgIds()
    {
        return $this->hasMany(SvgId::class);
    }
}
