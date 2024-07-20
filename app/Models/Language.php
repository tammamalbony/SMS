<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    use HasFactory;

    protected $fillable = ['name','short_name'];

    public function sections()
    {
        return $this->belongsToMany(Section::class, 'section_language', 'language_id', 'section_id');
    }

    
}
