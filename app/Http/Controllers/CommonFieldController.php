<?php

namespace App\Http\Controllers;

use App\Models\CommonField;
use Illuminate\Http\Request;

class CommonFieldController extends Controller
{
    public function index()
    {
        $commonFields = CommonField::paginate();
        return view('setting.common_fields', compact('commonFields'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        CommonField::create($request->all());
        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $commonField = CommonField::findOrFail($id);
        return response()->json($commonField);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $commonField = CommonField::findOrFail($id);
        $commonField->update($request->all());
        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $commonField = CommonField::findOrFail($id);
        $commonField->delete();
        return response()->json(['success' => true]);
    }
}
