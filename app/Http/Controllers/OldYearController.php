<?php

namespace App\Http\Controllers;

use App\Models\OldYear;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OldYearController extends Controller
{
    public function index()
    {
        $oldyears = OldYear::paginate(10);
        return view('archive.oldyears', compact('oldyears'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'start_year' => 'required|integer',
            'end_year' => 'required|integer',
            'note' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $oldYear = new OldYear();
        $oldYear->start_year = $request->start_year;
        $oldYear->end_year = $request->end_year;
        $oldYear->note = $request->note;
        $oldYear->save();

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $oldYear = OldYear::find($id);
        return response()->json($oldYear);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'start_year' => 'required|integer',
            'end_year' => 'required|integer',
            'note' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $oldYear = OldYear::find($id);
        $oldYear->start_year = $request->start_year;
        $oldYear->end_year = $request->end_year;
        $oldYear->note = $request->note;
        $oldYear->save();

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $oldYear = OldYear::find($id);
        $oldYear->delete();

        return response()->json(['success' => true]);
    }
}
