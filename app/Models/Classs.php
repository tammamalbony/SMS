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
}
