<?php

namespace App\Http\Controllers;

use App\Models\CampType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CampTypeController extends Controller
{
    public function index() {
        $campTypes = CampType::paginate(10);
        return view('camps.camp_types', compact('campTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        CampType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $campType = CampType::findOrFail($id);
        return response()->json($campType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $campType = CampType::findOrFail($id);
        $campType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $campType = CampType::findOrFail($id);
        $campType->delete();

        return response()->json(['success' => true]);
    }
}
