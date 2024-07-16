<?php

namespace App\Http\Controllers;

use App\Models\BloodType;
use Illuminate\Http\Request;

class BloodTypeController extends Controller
{
    // Display a listing of blood types
    public function index()
    {
        $bloodTypes = BloodType::all();
        return view('blood_types.index', compact('bloodTypes'));
    }

    // Show the form for creating a new blood type
    public function create()
    {
        return view('blood_types.create');
    }

    // Store a newly created blood type in the database
    public function store(Request $request)
    {
        $request->validate([
            'type' => 'required|string|max:5|unique:blood_types,type',
        ]);

        $bloodType = new BloodType($request->all());
        $bloodType->save();

        return redirect()->route('blood_types.index')->with('success', 'Blood Type added successfully');
    }

    // Display the specified blood type
    public function show(BloodType $bloodType)
    {
        return view('blood_types.show', compact('bloodType'));
    }

    // Show the form for editing the specified blood type
    public function edit(BloodType $bloodType)
    {
        //  the blood type data as a JSON response
        return response()->json($bloodType);
    }

    // Update the specified blood type in the database
    public function update(Request $request, BloodType $bloodType)
    {
        $request->validate([
            'type' => 'required|string|max:5|unique:blood_types,type,' . $bloodType->id,
        ]);

        $bloodType->update($request->all());

        return response()->json(['success' => true, 'message' => 'Blood Type updated successfully.']);
    }

    // Remove the specified blood type from the database
    public function destroy(BloodType $bloodType)
    {
        $bloodType->delete();
        return response()->json(['success' => true, 'message' => 'Blood Type deleted successfully.']);

    }
}
