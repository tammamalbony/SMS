<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class Grade extends Model 
{
    use HasFactory;

    protected $fillable = [
        'grade_name_ar',
        'grade_name_en',
        'grade_notes',
        'stage_id',
        'parent_id',
        
    ];

    public function stage()
    {
        return $this->belongsTo(Stage::class);
    }

    /**
     * Get the parent grade.
     */
    public function parent()
    {
        return $this->belongsTo(Grade::class, 'parent_id');
    }

    /**
     * Get the child grades.
     */
    public function children()
    {
        return $this->hasMany(Grade::class, 'parent_id');
    }

    public function hasNoChildren()
    {
        return $this->children()->count() == 0;
    }
    public function classes()
    {
        return $this->hasMany(Classs::class);
    }
    
    public function hasNoClasses()
    {
        return $this->classes()->count() == 0;
    }
    public function classesCount()
    {
        return $this->classes()->count();
    }
}
