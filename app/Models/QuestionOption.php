<?php

namespace App\Models;

use App\Models\SchoolQuestion;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuestionOption extends Model
{
    use HasFactory;
    protected $fillable = [
        'option_text',
    ];

    public function question()
    {
        return $this->belongsTo(SchoolQuestion::class);
    }
    public function relatedQuestion()
    {
        return $this->hasMany(SchoolQuestion::class, 'related_question_id');
    }
}
