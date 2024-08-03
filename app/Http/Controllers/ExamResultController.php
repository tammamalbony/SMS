<?php

namespace App\Http\Controllers;

use App\Models\Part;
use App\Models\Student;
use App\Models\Term;
use App\Models\YearClassSubject;
use Illuminate\Http\Request;
use App\Models\ExamResult;
use App\Models\VerifiedStudent;
use App\Models\Exam;

class ExamResultController extends Controller
{
    public function index($verifiedStudentId)
    {
        // الطالب
        $verifiedStudent = VerifiedStudent::with('student', 'examResults')->findOrFail($verifiedStudentId);
        // الصف الدراسي للطالب ضمن السنة --------> schoolyear
        $classsSchoolYear = $verifiedStudent->section->classsSchoolYear;
        // معرف السنة   ---------> class
        $classs_school_year_id = $classsSchoolYear->id;
        // تفاصيل مواد الصف ضمن السنة 
        $yearClassSubjects = YearClassSubject::with([
            'subjectDetail' => function ($query) {
                $query->where('is_active', true);
            }
        ])->where('c_s_y_id', $classs_school_year_id)->get();

        $terms = Term::where('is_active', true)->get();
        // تفاصيل المادة $yearClassSubject->subjectDetail

        // dd($yearClassSubjects);
        // foreach(  $yearClassSubjects as $yearClassSubject){
        //     dd($yearClassSubject->subjectDetail);
        // }

        // $yearClassSubjectIds = $yearClassSubjects->pluck('id')->toArray();

        // $parts =Part::whereIn('year_class_subject_id', $yearClassSubjectIds)
        // ->where('must_be_calculated', 0)
        // ->where('is_active', 1)
        // ->where('is_sealed', 0)
        // ->where('must_be_ceiled', 0)
        // ->where('is_final_result', 0)
        // ->whereNull('value')
        // ->whereNull('operation')
        // ->get();
        // // dd($parts);
        return view('exam_results.index', compact('verifiedStudent', 'yearClassSubjects', 'terms'));
    }

    public function create($verifiedStudentId, $partId)
    {
        $terms = Term::where('is_active', true)->get();
        return view('exam_results.create', compact('verifiedStudentId', 'partId', 'terms'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'part_id' => 'required|exists:parts,id',
            'class_id' => 'required|exists:classs_school_years,id',
            'verified_student_id' => 'required|exists:verified_students,id',
            'max_grade' => 'required|numeric',
            'failing_grade' => 'required|numeric',
            'subject_is_failing' => 'required|boolean',
            'term_id' => 'required|exists:terms,id', // Add validation for term_id
        ]);

        $examResult = new ExamResult($request->all());
        $examResult->atemptes = 0;
        $examResult->save();

        return back()->with('success', 'Exam result created successfully.');
    }

    public function edit(ExamResult $examResult)
    {
        $terms = Term::where('is_active', true)->get();
        return view('exam_results.edit', compact('examResult', 'terms'));
    }

    public function update(Request $request, ExamResult $examResult)
    {
        $request->validate([
            'max_grade' => 'required|numeric',
            'failing_grade' => 'required|numeric',
            'subject_is_failing' => 'required|boolean',
            'term_id' => 'required|exists:terms,id', // Add validation for term_id
        ]);

        $examResult->update($request->all());
        $examResult->increment('atemptes');

        return back()->with('success', 'Exam result updated successfully.');
    }
}
