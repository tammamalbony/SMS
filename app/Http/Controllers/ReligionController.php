<?php

namespace App\Http\Controllers;

use App\Models\Religion;
use Illuminate\Http\Request;

class ReligionController extends Controller
{
    // Display a listing of religions
    public function index()
    {
        $religions = Religion::all();
        return view('religions.index', compact('religions'));
    }

    // Show the form for creating a new religion
    public function create()
    {
        return view('religions.create');
    }

    // Store a newly created religion in the database
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:religions,name',
        ]);

        Religion::create($request->all());

        return redirect()->route('religions.index')->with('success', 'Religion added successfully');
    }

    // Show the form for editing the specified religion
    public function edit(Religion $religion)
    {
        // Return the religion data as a JSON response
        return response()->json($religion);
    }

    // Update the specified religion in the database
    public function update(Request $request, Religion $religion)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:religions,name,' . $religion->id,
        ]);

        $religion->update($request->all());

        return response()->json(['success' => true, 'message' => 'Religion updated successfully.']);
    }

    // Remove the specified religion from the database
    public function destroy(Religion $religion)
    {
        $religion->delete();
        return response()->json(['success' => true, 'message' => 'Religion deleted successfully.']);
    }
}
