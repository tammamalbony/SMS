<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Column extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'text_direction',
        'min_width',
        'max_text_width',
        'font_size',
        'is_active_for_finals',
        'tableheader_id',
        'parent_id',
        'term_id',
        'is_final',
        'order'

    ];

    public function parent()
    {
        return $this->belongsTo(Column::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(Column::class, 'parent_id');
    }

    public function tableheader()
    {
        return $this->belongsTo(Tableheader::class);
    }
}
