<?php

namespace App\Http\Controllers;

use App\Models\YearClassSubject;
use Illuminate\Http\Request;
use App\Models\ExamResult;
use App\Models\VerifiedStudent;
use App\Models\Exam;

class ExamResultController extends Controller
{
    public function index($verifiedStudentId)
    {
        $verifiedStudent = VerifiedStudent::with('student', 'examResults')->findOrFail($verifiedStudentId);
        $classs_school_year_id = $verifiedStudent->section->classs_school_year_id;
        $exams = Exam::where('classs_school_year_id', $classs_school_year_id)->get();
        $yearClassSubjects = YearClassSubject::where("c_s_y_id",$classs_school_year_id)->get();
        return view('exam_results.index', compact('verifiedStudent', 'exams','yearClassSubjects'));
    }

    public function create($verifiedStudentId, $examId)
    {
        return view('exam_results.create', compact('verifiedStudentId', 'examId'));
    }

    public function store(Request $request)
    {
        // dd($request);
        $request->validate([
            'exam_id' => 'required|exists:exams,id',
            'class_id' => 'required|exists:classs_school_years,id',
            'verified_student_id' => 'required|exists:verified_students,id',
            'max_grade' => 'required|numeric',
            'failing_grade' => 'required|numeric',
            'subject_is_failing' => 'required|boolean',
        ]);

        $examResult = new ExamResult($request->all());
        $examResult->atemptes = 0;
        $examResult->save();

        return redirect()->route('exam_results.index', $request->verified_student_id)->with('success', 'Exam result created successfully.');
    }

    public function edit(ExamResult $examResult)
    {
        return view('exam_results.edit', compact('examResult'));
    }

    public function update(Request $request, ExamResult $examResult)
    {
        $request->validate([
            'max_grade' => 'required|numeric',
            'failing_grade' => 'required|numeric',
            'subject_is_failing' => 'required|boolean',
        ]);

        $examResult->update($request->all());
        $examResult->increment('atemptes');

        return redirect()->route('exam_results.index', $examResult->verified_student_id)->with('success', 'Exam result updated successfully.');
    }
}
