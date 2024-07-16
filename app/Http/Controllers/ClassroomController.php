<?php

namespace App\Http\Controllers;

use App\Models\Classs;
use App\Models\Grade;
use Illuminate\Http\Request;

class ClassroomController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $classes = Classs::with('grade')->paginate(10);
        $grades = Grade::all();
        return view('classes.index', compact('classes', 'grades'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
       
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request);
        $data = $request->validate([
            'grade_id' => 'required|exists:grades,id',
            'class_name_ar' => 'required|string|max:255',
            'class_name_en' => 'required|string|max:255',
        ]);

        Classs::create($data);

        return response()->json(['success' => true, 'message' => 'Class created successfully.']);
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
    public function update(Request $request, string $id)
    {
        $class = Classs::findOrFail($id);
        $data = $request->validate([
            'grade_id' => 'required|exists:grades,id',
            'class_name_ar' => 'required|string|max:255',
            'class_name_en' => 'required|string|max:255',
        ]);

        $class->update($data);

        return response()->json(['success' => true, 'message' => 'Class updated successfully.']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $class = Classs::findOrFail($id);
        $class->delete();
        return response()->json(['success' => true, 'message' => 'Class deleted successfully.']);
    }
}
