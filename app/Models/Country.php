<?php

namespace App\Models;

use App\Models\Governate;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function governates()
    {
        return $this->hasMany(Governate::class);
    }
}
