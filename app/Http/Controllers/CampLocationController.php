<?php

namespace App\Http\Controllers;

use App\Models\CampLocation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CampLocationController extends Controller
{
    public function index() {
        $campLocations = CampLocation::paginate(10);
        return view('camps.camp_locations', compact('campLocations'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'location' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        CampLocation::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $campLocation = CampLocation::findOrFail($id);
        return response()->json($campLocation);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'location' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $campLocation = CampLocation::findOrFail($id);
        $campLocation->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $campLocation = CampLocation::findOrFail($id);
        $campLocation->delete();

        return response()->json(['success' => true]);
    }
}
