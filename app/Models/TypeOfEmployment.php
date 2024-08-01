<?php

namespace App\Models;

use App\Models\TypeOfAppointment;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeOfEmployment extends Model
{
    use HasFactory;
    protected $fillable = ['type', 'note'];


    public function typesOfAppointments()
    {
        return $this->hasMany(TypeOfAppointment::class, 'type_of_employment_id');
    }
}
