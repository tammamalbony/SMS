<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class YearClassSubject extends Model
{
    use HasFactory;

    protected $table = 'c_s_y_s_detail';

    protected $fillable = [
        'c_s_y_id',
        'subject_detail_id',
        'order',
        'is_falling',
    ];
    public function classsSchoolYear()
    {
        return $this->belongsTo(ClasssSchoolYear::class);
    }

    public function sections()
    {
        return $this->hasMany(Section::class);
    }

    public function subjectDetail()
    {
        return $this->belongsTo(SubjectDetail::class);
    }

    public function parts()
    {
        return $this->hasMany(Part::class);
    }

    public function calculateFinalResult()
    {
        $finalResult = 0;
        $parts = $this->parts;

        foreach ($parts as $part) {
            if ($part->calculation_formula) {
                $formula = str_replace(' ', '', $part->calculation_formula);
                eval('$result = ' . $formula . ';');
                $finalResult += $result;
            } else {
                $finalResult += $part->value;
            }
        }

        return $finalResult;
    }
}
