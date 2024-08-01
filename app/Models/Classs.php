<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Classs extends Model
{
    use HasFactory;

    protected $fillable = [
        'grade_id',
        'class_name_ar',
        'class_name_en',
    ];

    
    public function grade()
    {
        return $this->belongsTo(Grade::class);
    }

    public function schoolYears()
    {
        return $this->belongsToMany(SchoolYear::class, 'classses_school_year');
    }

    public function books()
    {
        return $this->hasMany(Book::class);
    }

    public function AgeGroups() {
        return $this->belongsToMany(AgeGroup::class, 'classs_id');
    }
}
