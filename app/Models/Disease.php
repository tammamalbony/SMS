<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Disease extends Model
{
    use HasFactory;

    protected $fillable = ['type_id', 'name', 'description'];

    public function type() {
        return $this->belongsTo(DiseaseType::class, 'type_id');
    }
}
