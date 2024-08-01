<?php

namespace App\Models;

use App\Models\QuestionOption;
use App\Models\SchoolQuestion;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuestionOptionRelation extends Model
{
    use HasFactory;
    protected $fillable = [
        'question_id',
        'option_id',
    ];

    public function question()
    {
        return $this->belongsTo(SchoolQuestion::class);
    }

    public function option()
    {
        return $this->belongsTo(QuestionOption::class);
    }
}
