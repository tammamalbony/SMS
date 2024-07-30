<?php

namespace App\Http\Controllers;

use App\Models\MedicalCondition;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MedicalConditionController extends Controller
{
    public function index() {
        $medicalConditions = MedicalCondition::paginate(10);
        return view('medical_conditions.index', compact('medicalConditions'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        MedicalCondition::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $medicalCondition = MedicalCondition::findOrFail($id);
        return response()->json($medicalCondition);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $medicalCondition = MedicalCondition::findOrFail($id);
        $medicalCondition->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $medicalCondition = MedicalCondition::findOrFail($id);
        $medicalCondition->delete();

        return response()->json(['success' => true]);
    }
}
