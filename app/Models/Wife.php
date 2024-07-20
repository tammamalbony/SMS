<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wife extends Model
{
    use HasFactory;

    protected $fillable = [
        'father_id',
        'name',
        'name_en',
        'job',
        'job_en',
        'national_id',
        'passport_id',
        'phone',
        'nationality_id',
        'blood_type_id',
        'religion_id'
    ];

    // Define the relationship with the Father model
    public function father()
    {
        return $this->belongsTo(Father::class);
    }

    // Define the relationship with the Nationality model
    public function nationality()
    {
        return $this->belongsTo(Nationality::class);
    }

    // Define the relationship with the BloodType model
    public function bloodType()
    {
        return $this->belongsTo(BloodType::class);
    }

    // Define the relationship with the Religion model
    public function religion()
    {
        return $this->belongsTo(Religion::class);
    }

    public function documents()
    {
        return $this->morphMany(Document::class, 'documentable');
    }
}
