<?php

namespace App\Http\Controllers;

use App\Models\SocialTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SocialTraitController extends Controller
{
    public function index() {
        $socialTraits = SocialTrait::paginate(10);
        return view('social_traits.index', compact('socialTraits'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        SocialTrait::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $socialTrait = SocialTrait::findOrFail($id);
        return response()->json($socialTrait);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $socialTrait = SocialTrait::findOrFail($id);
        $socialTrait->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $socialTrait = SocialTrait::findOrFail($id);
        $socialTrait->delete();

        return response()->json(['success' => true]);
    }
}
