<?php

namespace App\Http\Controllers;

use App\Models\SchoolBuildingType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SchoolBuildingTypeController extends Controller
{
    public function index() {
        $schoolBuildingTypes = SchoolBuildingType::paginate(10);
        return view('setting.school_building_types', compact('schoolBuildingTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        SchoolBuildingType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $schoolBuildingType = SchoolBuildingType::findOrFail($id);
        return response()->json($schoolBuildingType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $schoolBuildingType = SchoolBuildingType::findOrFail($id);
        $schoolBuildingType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $schoolBuildingType = SchoolBuildingType::findOrFail($id);
        $schoolBuildingType->delete();

        return response()->json(['success' => true]);
    }
}
