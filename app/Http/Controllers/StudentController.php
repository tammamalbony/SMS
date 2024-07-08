<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StudentController extends Controller
{
    public function index()
    {
        return view('student.dashboard');
    }

    /**
     * Show grades for the student.
     *
     * @return \Illuminate\View\View
     */
    public function viewGrades()
    {
        return view('student.view_grades');
    }

    /**
     * Show attendance for the student.
     *
     * @return \Illuminate\View\View
     */
    public function viewAttendance()
    {
        return view('student.view_attendance');
    }
}
