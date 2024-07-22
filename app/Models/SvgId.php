<?php

namespace App\Models;

use App\Models\Exam;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SvgId extends Model
{
    use HasFactory;

    protected $fillable = [
        'exam_id',
        'classs_school_years_id',
        'subject_detail_id',
        'svg_id',
        'name',
        'note',
        'max_width',
        'max_height',
        'font_size',
        'fill_color',
        'anchortext',
        'transform',
    ];


    public function exam()
    {
        return $this->belongsTo(Exam::class);
    }

    public function classsSchoolYears()
    {
        return $this->belongsTo(ClasssSchoolYear::class);
    }

    public function subjectDetail()
    {
        return $this->belongsTo(SubjectDetail::class);
    }
}
