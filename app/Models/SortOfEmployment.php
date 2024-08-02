<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SortOfEmployment extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'kind_of_employment_id'];

    public function kindOfEmployment()
    {
        return $this->belongsTo(KindOfEmployment::class);
    }
}
