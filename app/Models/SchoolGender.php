<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolGender extends Model
{
    use HasFactory;
    protected $fillable = ['gender', 'note'];
}
