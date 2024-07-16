<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobSequence extends Model
{
    use HasFactory;

    protected $fillable = [
        'teacher_id', 'school_name', 'job_title', 'year'
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }
}
