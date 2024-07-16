<?php

namespace App\Http\Controllers;

use App\Models\Wife;
use App\Models\Father;
use App\Models\Nationality;
use App\Models\BloodType;
use App\Models\Religion;
use Illuminate\Http\Request;

class WifeController extends Controller
{
    // Display a listing of the wives
    public function index(Father $father)
    {
        $wives = $father->wives;
        return view('fathers.wives.index', compact('wives', 'father'));
    }

    // Show the form for creating a new wife
    public function create(Father $father)
    {
        $nationalities = Nationality::all();
        $bloodTypes = BloodType::all();
        $religions = Religion::all();
        return view('fathers.wives.create', compact('father', 'nationalities', 'bloodTypes', 'religions'));
    }

    // Store a newly created wife in the database
    public function store(Request $request, Father $father)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'job' => 'required|string|max:255',
            'job_en' => 'required|string|max:255',
            'national_id' => 'required|string|max:255',
            'passport_id' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'nationality_id' => 'required|exists:nationalities,id',
            'blood_type_id' => 'required|exists:blood_types,id',
            'religion_id' => 'required|exists:religions,id',
        ]);

        $wife = new Wife($request->all());
        $wife->father_id = $father->id;
        $wife->save();

        return redirect()->route('fathers.wives.index', $father->id)->with('success', 'Wife added successfully');
    }

    // Show the form for editing the specified wife
    public function edit(Father $father, Wife $wife)
    {
        $nationalities = Nationality::all();
        $bloodTypes = BloodType::all();
        $religions = Religion::all();
        return view('fathers.wives.create', compact('father', 'wife', 'nationalities', 'bloodTypes', 'religions'));
    }

    // Update the specified wife in the database
    public function update(Request $request, Father $father, Wife $wife)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'job' => 'required|string|max:255',
            'job_en' => 'required|string|max:255',
            'national_id' => 'required|string|max:255',
            'passport_id' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'nationality_id' => 'required|exists:nationalities,id',
            'blood_type_id' => 'required|exists:blood_types,id',
            'religion_id' => 'required|exists:religions,id',
        ]);

        $wife->update($request->all());

        return redirect()->route('fathers.wives.index', $father->id)->with('success', 'Wife updated successfully');
    }

    // Remove the specified wife from the database
    public function destroy(Father $father, Wife $wife)
    {
        $wife->delete();
        return redirect()->route('fathers.wives.index', $father->id)->with('success', 'Wife deleted successfully');
    }
}
