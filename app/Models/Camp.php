<?php

namespace App\Models;

use App\Models\CampLocation;
use App\Models\CampType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Camp extends Model
{
    use HasFactory;
    protected $fillable = ['date', 'rate', 'location_id', 'type_id'];

    public function location() {
        return $this->belongsTo(CampLocation::class, 'location_id');
    }

    public function type() {
        return $this->belongsTo(CampType::class, 'type_id');
    }
}
