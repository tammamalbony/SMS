<?php
namespace App\Http\Controllers;

use App\Models\ClasssSchoolYear;
use App\Models\Exam;
use App\Models\Term;
use Illuminate\Http\Request;

class ExamController extends Controller
{
    public function index()
    {
        $classsSchoolYearId = request()->input("classsSchoolYearId");
        $classsSchoolYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);
        $exams = $classsSchoolYear->exams()->paginate(10);
        $terms = Term::all();
        
        return view('exams.index', compact('classsSchoolYear', 'exams', 'terms'));
    }

    public function store(Request $request, $classsSchoolYearId)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'max_degree' => 'required|integer',
            'min_mark' => 'required|integer',
            'total' => 'required|integer',
            'part_id' => 'nullable|exists:parts,id',
            'term_id' => 'required|exists:terms,id'
        ]);

        $classsSchoolYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);
        $classsSchoolYear->exams()->create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($classsSchoolYearId, $examId)
    {
        $exam = Exam::findOrFail($examId);
        return response()->json($exam);
    }

    public function update(Request $request, $classsSchoolYearId, $examId)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'max_degree' => 'required|integer',
            'min_mark' => 'required|integer',
            'total' => 'required|integer',
            'part_id' => 'nullable|exists:parts,id',
            'term_id' => 'required|exists:terms,id'
        ]);

        $exam = Exam::findOrFail($examId);
        $exam->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($classsSchoolYearId, $examId)
    {
        $exam = Exam::findOrFail($examId);
        $exam->delete();

        return response()->json(['success' => true]);
    }
}
