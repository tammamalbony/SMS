<?php

namespace App\Http\Controllers;

use App\Models\ClasssSchoolYear;
use App\Models\Section;
use App\Models\SectionTeacher;
use App\Models\SubjectDetail;
use App\Models\Teacher;
use App\Models\YearClassSubject;
use Illuminate\Http\Request;

class SectionTeacherController extends Controller
{
    // Display a listing of the resource.
    public function index($sectionId)
    {
            // Retrieve the section along with its associated teachers
            $sectionTeachers = SectionTeacher::where('section_id',$sectionId)->get();

            $section = Section::where('id',$sectionId)->first();

            // Retrieve all teachers
            $teachers = Teacher::all();
            $yearClassSubject =  YearClassSubject::where('c_s_y_id',$section->classs_school_year_id)->get();

            // Return the view with the section and teachers data
            return view('sections.section_teacher', compact('sectionTeachers','section', 'teachers', 'yearClassSubject'));
    }

    // Store a newly created resource in storage.
    public function store(Request $request, $sectionId)
    {
       
        // Validate the request data
        $request->validate([
            'teacher_id' => 'required|exists:teachers,id',
            'subject_detail_id' => 'required|exists:c_s_y_s_detail,id',
            'note' => 'nullable|string',
        ]);

        try {
            // Find the section by its ID
            $section = Section::findOrFail($sectionId);

            $data['teacher_id'] = $request->input('teacher_id');
            $data['year_class_subject_id'] = $request->input('subject_detail_id');
            $data['note'] = $request->input('note');
            $data['section_id'] =  $sectionId;
            SectionTeacher::create($data);
            return response()->json(['success' => 'Teacher added successfully.']);
        } catch (\Exception $e) {
            // Handle the exception and return an error message
            return response()->json(['error' => 'Failed to add teacher.'], 500);
        }
    }

    // Update the specified resource in storage.
    public function update(Request $request, $sectionId, $sectionTeacher)
    {
        // Validate the request data
        $request->validate([
            'note' => 'nullable|string',
            'subject_detail_id' => 'required|exists:c_s_y_s_detail,id',
        ]);
        $data['year_class_subject_id'] = $request->input('subject_detail_id');
        $data['note'] = $request->input('note');
        try {
            $sectionTeacher = SectionTeacher::where('section_id',$sectionId)->where('id',$sectionTeacher)->first();
            $sectionTeacher->update($data);
            // Return a JSON response indicating success
            return response()->json(['success' => 'Note updated successfully.']);
        } catch (\Exception $e) {
            // Handle the exception and return an error message
            return response()->json(['error' => 'Failed to update note.'], 500);
        }
    }

    // Remove the specified resource from storage.
    public function destroy($sectionId, $sectionTeacher)
    {
            // Find the section by its ID
            $sectionTeacher = SectionTeacher::where('section_id',$sectionId)->where('id',$sectionTeacher)->first();
            if( $sectionTeacher != null){
                $sectionTeacher->delete();
                // Return a JSON response indicating success
                return response()->json(['success' => 'Teacher removed successfully.']);
            }
            else{
                return response()->json(['error' => 'Failed to remove teacher.'], 500);

            }
          
    }
}
