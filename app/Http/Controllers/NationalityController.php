<?php

namespace App\Http\Controllers;

use App\Models\Nationality;
use Illuminate\Http\Request;

class NationalityController extends Controller
{
    // Display a listing of nationalities
    public function index()
    {
        $nationalities = Nationality::all();
        return view('nationalities.index', compact('nationalities'));
    }

    // Show the form for creating a new nationality
    public function create()
    {
        return view('nationalities.create');
    }

    // Store a newly created nationality in the database
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:nationalities,name',
        ]);

        Nationality::create($request->all());

        return redirect()->route('nationalities.index')->with('success', 'Nationality added successfully');
    }

    // Show the form for editing the specified nationality
    public function edit(Nationality $nationality)
    {
        // Return the nationality data as a JSON response
        return response()->json($nationality);
    }

    // Update the specified nationality in the database
    public function update(Request $request, Nationality $nationality)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:nationalities,name,' . $nationality->id,
        ]);

        $nationality->update($request->all());

        return response()->json(['success' => true, 'message' => 'Nationality updated successfully.']);
    }

    // Remove the specified nationality from the database
    public function destroy(Nationality $nationality)
    {
        $nationality->delete();
        return response()->json(['success' => true, 'message' => 'Nationality deleted successfully.']);
    }
}
