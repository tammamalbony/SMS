<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Teacher;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function index($id)
    {
        $courses = Course::where('teacher_id',$id)->paginate(10);
        $teachers = Teacher::all();
        return view('courses.index', compact('courses', 'teachers','id'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'teacher_id' => 'required|exists:teachers,id',
            'course_name' => 'required|string|max:255',
            'notes' => 'nullable|string|max:255',
            'year' => 'required|date',
        ]);

        Course::create($request->all());

        return response()->json(['success' => true, 'message' => 'Course created successfully.']);
    }
    public function edit(Request $request, $id)
    {
        try {
            $data = Course::findOrFail($id);
            $teachers = Teacher::all(); 
        
            return response()->json([
              'success' => true,
              'course' => $data,
              'teachers' => $teachers->map(function ($teacher) {
                return [
                  'id' => $teacher->id,
                  'name_ar' => $teacher->name_ar,
                ];
              })->toArray(),
            ]);
          } catch (ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => 'Job Sequence not found'], 404);
          }
    }


    public function update(Request $request, $id)
    {
        $course = Course::findOrFail($id);

        $request->validate([
            'teacher_id' => 'required|exists:teachers,id',
            'course_name' => 'required|string|max:255',
            'notes' => 'nullable|string|max:255',
            'year' => 'required|date',
        ]);

        $course->update($request->all());

        return response()->json(['success' => true, 'message' => 'Course updated successfully.']);
    }

    public function destroy($id)
    {
        $course = Course::findOrFail($id);

        $course->delete();

        return response()->json(['success' => true, 'message' => 'Course deleted successfully.']);
    }
}
