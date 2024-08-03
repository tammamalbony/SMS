<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OldYear extends Model
{
    use HasFactory;

    protected $table = 'oldyears';
    protected $fillable = [
        'start_year',
        'end_year',
        'note',
    ];
}
