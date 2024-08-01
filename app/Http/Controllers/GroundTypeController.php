<?php

namespace App\Http\Controllers;

use App\Models\GroundType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GroundTypeController extends Controller
{
    public function index() {
        $groundTypes = GroundType::paginate(10);
        return view('setting.ground_types', compact('groundTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        GroundType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $groundType = GroundType::findOrFail($id);
        return response()->json($groundType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $groundType = GroundType::findOrFail($id);
        $groundType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $groundType = GroundType::findOrFail($id);
        $groundType->delete();

        return response()->json(['success' => true]);
    }
}
