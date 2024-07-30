<?php

namespace App\Models;

use App\Models\Camp;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CampType extends Model
{
    use HasFactory;

    protected $fillable = ['type'];

    public function camps() {
        return $this->hasMany(Camp::class, 'type_id');
    }
}
