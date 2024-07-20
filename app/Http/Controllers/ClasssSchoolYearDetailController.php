<?php

namespace App\Http\Controllers;

use App\Models\ClasssSchoolYear;
use App\Models\ClasssSchoolYearDetail;
use Illuminate\Http\Request;

class ClasssSchoolYearDetailController extends Controller
{
    public function index($classsSchoolYearId)
    {
        $classsSchoolYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);
        $details = $classsSchoolYear->details;

        return view('classs_school_year_details.index', compact('classsSchoolYear', 'details'));
    }

    public function store(Request $request, $classsSchoolYearId)
    {
        $request->validate([
            'first_term_days' => 'nullable|integer',
            'second_term_days' => 'nullable|integer',
            'note' => 'nullable|string',
            'max_students' => 'nullable|integer',
            'status' => 'required|boolean',
        ]);

        $classsSchoolYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);
        $classsSchoolYear->details()->updateOrCreate(
            ['classs_school_year_id' => $classsSchoolYearId],
            $request->only('first_term_days', 'second_term_days', 'note', 'max_students', 'status')
        );

        return redirect()->route('classs_school_year_details.index', $classsSchoolYearId)->with('success', 'Details saved successfully.');
    }

    public function edit($classsSchoolYearId)
    {
        $classsSchoolYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);
        $details = $classsSchoolYear->details;

        return view('classs_school_year_details.edit', compact('classsSchoolYear', 'details'));
    }

    public function update(Request $request, $classsSchoolYearId)
    {
        $request->validate([
            'first_term_days' => 'nullable|integer',
            'second_term_days' => 'nullable|integer',
            'note' => 'nullable|string',
            'max_students' => 'nullable|integer',
            'status' => 'required|boolean',
        ]);

        $classsSchoolYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);
        $details = $classsSchoolYear->details;

        if ($details) {
            $details->update($request->only('first_term_days', 'second_term_days', 'note', 'max_students', 'status'));
        } else {
            $classsSchoolYear->details()->create($request->only('first_term_days', 'second_term_days', 'note', 'max_students', 'status'));
        }

        return redirect()->route('classs_school_year_details.index', $classsSchoolYearId)->with('success', 'Details updated successfully.');
    }

    public function destroy($classsSchoolYearId)
    {
        $classsSchoolYear = ClasssSchoolYear::findOrFail($classsSchoolYearId);
        $details = $classsSchoolYear->details;

        if ($details) {
            $details->delete();
        }

        return redirect()->route('classs_school_year_details.index', $classsSchoolYearId)->with('success', 'Details removed successfully.');
    }
}
