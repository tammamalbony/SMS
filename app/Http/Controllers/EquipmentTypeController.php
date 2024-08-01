<?php

namespace App\Http\Controllers;

use App\Models\EquipmentType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EquipmentTypeController extends Controller
{
    public function index() {
        $equipmentTypes = EquipmentType::paginate(10);
        return view('setting.equipment_types', compact('equipmentTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        EquipmentType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $equipmentType = EquipmentType::findOrFail($id);
        return response()->json($equipmentType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $equipmentType = EquipmentType::findOrFail($id);
        $equipmentType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $equipmentType = EquipmentType::findOrFail($id);
        $equipmentType->delete();

        return response()->json(['success' => true]);
    }
}
