<?php

namespace App\Http\Controllers;

use App\Models\Mark;
use Illuminate\Http\Request;

class MarkController extends Controller
{
    public function index()
    {
        $marks = Mark::paginate(10);
        return view('marks.index', compact('marks'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
            'info' => 'nullable|string',
        ]);

        Mark::create($request->all());

        return response()->json(['success' => 'تم إضافة العلامة بنجاح.']);
    }

    public function edit($id)
    {
        $mark = Mark::findOrFail($id);
        return response()->json($mark);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
            'info' => 'nullable|string',
        ]);

        $mark = Mark::findOrFail($id);
        $mark->update($request->all());

        return response()->json(['success' => 'تم تعديل العلامة بنجاح.']);
    }

    public function destroy($id)
    {
        $mark = Mark::findOrFail($id);
        $mark->delete();

        return response()->json(['success' => 'تم حذف العلامة بنجاح.']);
    }
}
