<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    use HasFactory;
    use HasFactory;

    protected $fillable = [
        'email', 'password', 'name_ar', 'name_en', 'mother', 'specialization_id',
        'gender_id', 'marital_status', 'birthdate', 'address_birth', 'add_num', 'tel',
        'mobile', 'gern', 'religion', 'work_type', 'joining_date', 'address',
        'address_fixed', 'state', 'certificates', 'highest_cert', 'date_obtained',
        'salary', 'type_job', 'type_dis', 'type_of_job', 'cityI', 'date_admin_work',
        'belongs_him', 'subjet', 'quorum_hours', 'e_quorum_hours'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function documents()
    {
        return $this->morphMany(Document::class, 'documentable');
    }
    public function sections()
    {
        return $this->belongsToMany(Section::class, 'section_teacher');
    }

    
}
