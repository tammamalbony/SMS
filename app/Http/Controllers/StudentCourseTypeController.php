<?php

namespace App\Http\Controllers;

use App\Models\StudentCourseType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StudentCourseTypeController extends Controller
{
    public function index() {
        $studentCourseTypes = StudentCourseType::paginate(10);
        return view('student_courses.student_course_types', compact('studentCourseTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        StudentCourseType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $studentCourseType = StudentCourseType::findOrFail($id);
        return response()->json($studentCourseType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $studentCourseType = StudentCourseType::findOrFail($id);
        $studentCourseType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $studentCourseType = StudentCourseType::findOrFail($id);
        $studentCourseType->delete();

        return response()->json(['success' => true]);
    }
}
