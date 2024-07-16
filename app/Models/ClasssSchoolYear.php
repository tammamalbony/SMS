<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClasssSchoolYear extends Model
{
    use HasFactory;

    protected $table = 'classses_school_year';

    protected $fillable = [
        'classs_id',
        'school_year_id',
    ];

    public function classs()
    {
        return $this->belongsTo(Classs::class);
    }


    public function schoolYear()
    {
        return $this->belongsTo(SchoolYear::class);
    }

}
