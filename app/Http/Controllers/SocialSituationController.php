<?php

namespace App\Http\Controllers;

use App\Models\SocialSituation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SocialSituationController extends Controller
{
    public function index() {
        $socialSituations = SocialSituation::paginate(10);
        return view('social_situations.index', compact('socialSituations'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'situation' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        SocialSituation::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $socialSituation = SocialSituation::findOrFail($id);
        return response()->json($socialSituation);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'situation' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $socialSituation = SocialSituation::findOrFail($id);
        $socialSituation->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $socialSituation = SocialSituation::findOrFail($id);
        $socialSituation->delete();

        return response()->json(['success' => true]);
    }
}
