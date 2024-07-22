<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'class_id','url1','url2','url3'];

    public function class()
    {
        return $this->belongsTo(Classs::class); 
    }
    
    public function verifiedStudents()
    {
        return $this->belongsToMany(VerifiedStudent::class, 'book_verified_student');
    }
}