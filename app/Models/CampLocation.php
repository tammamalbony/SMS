<?php

namespace App\Models;

use App\Models\Camp;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CampLocation extends Model
{
    use HasFactory;
    protected $fillable = ['location'];

    public function camps() {
        return $this->hasMany(Camp::class, 'location_id');
    }
}
