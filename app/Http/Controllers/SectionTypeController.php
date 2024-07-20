<?php

namespace App\Http\Controllers;

use App\Models\SectionType;
use Illuminate\Http\Request;

class SectionTypeController extends Controller
{
    public function index()
    {
        $sectionTypes = SectionType::paginate(10);
        return view('section_types.index', compact('sectionTypes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $sectionType = SectionType::create($request->all());

        return response()->json(['success' => true, 'message' => 'تم إنشاء نوع القسم بنجاح.', 'data' => $sectionType]);
    }

    public function edit(SectionType $sectionType)
    {
        return response()->json($sectionType);
    }

    public function update(Request $request, SectionType $sectionType)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $sectionType->update($request->all());

        return response()->json(['success' => true, 'message' => 'تم تعديل نوع القسم بنجاح.', 'data' => $sectionType]);
    }

    public function destroy(SectionType $sectionType)
    {
        $sectionType->delete();

        return response()->json(['success' => true, 'message' => 'تم حذف نوع القسم بنجاح.']);
    }
}
