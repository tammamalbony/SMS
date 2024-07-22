<?php

namespace App\Http\Controllers;

use App\Enums\RegisterStatus;
use App\Enums\VerifiedStudentStatus;
use App\Models\BloodType;
use App\Models\Father;
use App\Models\Language;
use App\Models\Nationality;
use App\Models\Religion;
use App\Models\SchoolYear;
use App\Models\Student;
use App\Models\VerifiedStudent;
use App\Models\Wife;
use Illuminate\Http\Request;

class StudentController extends Controller
{

    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $students = Student::all();
        $schoolYears = SchoolYear::all();
        $languages = Language::all();
        return view('student.index', compact('students', 'schoolYears', 'languages'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $nationalities = Nationality::all();
        $bloodTypes = BloodType::all();
        $religions = Religion::all();
        $fathers = Father::all();
        $mothers = Wife::all();
        return view('student.create', compact('nationalities', 'bloodTypes', 'religions', 'fathers', 'mothers'));

    }
    public function verify(Request $request, Student $student)
    {
        $request->validate([
            'school_year' => 'required|exists:school_years,id',
            'class_school_year' => 'required|exists:classs_school_years,id',
            'section' => 'required|exists:sections,id',
            'general_record' => 'required|string|max:255',
            'language' => 'required|exists:languages,id',
             'confirm_register_date' => 'required|date'
        ]);

        // Create or update the VerifiedStudent record
        $verifiedStudent = VerifiedStudent::updateOrCreate(
            ['student_id' => $student->id],
            [
                'section_id' => $request->input('section'),
                'general_record' => $request->input('general_record'),
                'language_id' => $request->input('language'),
                'confirm_register_date' => $request->input('confirm_register_date'),
                'is_confirmed' => true,
                'status' => VerifiedStudentStatus::ACTIVE, // Adjust according to your enum
                'register_status' => RegisterStatus::Normal, // Adjust according to your enum
                'order' => VerifiedStudent::max('order') + 1 // Example for setting order
            ]
        );
        return redirect()->route('students.index')->with('success', 'تم التحقق من الطالب بنجاح');
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name_ar' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:students',
            'password' => 'required|string|min:8',
            'birthdate' => 'required|date',
            'gender' => 'required|in:male,female',
            'nationality_id' => 'required|integer',
            'blood_type_id' => 'required|integer',
            'religion_id' => 'required|integer',
            'national_id' => 'required|string|max:255|unique:students',
            'passport_id' => 'required|string|max:255|unique:students',
            'phone' => 'required|string|max:255',
            'mobile' => 'required|string|max:255',
            'father_id' => 'required|integer',
            'mother_id' => 'required|integer',
            'record_place' => 'required|string|max:255',
            'record_id' => 'required|string|max:255',
        ]);
        $data = $request->all();
        $father = Father::findOrFail($data['father_id']);
        $data['last_name'] = $father->last_name;
        $data['first_name'] = $data['name_ar'];
        $student = Student::create($data);
        return redirect()->route('students.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Student $student)
    {
        return view('student.show', compact('student')); // Uncomment when you create the view
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Student $student)
    {
        $nationalities = Nationality::all();
        $bloodTypes = BloodType::all();
        $religions = Religion::all();
        $fathers = Father::all();
        $mothers = Wife::all();
        return view('student.create', compact('student', 'nationalities', 'bloodTypes', 'religions', 'fathers', 'mothers')); // Uncomment when you create the view
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Student $student)
    {
        $request->validate([
            'name_ar' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:students,email,' . $student->id,
            'password' => 'nullable|string|min:8',
            'birthdate' => 'required|date',
            'gender' => 'required|in:male,female',
            'nationality_id' => 'required|integer',
            'blood_type_id' => 'required|integer',
            'religion_id' => 'required|integer',
            'national_id' => 'required|string|max:255|unique:students,national_id,' . $student->id,
            'passport_id' => 'required|string|max:255|unique:students,passport_id,' . $student->id,
            'phone' => 'required|string|max:255',
            'mobile' => 'required|string|max:255',
            'father_id' => 'required|integer',
            'mother_id' => 'required|integer',
            'record_place' => 'required|string|max:255',
            'record_id' => 'required|string|max:255',
        ]);
        $data = $request->all();
        $father = Father::findOrFail($data['father_id']);
        $data['last_name'] = $father->last_name;
        $data['first_name'] = $data['name_ar'];
        $student->update($data);
        return redirect()->route('students.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Student $student)
    {
        $student->delete();
        return redirect()->route('students.index');
    }


    public function getMothers(Request $request)
    {
        $fathers = Father::with('wives')->find($request->father_id);
        return response()->json($fathers->wives);
    }

}
