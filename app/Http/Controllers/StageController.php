<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Stage;
use Illuminate\Http\Request;

class StageController extends Controller
{
    public function index()
    {
        $stages = Stage::paginate(10);
        return view('grades.stages', compact('stages'));
    }

  
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        Stage::create($request->all());

        return response()->json(['success' => true, 'message' => 'Stage created successfully.']);
    }

    public function update(Request $request, Stage $stage)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        $stage->update($request->all());

        return response()->json(['success' => true, 'message' => 'Stage updated successfully.']);
    }

    public function destroy(Stage $stage)
    {
        $stage->delete();

        return response()->json(['success' => true, 'message' => 'Stage deleted successfully.']);
    }
}
