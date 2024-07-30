<?php

namespace App\Http\Controllers;

use App\Models\YouthActivityType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class YouthActivityTypeController extends Controller
{
    public function index() {
        $youthActivityTypes = YouthActivityType::paginate(10);
        return view('youth_activities.youth_activity_types', compact('youthActivityTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        YouthActivityType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $youthActivityType = YouthActivityType::findOrFail($id);
        return response()->json($youthActivityType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $youthActivityType = YouthActivityType::findOrFail($id);
        $youthActivityType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $youthActivityType = YouthActivityType::findOrFail($id);
        $youthActivityType->delete();

        return response()->json(['success' => true]);
    }
}
