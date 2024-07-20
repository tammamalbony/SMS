<?php

namespace App\Http\Controllers;

use App\Models\RegistrationType;
use App\Models\Student;
use Illuminate\Http\Request;

class StudentAdditionalDetailController extends Controller
{
    public function index($studentId)
    {
        $student = Student::findOrFail($studentId);
        $additionalDetail = $student->additionalDetail;
        $registrationTypes = RegistrationType::all();

        return view('student.additional_details.index', compact('student', 'additionalDetail', 'registrationTypes'));
    }

    public function store(Request $request, $studentId)
    {
        $request->validate([
            'number_of_fail_years' => 'required|integer',
            'previous_school' => 'nullable|string|max:255',
            'registration_type_id' => 'required|exists:registration_types,id',
        ]);

        $student = Student::findOrFail($studentId);
        $student->additionalDetail()->updateOrCreate(
            ['student_id' => $studentId],
            $request->only('number_of_fail_years', 'previous_school', 'registration_type_id')
        );

        return response()->json(['success' => true]);
    }

    public function edit($studentId)
    {
        $student = Student::findOrFail($studentId);
        $additionalDetail = $student->additionalDetail;
        $registrationTypes = RegistrationType::all();

        return response()->json(['additionalDetail' => $additionalDetail, 'registrationTypes' => $registrationTypes]);
    }

    public function update(Request $request, $studentId)
    {
        $request->validate([
            'number_of_fail_years' => 'required|integer',
            'previous_school' => 'nullable|string|max:255',
            'registration_type_id' => 'required|exists:registration_types,id',
        ]);

        $student = Student::findOrFail($studentId);
        $student->additionalDetail()->updateOrCreate(
            ['student_id' => $studentId],
            $request->only('number_of_fail_years', 'previous_school', 'registration_type_id')
        );

        return response()->json(['success' => true]);
    }

    public function destroy($studentId)
    {
        $student = Student::findOrFail($studentId);
        $student->additionalDetail()->delete();

        return response()->json(['success' => true]);
    }
}
