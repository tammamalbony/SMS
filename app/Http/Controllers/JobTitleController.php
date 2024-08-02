<?php

namespace App\Http\Controllers;

use App\Models\JobTitle;
use App\Models\KindOfEmployment;
use Illuminate\Http\Request;

class JobTitleController extends Controller
{
    public function index($kindOfEmploymentId)
    {
        $kindOfEmployment = KindOfEmployment::findOrFail($kindOfEmploymentId);
        $jobTitles = JobTitle::where('kind_of_employment_id', $kindOfEmploymentId)->get();
        return view('types_of_employment.job_titles', compact('jobTitles', 'kindOfEmployment'));
    }

    public function store(Request $request, $kindOfEmploymentId)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        JobTitle::create([
            'name' => $request->name,
            'kind_of_employment_id' => $kindOfEmploymentId,
        ]);

        return response()->json(['success' => true, 'message' => 'تم إضافة المسمى الوظيفي بنجاح.']);
    }

    public function update(Request $request, $kindOfEmploymentId, $jobTitleId)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $jobTitle = JobTitle::findOrFail($jobTitleId);
        $jobTitle->update($request->all());

        return response()->json(['success' => true, 'message' => 'تم تعديل المسمى الوظيفي بنجاح.']);
    }

    public function destroy($kindOfEmploymentId, $jobTitleId)
    {
        $jobTitle = JobTitle::findOrFail($jobTitleId);
        $jobTitle->delete();

        return response()->json(['success' => true, 'message' => 'تم حذف المسمى الوظيفي بنجاح.']);
    }
}
