<?php

namespace App\Http\Controllers;

use App\Models\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class SettingsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $school  = School::orderBy('id', 'DESC')->first();
        return view('setting.create',compact('school'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $school  = School::orderBy('id', 'DESC')->first();
        return view('setting.create',compact('school'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'statistical_number' => 'required|integer',
            'school_name' => 'required|string|max:255',
            'type_of_education' => 'required|integer',
            'typeB' => 'required|boolean',
            'kindergarten' => 'required|boolean',
            'education_p' => 'required|boolean',
            'education_p1' => 'required|boolean',
            'education_s' => 'required|boolean',
            'school_state' => 'required|string|max:255',
            'school_city' => 'required|string|max:255',
            'school_region' => 'required|string|max:255',
            'school_village' => 'nullable|string|max:255',
            'school_Neigh' => 'nullable|string|max:255',
            'Admin_division' => 'required|integer',
            'School_gender' => 'required|integer',
            'School_build' => 'required|boolean',
            'School_access' => 'required|integer',
            'Shared_construction' => 'required|boolean',
            'School_type' => 'required|integer',
            'type_of_attend' => 'required|integer',
            'build_m' => 'required|integer',
            'build_t' => 'required|integer',
            'build_class' => 'nullable|integer',
            'build_area' => 'nullable|integer',
            'count_floor' => 'nullable|integer',
            'count_build' => 'nullable|integer',
            'petrol_count' => 'nullable|integer',
            'petrol_cap' => 'nullable|integer',
            'internet_coount' => 'nullable|integer',
            'internet_type' => 'nullable|string|max:255',
            'electric_type' => 'required|integer',
            'telephone' => 'required|max:255',
            'manager_name' => 'required|max:255',
            'mobile' => 'required|max:255',
        ]);
        School::updateOrCreate($data);

        $school = School::orderBy('id', 'DESC')->first();
        // dd(  $school);
        return view('setting.create',compact('school'));
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $school  = School::findOrFail($id);
        return view('setting.create',compact('school'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $school  = School::findOrFail($id);
        return view('setting.create',compact('school'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        
        $data = $request->validate([
            'statistical_number' => 'required|integer',
            'school_name' => 'required|string|max:255',
            'type_of_education' => 'required|integer',
            'typeB' => 'required|boolean',
            'kindergarten' => 'required|boolean',
            'education_p' => 'required|boolean',
            'education_p1' => 'required|boolean',
            'education_s' => 'required|boolean',
            'school_state' => 'required|string|max:255',
            'school_city' => 'required|string|max:255',
            'school_region' => 'required|string|max:255',
            'school_village' => 'nullable|string|max:255',
            'school_Neigh' => 'nullable|string|max:255',
            'Admin_division' => 'required|integer',
            'School_gender' => 'required|integer',
            'School_build' => 'required|boolean',
            'School_access' => 'required|integer',
            'Shared_construction' => 'required|boolean',
            'School_type' => 'required|integer',
            'type_of_attend' => 'required|integer',
            'build_m' => 'required|integer',
            'build_t' => 'required|integer',
            'build_class' => 'nullable|integer',
            'build_area' => 'nullable|integer',
            'count_floor' => 'nullable|integer',
            'count_build' => 'nullable|integer',
            'petrol_count' => 'nullable|integer',
            'petrol_cap' => 'nullable|integer',
            'internet_coount' => 'nullable|integer',
            'internet_type' => 'nullable|string|max:255',
            'electric_type' => 'required|integer',
            'telephone' => 'required|max:255',
            'manager_name' => 'required|max:255',
            'mobile' => 'required|max:255',
        ]);
        $school = School::findOrFail($id);
        $school->update($data);
        $school  = School::orderBy('id', 'DESC')->first();

        return redirect()->route('settings.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return back()->withErrors(['Delete', 'Not Allowed!'])->withInput();
    }
}
