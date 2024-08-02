<?php

namespace App\Models;

use App\Models\QuestionOption;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolQuestion extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'description', 'type', 'order','dependent_option_id'];

    public function options()
    {
        return $this->hasMany(QuestionOption::class);
    }

    public function dependentOption()
    {
        return $this->hasMany(QuestionOption::class, 'dependent_option_id');
    }

    public function hasOptions()
    {
        return $this->options()->exists();
    }
}
