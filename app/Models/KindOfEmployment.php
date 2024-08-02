<?php

namespace App\Models;

use App\Models\JobTitle;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KindOfEmployment extends Model
{
    use HasFactory;
    protected $fillable = ['name'];


    public function sortsOfEmployment()
    {
        return $this->hasMany(SortOfEmployment::class);
    }
    public function jobTitles()
    {
        return $this->hasMany(JobTitle::class);
    }
}
