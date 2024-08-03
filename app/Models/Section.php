<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use ReflectionClass;
use ReflectionMethod;

class Section extends Model
{
    use HasFactory;
    protected $fillable = [
        'classs_school_year_id',
        'section_type_id',
        'section_type_id',
        'teacher_id',
    ];

    public function classsSchoolYear()
    {
        return $this->belongsTo(ClasssSchoolYear::class);
    }

    public function languages()
    {
        return $this->belongsToMany(Language::class, 'section_language', 'section_id', 'language_id');
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }

   
    public function teachers()
    {
        return $this->belongsToMany(Teacher::class, 'section_teacher');
    }
    public function sectionType()
    {
        return $this->belongsTo(SectionType::class);
    }


    public function getRelationships()
    {
        $model = new static;
        $relationships = [];

        foreach ((new ReflectionClass($model))->getMethods(ReflectionMethod::IS_PUBLIC) as $method) {
            if ($method->class != get_class($model) || !empty($method->getParameters()) || $method->getName() == __FUNCTION__) {
                continue;
            }

            try {
                $return = $method->invoke($model);
                if ($return instanceof \Illuminate\Database\Eloquent\Relations\Relation) {
                    $relationships[$method->getName()] = get_class($return);
                }
            } catch (\Throwable $e) {
                // Ignore exceptions thrown in method calls
            }
        }

        return $relationships;
    }
    public function verifiedStudents()
    {
        return $this->hasMany(VerifiedStudent::class);
    }
}
