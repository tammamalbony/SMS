<?php

namespace App\Http\Controllers;

use App\Models\SpecialNeedsType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SpecialNeedsTypeController extends Controller
{
    public function index() {
        $specialNeedsTypes = SpecialNeedsType::paginate(10);
        return view('special_needs_types.index', compact('specialNeedsTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        SpecialNeedsType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $specialNeedsType = SpecialNeedsType::findOrFail($id);
        return response()->json($specialNeedsType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $specialNeedsType = SpecialNeedsType::findOrFail($id);
        $specialNeedsType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $specialNeedsType = SpecialNeedsType::findOrFail($id);
        $specialNeedsType->delete();

        return response()->json(['success' => true]);
    }
}
