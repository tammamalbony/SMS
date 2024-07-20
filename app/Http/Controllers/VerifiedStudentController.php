<?php

namespace App\Http\Controllers;

use App\Enums\VerifiedStudentStatus;
use App\Models\Section;
use App\Models\Student;
use App\Models\VerifiedStudent;
use App\Rules\EnumValue;
use Illuminate\Http\Request;

class VerifiedStudentController extends Controller
{
    public function index()
    {
        $verifiedStudents = VerifiedStudent::with(['student', 'section'])->paginate(10);
        $students = Student::all();
        $sections = Section::all();
        
        return view('verified_students.index', compact('verifiedStudents', 'students', 'sections'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'student_id' => 'required|exists:students,id',
            'section_id' => 'required|exists:sections,id',
            'is_confirmed' => 'required|boolean',
            'status' => ['required', new EnumValue(VerifiedStudentStatus::class)],
        ]);

        VerifiedStudent::create($request->all());

        return response()->json(['success' => 'تمت الإضافة بنجاح!']);
    }

    public function edit($id)
    {
        $verifiedStudent = VerifiedStudent::findOrFail($id);
        return response()->json($verifiedStudent);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'student_id' => 'required|exists:students,id',
            'section_id' => 'required|exists:sections,id',
            'is_confirmed' => 'required|boolean',
            'status' => ['required', new EnumValue(VerifiedStudentStatus::class)],
        ]);

        $verifiedStudent = VerifiedStudent::findOrFail($id);
        $verifiedStudent->update($request->all());

        return response()->json(['success' => 'تم التحديث بنجاح!']);
    }

    public function destroy($id)
    {
        $verifiedStudent = VerifiedStudent::findOrFail($id);
        $verifiedStudent->status = VerifiedStudentStatus::DELETED;
        $verifiedStudent->section_id = null;
        $verifiedStudent->save();
        return response()->json(['success' => 'تم تحديث الحالة إلى محذوف بنجاح!']);
    }
}
