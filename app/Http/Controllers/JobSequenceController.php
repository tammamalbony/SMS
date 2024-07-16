<?php

namespace App\Http\Controllers;

use App\Models\JobSequence;
use App\Models\Teacher;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class JobSequenceController extends Controller
{
    public function index($id)
    {
        // dd($id);
        $jobSequences = JobSequence::where('teacher_id',$id)->paginate(10);
        $teachers = Teacher::all();
        return view('job_sequences.index', compact('jobSequences', 'teachers','id'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'teacher_id' => 'required|exists:teachers,id',
            'school_name' => 'required|string|max:255',
            'job_title' => 'required|string|max:255',
            'year' => 'required|date',
        ]);

        JobSequence::create($request->all());

        return response()->json(['success' => true, 'message' => 'Job Sequence created successfully.']);
    }

    public function edit(Request $request, $id)
    {
        try {
            $data = JobSequence::findOrFail($id);
            $teachers = Teacher::all(); 
        
            return response()->json([
              'success' => true,
              'job_sequence' => $data,
              'teachers' => $teachers->map(function ($teacher) {
                return [
                  'id' => $teacher->id,
                  'name_ar' => $teacher->name_ar,
                ];
              })->toArray(),
            ]);
          } catch (ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => 'Job Sequence not found'], 404);
          }
    }

    public function update(Request $request, $id)
    {
        $jobSequence = JobSequence::findOrFail($id);
        $request->validate([
            'teacher_id' => 'required|exists:teachers,id',
            'school_name' => 'required|string|max:255',
            'job_title' => 'required|string|max:255',
            'year' => 'required|date',
        ]);

        $jobSequence->update($request->all());

        return response()->json(['success' => true, 'message' => 'Job Sequence updated successfully.']);
    }

    public function destroy($id)
    {
        $jobSequence = JobSequence::findOrFail($id);
        $jobSequence->delete();

        return response()->json(['success' => true, 'message' => 'Job Sequence deleted successfully.']);
    }
}
