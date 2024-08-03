<?php

namespace App\Http\Controllers;

use App\Models\Absence;
use App\Models\Attendance;
use App\Models\ClasssSchoolYear;
use App\Models\Grade;
use App\Models\SchoolYear;
use App\Models\Section;
use App\Models\VerifiedStudent;
use Carbon\Carbon;
use Illuminate\Http\Request;

class AttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $schoolYears = SchoolYear::all();
        $absences = Absence::all();
        $verifiedStudents = [];

        return view('attendances.index', compact('schoolYears', 'absences', 'verifiedStudents'));
    }

    public function getClassSchoolYears(Request $request)
    {
        $classSchoolYears = ClasssSchoolYear::where('school_year_id', $request->school_year_id)
            ->with('classs.grade')
            ->get();
        $classSchoolYears = $classSchoolYears->map(function ($classSchoolYear) {
            return [
                'id' => $classSchoolYear->id,
                'name' => $classSchoolYear->classs->grade->grade_name_ar . ' - ' . $classSchoolYear->classs->class_name_ar
            ];
        });
        return response()->json($classSchoolYears);
    }

    public function getSections(Request $request)
    {
        // dd($request);
        // Validate the request data
        $request->validate([
            'class_school_year_id' => 'required|integer|exists:classs_school_years,id',
        ]);

        
        // Fetch the sections that have verified students
        $sections = Section::where('classs_school_year_id', $request->class_school_year_id)
            // ->whereHas('verifiedStudents')
            ->get();

        // Return the sections in JSON format
        return response()->json($sections);
    }

    public function getVerifiedStudents(Request $request)
    {
        $verifiedStudents = VerifiedStudent::with('student', 'attendances.absence')
        ->where('section_id', $request->section_id)
        ->whereDoesntHave('attendances', function ($query) {
            $query->where('date', '>=', Carbon::now()->subDay()->toDateString());
        })
        ->get();
        return response()->json($verifiedStudents);
    }

    public function storeAll(Request $request)
    {
        // dd($request);
        // Validate the request data
        $request->validate([
            'attendance_data' => 'required|array',
            'attendance_data.*.verified_student_id' => 'required|integer|exists:verified_students,id',
            'attendance_data.*.date' => 'required|date',
            'attendance_data.*.absence_id' => 'nullable|integer|exists:absences,id',
        ]);

        // Retrieve the attendance data from the request
        $attendanceData = $request->input('attendance_data');

        // Process each attendance record
        foreach ($attendanceData as $data) {
            Attendance::updateOrCreate(
                [
                    'verified_student_id' => $data['verified_student_id'],
                    'date' => $data['date'],
                ],
                [
                    'is_present' => $data['is_present'] == "true",
                    'absence_id' => $data['absence_id']
                ]
            );
        }

        // Return a JSON response indicating success
        return response()->json(['success' => true]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'verified_student_id' => 'required|exists:verified_students,id',
            'date' => 'required|date',
            'is_present' => 'required|boolean',
            'absence_id' => 'nullable|exists:absences,id'
        ]);

        Attendance::create($request->all());
        return response()->json(['success' => true]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'verified_student_id' => 'required|exists:verified_students,id',
            'date' => 'required|date',
            'is_present' => 'required|boolean',
            'absence_id' => 'nullable|exists:absences,id'
        ]);

        $attendance = Attendance::findOrFail($id);
        $attendance->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $attendance = Attendance::findOrFail($id);
        $attendance->delete();

        return response()->json(['success' => true]);
    }
}
