<?php

namespace App\Http\Controllers;

use App\Models\EducationLevel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EducationLevelController extends Controller
{
    public function index() {
        $educationLevels = EducationLevel::paginate(10);
        return view('types_of_employment.education_levels', compact('educationLevels'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'level' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        EducationLevel::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $educationLevel = EducationLevel::findOrFail($id);
        return response()->json($educationLevel);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'level' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $educationLevel = EducationLevel::findOrFail($id);
        $educationLevel->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $educationLevel = EducationLevel::findOrFail($id);
        $educationLevel->delete();

        return response()->json(['success' => true]);
    }
}
