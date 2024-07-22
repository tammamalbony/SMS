<?php

namespace App\Http\Controllers;

use App\Models\ExamResult;
use App\Models\Grade1Results;
use App\Models\VerifiedStudent;
use Illuminate\Http\Request;

class TermsResultsController extends Controller
{
    public function showTerm1Results($id)
    {
        $student = VerifiedStudent::findOrFail($id);
        // dd($student->section->ClasssSchoolYear->classs->id);
        $classsid = $student->section->ClasssSchoolYear->classs->id;
        $Results = ExamResult::where('verified_student_id', $id);
        switch ($classsid) {
            case '1':
                $grades = new Grade1Results();
                $results = $grades->Getbystudent($student);
                dd( $results);
                return view('terms_results.1.front', compact('student', 'Results'));
            case '5':
                return view('terms_results.5.front', compact('student', 'Results'));
            default:
                break;
        }
    }

    public function showTerm2Results($id)
    {
        $student = VerifiedStudent::findOrFail($id);
        $term2Results = $student->term2Results; // Adjust this according to your actual relationship

        return view('terms_results.term2', compact('student', 'term2Results'));
    }
}
