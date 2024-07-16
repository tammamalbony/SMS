<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use Illuminate\Http\Request;

class GradeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $grades = Grade::paginate(10); 
        return view('grades.index', compact('grades'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'grade_name_ar' => 'required|string|max:255',
            'grade_name_en' => 'required|string|max:255',
            'grade_notes' => 'nullable|string',
        ]);

        Grade::create($data);

        return response()->json(['success' => true, 'message' => 'Grade created successfully.']);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,  $id)
    {
        $grade = Grade::findOrFail($id);


        $data = $request->validate([
            'grade_name_ar' => 'required|string|max:255',
            'grade_name_en' => 'required|string|max:255',
            'grade_notes' => 'nullable|string',
        ]);

        $grade->update($data);

        return response()->json(['success' => true, 'message' => 'Grade updated successfully.']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $grade = Grade::findOrFail($id);
        $grade->delete();
        return response()->json(['success' => true, 'message' => 'Grade deleted successfully.']);
    }
}
