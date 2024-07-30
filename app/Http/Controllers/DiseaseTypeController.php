<?php

namespace App\Http\Controllers;

use App\Models\DiseaseType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DiseaseTypeController extends Controller {
    public function index() {
        $diseaseTypes = DiseaseType::paginate(10);
        return view('diseases.disease_types', compact('diseaseTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        DiseaseType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $diseaseType = DiseaseType::findOrFail($id);
        return response()->json($diseaseType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $diseaseType = DiseaseType::findOrFail($id);
        $diseaseType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $diseaseType = DiseaseType::findOrFail($id);
        $diseaseType->delete();

        return response()->json(['success' => true]);
    }
}