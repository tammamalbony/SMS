<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Father extends Model
{
    use HasFactory;
    protected $fillable = [
        'email',
        'password',
        'name',
        'name_en',
        'last_name',
        'job',
        'job_en',
        'national_id',
        'passport_id',
        'phone',
        'nationality_id',
        'blood_type_id',
        'religion_id',
        'address'
    ];

    // Setting up the relationship to the Nationality model
    public function nationality()
    {
        return $this->belongsTo(Nationality::class, 'nationality_id');
    }

    // Setting up the relationship to the BloodType model
    public function bloodType()
    {
        return $this->belongsTo(BloodType::class, 'blood_type_id');
    }

    // Setting up the relationship to the Religion model
    public function religion()
    {
        return $this->belongsTo(Religion::class, 'religion_id');
    }

    public function wives()
    {
        return $this->hasMany(Wife::class);
    }

    public function documents()
    {
        return $this->morphMany(Document::class, 'documentable');
    }
}
