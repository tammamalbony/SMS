<?php

namespace App\Http\Controllers;

use App\Models\PublicUtility;
use Illuminate\Http\Request;

class PublicUtilityController extends Controller
{
    public function index()
    {
        $publicUtilities = PublicUtility::paginate(10);
        return view('setting.public-utilities', compact('publicUtilities'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        PublicUtility::create($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $publicUtility = PublicUtility::findOrFail($id);
        return response()->json($publicUtility);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $publicUtility = PublicUtility::findOrFail($id);
        $publicUtility->update($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $publicUtility = PublicUtility::findOrFail($id);
        $publicUtility->delete();

        return response()->json(['success' => true]);
    }
}
