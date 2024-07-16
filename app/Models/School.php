<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class School extends Model
{
    use HasFactory;

    protected $fillable = [
        'statistical_number',
        'school_name',
        'type_of_education',
        'typeB',
        'kindergarten',
        'education_p',
        'education_p1',
        'education_s',
        'school_state',
        'school_city',
        'school_region',
        'school_village',
        'school_Neigh',
        'Admin_division',
        'School_gender',
        'School_build',
        'School_access',
        'Shared_construction',
        'School_type',
        'type_of_attend',
        'build_m',
        'build_t',
        'build_class',
        'build_area',
        'count_floor',
        'count_build',
        'petrol_count',
        'petrol_cap',
        'internet_coount',
        'internet_type',
        'electric_type',
    ];
}
