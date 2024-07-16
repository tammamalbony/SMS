<?php

namespace App\Http\Controllers;

use App\Models\Father;
use App\Models\Nationality;
use App\Models\BloodType;
use App\Models\Religion;
use Illuminate\Http\Request;

class FatherController extends Controller
{
    // Display a listing of fathers
    public function index()
    {
        $nationalities = Nationality::all();
        $bloodTypes = BloodType::all();
        $religions = Religion::all();
        $fathers = Father::all();
        return view('fathers.index', compact('fathers','nationalities', 'bloodTypes', 'religions'));
    }

    // Show the form for creating a new father
    public function create()
    {
        $nationalities = Nationality::all();
        $bloodTypes = BloodType::all();
        $religions = Religion::all();
        return view('fathers.create', compact('nationalities', 'bloodTypes', 'religions'));
    }

    // Store a newly created father in the database
    public function store(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email|max:255|unique:fathers,email',
            'password' => 'required|string|min:8',
            'name' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'job' => 'required|string|max:255',
            'job_en' => 'required|string|max:255',
            'national_id' => 'required|string|max:255',
            'passport_id' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'nationality_id' => 'required|exists:nationalities,id',
            'blood_type_id' => 'required|exists:blood_types,id',
            'religion_id' => 'required|exists:religions,id',
            'address' => 'required|string',
        ]);

        $father = Father::create($request->all());

        return redirect()->route('fathers.index')->with('success', 'Father added successfully');
    }

    // Show the form for editing the specified father
    public function edit(Father $father)
    {
        $nationalities = Nationality::all();
        $bloodTypes = BloodType::all();
        $religions = Religion::all();
        return view('fathers.create', compact('father', 'nationalities', 'bloodTypes', 'religions'));
    }

    // Update the specified father in the database
    public function update(Request $request, Father $father)
    {
        $request->validate([
            'email' => 'required|string|email|max:255|unique:fathers,email,' . $father->id,
            'password' => 'nullable|string|min:8',
            'name' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'job' => 'required|string|max:255',
            'job_en' => 'required|string|max:255',
            'national_id' => 'required|string|max:255',
            'passport_id' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'nationality_id' => 'required|exists:nationalities,id',
            'blood_type_id' => 'required|exists:blood_types,id',
            'religion_id' => 'required|exists:religions,id',
            'address' => 'required|string',
        ]);

        $father->update($request->all());

        return redirect()->route('fathers.index')->with('success', 'Father added successfully');
    }

    // Remove the specified father from the database
    public function destroy(Father $father)
    {
        $father->delete();
        return response()->json(['success' => true, 'message' => 'Father deleted successfully.']);
    }
}
