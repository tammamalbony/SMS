<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClasssSchoolYearDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'classs_school_year_id',
        'first_term_days',
        'second_term_days',
        'note',
        'max_students',
        'status',
    ];

    public function classsSchoolYear()
    {
        return $this->belongsTo(ClasssSchoolYear::class);
    }
}
