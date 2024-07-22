<?php

namespace App\Models;

use App\Models\VerifiedStudent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CollaborationAndActivity extends Model
{
    use HasFactory;
    protected $fillable = [
        'verified_student_id',
        'value',
        'note',
    ];

    public function verifiedStudent()
    {
        return $this->belongsTo(VerifiedStudent::class);
    }
}
