<?php

namespace App\Http\Controllers;

use App\Models\BuildingStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BuildingStatusController extends Controller
{
    public function index() {
        $buildingStatuses = BuildingStatus::paginate(10);
        return view('setting.building_statuses', compact('buildingStatuses'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        BuildingStatus::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $buildingStatus = BuildingStatus::findOrFail($id);
        return response()->json($buildingStatus);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $buildingStatus = BuildingStatus::findOrFail($id);
        $buildingStatus->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $buildingStatus = BuildingStatus::findOrFail($id);
        $buildingStatus->delete();

        return response()->json(['success' => true]);
    }
}
