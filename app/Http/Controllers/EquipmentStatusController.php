<?php

namespace App\Http\Controllers;

use App\Models\EquipmentStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EquipmentStatusController extends Controller
{
    public function index() {
        $equipmentStatuses = EquipmentStatus::paginate(10);
        return view('setting.equipment_statuses', compact('equipmentStatuses'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        EquipmentStatus::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $equipmentStatus = EquipmentStatus::findOrFail($id);
        return response()->json($equipmentStatus);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $equipmentStatus = EquipmentStatus::findOrFail($id);
        $equipmentStatus->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $equipmentStatus = EquipmentStatus::findOrFail($id);
        $equipmentStatus->delete();

        return response()->json(['success' => true]);
    }
}
