<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartOperation extends Model
{
    use HasFactory;

    protected $fillable = [
        'part_id',
        'operand_part_id',
        'operation',
    ];

    public function part()
    {
        return $this->belongsTo(Part::class);
    }

    public function operandPart()
    {
        return $this->belongsTo(Part::class, 'operand_part_id');
    }
}
