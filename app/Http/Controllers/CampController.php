<?php

namespace App\Http\Controllers;

use App\Models\Camp;
use App\Models\CampLocation;
use App\Models\CampType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CampController extends Controller
{
    public function index() {
        $camps = Camp::with('location', 'type')->paginate(10);
        $campLocations = CampLocation::all();
        $campTypes = CampType::all();
        return view('camps.index', compact('camps', 'campLocations', 'campTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'date' => 'required|date',
            'rate' => 'required|max:255',
            'location_id' => 'required|exists:camp_locations,id',
            'type_id' => 'required|exists:camp_types,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        Camp::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $camp = Camp::findOrFail($id);
        return response()->json($camp);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'date' => 'required|date',
            'rate' => 'required|max:255',
            'location_id' => 'required|exists:camp_locations,id',
            'type_id' => 'required|exists:camp_types,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $camp = Camp::findOrFail($id);
        $camp->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $camp = Camp::findOrFail($id);
        $camp->delete();

        return response()->json(['success' => true]);
    }
}
