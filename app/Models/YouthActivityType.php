<?php

namespace App\Models;

use App\Models\YouthActivity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class YouthActivityType extends Model
{
    use HasFactory;
    protected $fillable = ['type'];

    public function activities() {
        return $this->hasMany(YouthActivity::class, 'type_id');
    }
}
