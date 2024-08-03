<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LearningType extends Model
{
    use HasFactory;
    protected $fillable = ['type', 'note'];

    public function classsSchoolYears()
    {
        return $this->hasMany(ClasssSchoolYear::class, 'learning_type_id');
    }
}
