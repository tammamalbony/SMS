<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Part extends Model
{
    use HasFactory;

    protected $fillable = [
        'year_class_subject_id',
        'mark_review_id',
        'name',
        'value',
        'operation',
        'is_final_result',
        'is_semi_final_result',
        'has_mark_review',
        'is_sealed',
        'max_per_cent',
        'is_visible',
        'is_active',
        'must_be_calculated',
        'must_be_ceiled',
        'is_in_final',
        'term_id',
        'is_in_results'
    ];

    public function yearClassSubject()
    {
        return $this->belongsTo(YearClassSubject::class);
    }

    public function markReview()
    {
        return $this->belongsTo(MarkReview::class);
    }

    public function operations()
    {
        return $this->hasMany(PartOperation::class);
    }

    public function calculateValue()
    {
        $result = 0;

        if ($this->must_be_calculated) {
            foreach ($this->operations as $operation) {
                $operandValue = $operation->operandPart ? $operation->operandPart->calculateValue() : 0;

                switch ($operation->operation) {
                    case 'add':
                        $result += $operandValue;
                        break;
                    case 'subtract':
                        $result -= $operandValue;
                        break;
                    case 'multiply':
                        if($operandValue != 0){
                            $result *= $operandValue;
                        }
                        break;
                    case 'divide':
                        if ($operandValue != 0) {
                            $result /= $operandValue;
                        }
                        break;
                }
            }

            if (!is_null($this->value) && $this->value != 0 && !is_null($this->operation)) {
                switch ($this->operation) {
                    case 'add':
                        $result += $this->value;
                        break;
                    case 'subtract':
                        $result -= $this->value;
                        break;
                    case 'multiply':
                        if($operandValue != 0){
                            $result *= $this->value;
                        }
                        break;
                    case 'divide':
                        if ($this->value != 0) {
                            $result /= $this->value;
                        }
                        break;
                }
            }

            if ($this->must_be_ceiled) {
                $result = ceil($result);
            }

            return $result;
        }

        return $this->value;
    }
}
