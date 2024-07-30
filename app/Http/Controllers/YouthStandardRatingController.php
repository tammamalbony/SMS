<?php

namespace App\Http\Controllers;

use App\Models\YouthStandardRating;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class YouthStandardRatingController extends Controller
{
    public function index() {
        $youthStandardRatings = YouthStandardRating::paginate(10);
        return view('youth_activities.youth_standard_ratings', compact('youthStandardRatings'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'rate' => 'required|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        YouthStandardRating::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $youthStandardRating = YouthStandardRating::findOrFail($id);
        return response()->json($youthStandardRating);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'rate' => 'required|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $youthStandardRating = YouthStandardRating::findOrFail($id);
        $youthStandardRating->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $youthStandardRating = YouthStandardRating::findOrFail($id);
        $youthStandardRating->delete();

        return response()->json(['success' => true]);
    }
}
