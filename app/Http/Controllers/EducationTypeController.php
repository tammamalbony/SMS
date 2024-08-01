<?php

namespace App\Http\Controllers;

use App\Models\EducationType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EducationTypeController extends Controller
{
    public function index() {
        $educationTypes = EducationType::paginate(10);
        return view('education_types.index', compact('educationTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        EducationType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $educationType = EducationType::findOrFail($id);
        return response()->json($educationType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $educationType = EducationType::findOrFail($id);
        $educationType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $educationType = EducationType::findOrFail($id);
        $educationType->delete();

        return response()->json(['success' => true]);
    }
}
