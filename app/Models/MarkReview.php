<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MarkReview extends Model
{
    use HasFactory;

    protected $fillable = [
        'min_mark',
        'max_mark',
        'result',
        'color',
    ];

    public function yearClassSubject()
    {
        return $this->belongsTo(YearClassSubject::class);
    }

    public static function getByMark(float $mark)
    {
        return self::where('min_mark', '<=', $mark)
                   ->where('max_mark', '>=', $mark)
                   ->first();
    }
}
