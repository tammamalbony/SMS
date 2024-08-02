<?php

namespace App\Models;

use App\Models\Classs;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tableheader extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'class_id',
        'min_height',
        'max_width',
        'left_margin',
    ];

    public function class()
    {
        return $this->belongsTo(Classs::class); 
    }
}
