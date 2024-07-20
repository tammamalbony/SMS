<?php

namespace App\Http\Controllers;

use App\Enums\VerifiedStudentStatus;
use App\Models\ClasssSchoolYear;
use App\Models\Section;
use App\Models\SectionType;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\VerifiedStudent;
use Illuminate\Http\Request;

class SectionController extends Controller
{
    public function index($classsSchoolYear)
    {
        // dd($classsSchoolYear);
        $classsYear = ClasssSchoolYear::findOrFail($classsSchoolYear);
        $sections = Section::with('sectionType', 'classsSchoolYear', 'teacher')
            ->where("classs_school_year_id",$classsSchoolYear)
           ->paginate(10);
        $sectionTypes = SectionType::all();
        $teachers = Teacher::all();
        return view('sections.index', compact('sections', 'sectionTypes', 'classsYear', 'teachers'));
    }

    public function create($classsSchoolYear)
    {
        $sectionTypes = SectionType::all();
        $teachers = Teacher::all();
        return view('sections.create', compact('sectionTypes', 'classsSchoolYear', 'teachers'));
    }

    public function store(Request $request)
    {
        // dd($request);
        $request->validate([
            'name' => 'required|string|max:255',
            'section_type_id' => 'required|exists:section_types,id',
            'classs_school_year_id' => 'required|exists:classs_school_years,id',
            'teacher_id' => 'required|exists:teachers,id',
        ]);

        $section = Section::create($request->all());

        return response()->json([
            'success' => true,
            'message' => 'تم إنشاء الشعبة بنجاح.',
            'section' => $section,
        ], 201);
    }

    public function edit($classsSchoolYearId, $sectionId)
    {
        // Fetch the section details
        $section = Section::with('sectionType', 'teacher', 'classsSchoolYear.SchoolYear')
            ->where('id', $sectionId)
            ->where('classs_school_year_id', $classsSchoolYearId)
            ->firstOrFail();

        // Fetch all section types and teachers for the dropdowns
        $sectionTypes = SectionType::all();
        $teachers = Teacher::all();
        $classsYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);

        return response()->json([
            'section' => $section,
            'sectionTypes' => $sectionTypes,
            'teachers' => $teachers,
            'classsYear' => $classsYear,
        ]);
    }
    public function verifiedStudents($sectionId)
    {
        $students = $this->getEligibleStudents();
        $section = Section::findOrFail($sectionId);
        $verifiedStudents = VerifiedStudent::with('student')->where('section_id', $sectionId)->orderBy('order')->get();
        
        return view('sections.verified_students', compact('section', 'verifiedStudents','students'));
    }
    public function getEligibleStudents()
    {
        // Fetch students who are either not verified or verified but not confirmed
        $students = Student::whereDoesntHave('verifiedStudent')
            ->orWhereHas('verifiedStudent', function ($query) {
                $query->where('status', '!=', VerifiedStudentStatus::CONFIRMED->value)
                ->whereNull('section_id');
            })
            ->get();
        return $students;
    }
    public function updateOrder(Request $request, $sectionId)
    {
        $orderData = $request->order;

        foreach ($orderData as $data) {
            VerifiedStudent::where('id', $data['id'])->update(['order' => $data['order']]);
        }

        return response()->json(['success' => 'تم تحديث الترتيب بنجاح!']);
    }
    public function sortAlphabetically($sectionId)
    {
        // Retrieve all verified students for the given section, sorted alphabetically by student name
        $verifiedStudents = VerifiedStudent::where('section_id', $sectionId)
            ->with('student')  // Ensure the student relationship is loaded
            ->get()
            ->sortBy(function($verifiedStudent) {
                return $verifiedStudent->student->name_ar; // Change to the appropriate attribute for alphabetic sorting
            });

        // Update the order for each verified student
        $order = 1;
        foreach ($verifiedStudents as $verifiedStudent) {
            $verifiedStudent->update(['order' => $order]);
            $order++;
        }

        return response()->json(['success' => 'تم ترتيب الطلاب أبجدياً بنجاح!']);
    }
    
    public function update(Request $request, $classsSchoolYearId, $sectionId)
    {

        $section = Section::findOrFail($sectionId);
        $request->validate([
            'name' => 'required|string|max:255',
            'section_type_id' => 'required|exists:section_types,id',
            'classs_school_year_id' => 'required|exists:classs_school_years,id',
            'teacher_id' => 'required|exists:teachers,id',
        ]);
        $section->update($request->all());
        return response()->json([
            'success' => true,
            'message' => 'تم تعديل الشعبة بنجاح.',
        ], 201);
    }

    public function destroy(Request $request, $classsSchoolYearId, $sectionId)
    {
        $sectionTarget = Section::findOrFail($sectionId);
        $sectionTarget->delete();

        return response()->json([
            'success' => true,
            'message' => 'تم حذف الشعبة بنجاح.',
        ], 201);
    }
}
