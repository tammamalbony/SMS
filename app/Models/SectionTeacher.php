<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SectionTeacher extends Model
{
    use HasFactory;

    protected $table = 'section_teacher';

    protected $fillable = [
        'section_id',
        'teacher_id',
        'note',
        'year_class_subject_id',
    ];

      // Define the relationship to the Section model
      public function section()
    {
        return $this->belongsTo(Section::class);
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }

    public function yearClassSubject()
    {
        return $this->belongsTo(YearClassSubject::class);
    }
}
