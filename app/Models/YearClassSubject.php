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
        'is_optional_foreign_subject',
        'foreign_language_id',
    ];

    public function c_s_y()
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

    public function partsInputs()
    {
        return $this->hasMany(Part::class)
            ->where('must_be_calculated', 0)
            ->where('is_active', 1)
            ->where('is_sealed', 0)
            ->where('must_be_ceiled', 0)
            ->where('is_final_result', 0)
            ->whereNull('value')
            ->whereNull('operation');
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

    public function foreignLanguage()
    {
        return $this->belongsTo(Language::class, 'foreign_language_id');
    }
}
