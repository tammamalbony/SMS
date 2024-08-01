<?php

namespace App\Models;

use App\Models\TypeOfEmployment;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeOfAppointment extends Model
{
    use HasFactory;

    protected $fillable = ['type_of_employment_id', 'type', 'note'];

    public function typeOfEmployment() {
        return $this->belongsTo(TypeOfEmployment::class, 'type_of_employment_id');
    }
}
