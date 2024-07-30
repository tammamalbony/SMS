<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Institution extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'address',
        'mobile',
        'telephone',
        'note',
        'governate_id',
    ];

    public function governate()
    {
        return $this->belongsTo(Governate::class);
    }
}
