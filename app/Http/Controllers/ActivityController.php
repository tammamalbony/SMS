<?php

namespace App\Http\Controllers;

use App\Models\Activity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ActivityController extends Controller
{
    public function index() {
        $activities = Activity::paginate(10);
        return view('activities.index', compact('activities'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        Activity::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $activity = Activity::findOrFail($id);
        return response()->json($activity);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $activity = Activity::findOrFail($id);
        $activity->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $activity = Activity::findOrFail($id);
        $activity->delete();

        return response()->json(['success' => true]);
    }
}
