<?php

namespace App\Http\Controllers;

use App\Models\Penalty;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PenaltyController extends Controller
{
    public function index() {
        $penalties = Penalty::paginate(10);
        return view('penalties.index', compact('penalties'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        Penalty::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $penalty = Penalty::findOrFail($id);
        return response()->json($penalty);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $penalty = Penalty::findOrFail($id);
        $penalty->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $penalty = Penalty::findOrFail($id);
        $penalty->delete();

        return response()->json(['success' => true]);
    }
}
