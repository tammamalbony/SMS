<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolYear extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'start_year',
        'end_year',
        'is_active',
    ];

    public function classes()
    {
        return $this->belongsToMany(Classs::class, 'classs_school_years');
    }

    public function classsSchoolYears()
    {
        return $this->hasMany(ClasssSchoolYear::class);
    }
    
}
