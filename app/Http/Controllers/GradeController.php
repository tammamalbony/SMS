<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Stage;
use Illuminate\Http\Request;

class GradeController extends Controller
{
    public function index()
    {
        $grades = Grade::with('stage', 'parent')->where('parent_id',null)->paginate(10);
        $stages = Stage::all();
        return view('grades.index', compact('grades', 'stages'));
    }
    public function getGradesByStage($stageId)
    {
        $grades = Grade::where('stage_id', $stageId)->get();
        return response()->json($grades);
    }
    public function store(Request $request)
    {
        $data = $request->validate([
            'grade_name_ar' => 'required|string|max:255',
            'grade_name_en' => 'required|string|max:255',
            'grade_notes' => 'nullable|string',
            'stage_id' => 'required|exists:stages,id',
            'parent_id' => 'nullable|exists:grades,id'
        ]);

        Grade::create($data);
        return response()->json(['success' => true, 'message' => 'Grade created successfully.']);
    }

    public function showClasses($gradeId)
    {
        $targetgrade = Grade::with('classes')->findOrFail($gradeId);
        if (!$targetgrade->hasNoChildren()) {
            return redirect()->route('grades.index')->with('error', 'This grade has child grades and cannot have classes.');
        }
        return view('classes.index', compact('targetgrade'));
    }

    public function edit($id)
    {
        $grade = Grade::with('stage', 'parent')->findOrFail($id);
        if ($grade) {
            return response()->json(['success' => true, 'grade' => $grade]);
        } else {
            return response()->json(['success' => false, 'message' => 'Grade not found.']);
        }
    }
    public function update(Request $request, $id)
    {
        $grade = Grade::findOrFail($id);
        $data = $request->validate([
            'grade_name_ar' => 'required|string|max:255',
            'grade_name_en' => 'required|string|max:255',
            'grade_notes' => 'nullable|string',
            'stage_id' => 'required|exists:stages,id',
            'parent_id' => 'nullable|exists:grades,id'
        ]);

        $grade->update($data);
        return response()->json(['success' => true, 'message' => 'Grade updated successfully.']);
    }
    public function getall(Request $request)
    {
        $stage_id = $request->query('stage_id');
        $stages = Stage::all();
        
        $grades = Grade::select('grades.id', 'grades.grade_name_ar', 'grades.stage_id')
                       ->leftJoin('grades as children', 'grades.id', '=', 'children.parent_id')
                       ->whereNull('children.id');
    
        if ($stage_id) {
            $grades->where('grades.stage_id', $stage_id);
        }
        
        $grades = $grades->get();
        
        return response()->json(['stages' => $stages, 'grades' => $grades]);
    }

    public function showChildren($id)
{
    $grade = Grade::with('children')->findOrFail($id);
    return view('grades.children', compact('grade'));
}
    public function destroy($id)
    {
        $grade = Grade::findOrFail($id);
        if ($grade) {
            $grade->delete();
            return response()->json(['success' => true, 'message' => 'Grade deleted successfully.']);
        } else {
            return response()->json(['success' => false, 'message' => 'Failed to delete the grade.']);
        }
    }
}
