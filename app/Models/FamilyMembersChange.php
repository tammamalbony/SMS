<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FamilyMembersChange extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'note'];
}
