<?php

namespace App\Http\Controllers;

use App\Models\SchoolType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SchoolTypeController extends Controller
{
    public function index() {
        $schoolTypes = SchoolType::paginate(10);
        return view('setting.school_types', compact('schoolTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        SchoolType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $schoolType = SchoolType::findOrFail($id);
        return response()->json($schoolType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $schoolType = SchoolType::findOrFail($id);
        $schoolType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $schoolType = SchoolType::findOrFail($id);
        $schoolType->delete();

        return response()->json(['success' => true]);
    }
}
