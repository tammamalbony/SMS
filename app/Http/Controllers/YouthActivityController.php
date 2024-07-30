<?php

namespace App\Http\Controllers;

use App\Models\YouthActivity;
use App\Models\YouthActivityLocation;
use App\Models\YouthActivityType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class YouthActivityController extends Controller
{
    public function index() {
        $youthActivities = YouthActivity::with('type', 'location')->paginate(10);
        $youthActivityTypes = YouthActivityType::all();
        $youthActivityLocations = YouthActivityLocation::all();
        return view('youth_activities.index', compact('youthActivities', 'youthActivityTypes', 'youthActivityLocations'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'type_id' => 'required|exists:youth_activity_types,id',
            'location_id' => 'required|exists:youth_activity_locations,id',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        YouthActivity::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $youthActivity = YouthActivity::findOrFail($id);
        return response()->json($youthActivity);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'type_id' => 'required|exists:youth_activity_types,id',
            'location_id' => 'required|exists:youth_activity_locations,id',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $youthActivity = YouthActivity::findOrFail($id);
        $youthActivity->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $youthActivity = YouthActivity::findOrFail($id);
        $youthActivity->delete();

        return response()->json(['success' => true]);
    }
}
