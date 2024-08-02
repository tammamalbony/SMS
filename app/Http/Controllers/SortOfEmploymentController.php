<?php

namespace App\Http\Controllers;

use App\Models\KindOfEmployment;
use App\Models\SortOfEmployment;
use Illuminate\Http\Request;

class SortOfEmploymentController extends Controller
{
    public function index($kindOfEmploymentId)
    {
        $kindOfEmployment = KindOfEmployment::findOrFail($kindOfEmploymentId);
        $sortsOfEmployment = SortOfEmployment::where('kind_of_employment_id', $kindOfEmploymentId)->get();
        return view('types_of_employment.sortsOfEmployment', compact('sortsOfEmployment', 'kindOfEmployment'));
    }

    public function store(Request $request, $kindOfEmploymentId)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        SortOfEmployment::create([
            'name' => $request->name,
            'kind_of_employment_id' => $kindOfEmploymentId
        ]);

        return response()->json(['success' => true, 'message' => 'تم إضافة نوع التوظيف بنجاح.']);
    }

    public function update(Request $request, $kindOfEmploymentId, $sortOfEmploymentId)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $sortOfEmployment = SortOfEmployment::findOrFail($sortOfEmploymentId);
        $sortOfEmployment->update($request->all());

        return response()->json(['success' => true, 'message' => 'تم تعديل نوع التوظيف بنجاح.']);
    }

    public function destroy($kindOfEmploymentId, $sortOfEmploymentId)
    {
        $sortOfEmployment = SortOfEmployment::findOrFail($sortOfEmploymentId);
        $sortOfEmployment->delete();

        return response()->json(['success' => true, 'message' => 'تم حذف نوع التوظيف بنجاح.']);
    }
}
