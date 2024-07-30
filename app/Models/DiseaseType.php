<?php

namespace App\Models;

use App\Models\Disease;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DiseaseType extends Model
{
    use HasFactory;
    protected $fillable = ['type'];

    public function diseases() {
        return $this->hasMany(Disease::class, 'type_id');
    }
}
