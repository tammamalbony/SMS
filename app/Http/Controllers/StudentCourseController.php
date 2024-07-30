<?php

namespace App\Http\Controllers;

use App\Models\StudentCourse;
use App\Models\StudentCourseLocation;
use App\Models\StudentCourseType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StudentCourseController extends Controller
{
    public function index() {
        $studentCourses = StudentCourse::with('location', 'type')->paginate(10);
        $studentCourseLocations = StudentCourseLocation::all();
        $studentCourseTypes = StudentCourseType::all();
        return view('student_courses.index', compact('studentCourses', 'studentCourseLocations', 'studentCourseTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'location_id' => 'required|exists:student_course_locations,id',
            'type_id' => 'required|exists:student_course_types,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        StudentCourse::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $studentCourse = StudentCourse::findOrFail($id);
        return response()->json($studentCourse);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'location_id' => 'required|exists:student_course_locations,id',
            'type_id' => 'required|exists:student_course_types,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $studentCourse = StudentCourse::findOrFail($id);
        $studentCourse->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $studentCourse = StudentCourse::findOrFail($id);
        $studentCourse->delete();

        return response()->json(['success' => true]);
    }
}
