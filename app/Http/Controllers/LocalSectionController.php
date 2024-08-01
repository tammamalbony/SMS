<?php

namespace App\Http\Controllers;

use App\Models\LocalSection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LocalSectionController extends Controller
{
    public function index() {
        $localSections = LocalSection::paginate(10);
        return view('setting.local_sections', compact('localSections'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        LocalSection::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $localSection = LocalSection::findOrFail($id);
        return response()->json($localSection);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $localSection = LocalSection::findOrFail($id);
        $localSection->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $localSection = LocalSection::findOrFail($id);
        $localSection->delete();

        return response()->json(['success' => true]);
    }
}
