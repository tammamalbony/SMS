<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;


    protected $fillable = [
        'first_name',
        'last_name',
        'name_ar',
        'name_en',
        'email',
        'password',
        'birthdate',
        'gender',
        'nationality_id',
        'blood_type_id',
        'religion_id',
        'national_id',
        'passport_id',
        'phone',
        'mobile',
        'father_id',
        'mother_id',
        'record_place',
        'record_id',
    ];

    protected $hidden = [
        'password',
    ];

    // Relationships
    public function nationality()
    {
        return $this->belongsTo(Nationality::class);
    }

    public function bloodType()
    {
        return $this->belongsTo(BloodType::class);
    }

    public function religion()
    {
        return $this->belongsTo(Religion::class);
    }

    public function father()
    {
        return $this->belongsTo(Father::class);
    }

    public function mother()
    {
        return $this->belongsTo(Wife::class);
    }
}
