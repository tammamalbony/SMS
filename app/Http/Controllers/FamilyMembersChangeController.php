<?php

namespace App\Http\Controllers;

use App\Models\FamilyMembersChange;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FamilyMembersChangeController extends Controller
{
    public function index() {
        $familyMembersChanges = FamilyMembersChange::paginate(10);
        return view('family_members_changes.index', compact('familyMembersChanges'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        FamilyMembersChange::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $familyMembersChange = FamilyMembersChange::findOrFail($id);
        return response()->json($familyMembersChange);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $familyMembersChange = FamilyMembersChange::findOrFail($id);
        $familyMembersChange->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $familyMembersChange = FamilyMembersChange::findOrFail($id);
        $familyMembersChange->delete();

        return response()->json(['success' => true]);
    }
}
