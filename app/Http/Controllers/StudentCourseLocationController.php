<?php

namespace App\Http\Controllers;

use App\Models\StudentCourseLocation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StudentCourseLocationController extends Controller
{
    public function index() {
        $studentCourseLocations = StudentCourseLocation::paginate(10);
        return view('student_courses.student_course_locations', compact('studentCourseLocations'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'location' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        StudentCourseLocation::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $studentCourseLocation = StudentCourseLocation::findOrFail($id);
        return response()->json($studentCourseLocation);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'location' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $studentCourseLocation = StudentCourseLocation::findOrFail($id);
        $studentCourseLocation->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $studentCourseLocation = StudentCourseLocation::findOrFail($id);
        $studentCourseLocation->delete();

        return response()->json(['success' => true]);
    }
}
