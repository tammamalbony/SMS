<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Subject;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $grades = Grade::all();

        $subjects = Subject::with('parent')->paginate(50);
        $parentSubjects = Subject::whereNull('parent_id')->get();
        return view('subjects.index', compact('subjects', 'parentSubjects','grades'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name_ar' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'parent_id' => 'nullable|exists:subjects,id',
            'note' => 'nullable|string',
        ]);

        Subject::create($request->all());

        return response()->json(['success' => true, 'message' => 'Subject created successfully.']);
    }

    public function update(Request $request,$id)
    {
        $subject = Subject::findOrFail($id);

        $request->validate([
            'name_ar' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'parent_id' => 'nullable|exists:subjects,id',
            'note' => 'nullable|string',
        ]);

        $subject->update($request->all());

        return response()->json(['success' => true, 'message' => 'Subject updated successfully.']);
    }
    public function edit(Request $request, $id)
    {
        try {
            $data = Subject::findOrFail($id);
        
            return response()->json([
              'success' => true,
              'data' => $data
            ]);
          } catch (ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => 'Job Sequence not found'], 404);
          }
    }
    public function destroy($id)
    {
        $subject = Subject::findOrFail($id);
        $subject->delete();

        return response()->json(['success' => true, 'message' => 'Subject deleted successfully.']);
    }
}
