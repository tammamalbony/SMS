<?php

namespace App\Http\Controllers;

use App\Models\YouthActivityLocation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class YouthActivityLocationController extends Controller
{
    public function index() {
        $youthActivityLocations = YouthActivityLocation::paginate(10);
        return view('youth_activity_locations.index', compact('youthActivityLocations'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'location' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        YouthActivityLocation::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $youthActivityLocation = YouthActivityLocation::findOrFail($id);
        return response()->json($youthActivityLocation);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'location' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $youthActivityLocation = YouthActivityLocation::findOrFail($id);
        $youthActivityLocation->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $youthActivityLocation = YouthActivityLocation::findOrFail($id);
        $youthActivityLocation->delete();

        return response()->json(['success' => true]);
    }
}
