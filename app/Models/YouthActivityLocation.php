<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class YouthActivityLocation extends Model
{
    use HasFactory;

    protected $fillable = ['location'];

    public function activities() {
        return $this->hasMany(YouthActivity::class, 'location_id');
    }
}
