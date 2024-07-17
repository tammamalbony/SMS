<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClasssSchoolYear extends Model
{
    use HasFactory;

    protected $table = 'classses_school_years';

    protected $fillable = [
        'classs_id',
        'school_year_id',
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
}
