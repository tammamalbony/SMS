<?php

namespace App\Http\Controllers;

use App\Models\YouthStandard;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class YouthStandardController extends Controller
{
    public function index() {
        $youthStandards = YouthStandard::paginate(10);
        return view('youth_activities.youth_standards', compact('youthStandards'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        YouthStandard::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $youthStandard = YouthStandard::findOrFail($id);
        return response()->json($youthStandard);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $youthStandard = YouthStandard::findOrFail($id);
        $youthStandard->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $youthStandard = YouthStandard::findOrFail($id);
        $youthStandard->delete();

        return response()->json(['success' => true]);
    }
}
