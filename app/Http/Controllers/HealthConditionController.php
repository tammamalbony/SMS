<?php

namespace App\Http\Controllers;

use App\Models\HealthCondition;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HealthConditionController extends Controller
{
    public function index() {
        $healthConditions = HealthCondition::paginate(10);
        return view('health_conditions.index', compact('healthConditions'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        HealthCondition::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $healthCondition = HealthCondition::findOrFail($id);
        return response()->json($healthCondition);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $healthCondition = HealthCondition::findOrFail($id);
        $healthCondition->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $healthCondition = HealthCondition::findOrFail($id);
        $healthCondition->delete();

        return response()->json(['success' => true]);
    }
}
