<?php

namespace App\Http\Controllers;

use App\Models\Medal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MedalController extends Controller
{
    public function index() {
        $medals = Medal::paginate(10);
        return view('medals.index', compact('medals'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        Medal::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $medal = Medal::findOrFail($id);
        return response()->json($medal);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $medal = Medal::findOrFail($id);
        $medal->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $medal = Medal::findOrFail($id);
        $medal->delete();

        return response()->json(['success' => true]);
    }
}
