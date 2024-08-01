<?php

namespace App\Http\Controllers;

use App\Models\EducationLevel;
use App\Models\EducationSpecialization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EducationSpecializationController extends Controller
{
    public function index($educationLevelId) {
        $educationLevel = EducationLevel::findOrFail($educationLevelId);
        $specializations = $educationLevel->specializations()->paginate(10);
        return view('types_of_employment.education_specializations', compact('specializations', 'educationLevel'));
    }

    public function store(Request $request, $educationLevelId) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        EducationSpecialization::create([
            'name' => $request->name,
            'education_level_id' => $educationLevelId,
        ]);

        return response()->json(['success' => true]);
    }

    public function edit($educationLevelId, $specializationId) {
        $specialization = EducationSpecialization::where('education_level_id', $educationLevelId)->findOrFail($specializationId);
        return response()->json($specialization);
    }

    public function update(Request $request, $educationLevelId, $specializationId) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $specialization = EducationSpecialization::where('education_level_id', $educationLevelId)->findOrFail($specializationId);
        $specialization->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($educationLevelId, $specializationId) {
        $specialization = EducationSpecialization::where('education_level_id', $educationLevelId)->findOrFail($specializationId);
        $specialization->delete();

        return response()->json(['success' => true]);
    }
}
