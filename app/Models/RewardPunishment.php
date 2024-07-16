<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RewardPunishment extends Model
{
    use HasFactory;

    protected $fillable = [
        'teacher_id', 'reward_punishment_name', 'reason', 'year','is_punishment'
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }
}
