<?php

namespace App\Http\Controllers;

use App\Models\Classs;
use App\Models\SchoolYear;
use App\Models\ClasssSchoolYear;
use App\Models\LearningType;
use Illuminate\Http\Request;

class ClasssSchoolYearController extends Controller
{
    public function addAllClasses(SchoolYear $schoolYear)
    {
        $classIds = Classs::pluck('id');

        foreach ($classIds as $classId) {
            ClasssSchoolYear::updateOrCreate(
                ['classs_id' => $classId, 'school_year_id' => $schoolYear->id],
                ['classs_id' => $classId, 'school_year_id' => $schoolYear->id]
            );
        }

        return response()->json(['success' => 'تمت إضافة جميع الصفوف للسنة الدراسية بنجاح.']);
    }

    public function index(SchoolYear $schoolYear)
    {
        $classsSchoolYears = ClasssSchoolYear::where('school_year_id', $schoolYear->id)->get();
        $classes = Classs::all();
        $learningTypes = LearningType::all();
        return view('classs_school_year.index', compact('classsSchoolYears', 'classes', 'schoolYear', 'learningTypes'));
    }

    public function create(SchoolYear $schoolYear)
    {
        $classes = Classs::all();
        $learningTypes = LearningType::all();
        return view('classs_school_year.create', compact('classes', 'schoolYear', 'learningTypes'));
    }

    public function edit($id)
    {
        $relation = ClasssSchoolYear::find($id);
        return response()->json($relation);
    }

    public function store(Request $request, SchoolYear $schoolYear)
    {
        $validated = $request->validate([
            'classs_id' => 'required|exists:classses,id',
            'is_final_result_failing' => 'required|boolean',
            'min_required_result' => 'nullable|integer',
            'is_attendance_required' => 'required|boolean',
            'min_required_attendance_percent' => 'nullable|integer',
            'help_for_subjects' => 'required|boolean',
            'learning_type_id' => 'nullable|exists:learning_types,id',
        ]);

        $data = $request->all();
        $data['school_year_id'] = $schoolYear->id;
        ClasssSchoolYear::create($data);

        return response()->json(['success' => 'تم إنشاء العلاقة بنجاح.']);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'classs_id' => 'required|exists:classses,id',
            'is_final_result_failing' => 'required|boolean',
            'min_required_result' => 'nullable|integer',
            'is_attendance_required' => 'required|boolean',
            'min_required_attendance_percent' => 'nullable|integer',
            'help_for_subjects' => 'required|boolean',
            'learning_type_id' => 'nullable|exists:learning_types,id',
        ]);

        $data  = $request->all();
        $relation = ClasssSchoolYear::find($id);
        $relation->update($data);

        return response()->json(['success' => 'تم تحديث العلاقة بنجاح.']);
    }

    public function destroy($id)
    {
        $relation = ClasssSchoolYear::find($id);
        $relation->delete();

        return response()->json(['success' => 'تم حذف العلاقة بنجاح.']);
    }
}
