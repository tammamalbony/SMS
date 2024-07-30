<?php

namespace App\Http\Controllers;

use App\Models\Reward;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RewardController extends Controller
{
    public function index() {
        $rewards = Reward::paginate(10);
        return view('rewards.index', compact('rewards'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        Reward::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $reward = Reward::findOrFail($id);
        return response()->json($reward);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $reward = Reward::findOrFail($id);
        $reward->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $reward = Reward::findOrFail($id);
        $reward->delete();

        return response()->json(['success' => true]);
    }
}
