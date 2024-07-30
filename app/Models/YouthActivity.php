<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class YouthActivity extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'type_id', 'note'];

    public function type() {
        return $this->belongsTo(YouthActivityType::class, 'type_id');
    }
    public function location() {
        return $this->belongsTo(YouthActivityLocation::class, 'location_id');
    }
}
