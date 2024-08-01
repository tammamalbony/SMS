<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialSituation extends Model
{
    use HasFactory;

    protected $fillable = ['situation', 'note'];
}
