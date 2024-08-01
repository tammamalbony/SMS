<?php

namespace App\Http\Controllers;

use App\Models\SchoolGender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SchoolGenderController extends Controller
{
    public function index() {
        $schoolGenders = SchoolGender::paginate(10);
        return view('setting.school_genders', compact('schoolGenders'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'gender' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        SchoolGender::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $schoolGender = SchoolGender::findOrFail($id);
        return response()->json($schoolGender);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'gender' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $schoolGender = SchoolGender::findOrFail($id);
        $schoolGender->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $schoolGender = SchoolGender::findOrFail($id);
        $schoolGender->delete();

        return response()->json(['success' => true]);
    }
}
