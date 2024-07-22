<?php

namespace App\Http\Controllers;

use App\Models\CollaborationAndActivity;
use App\Models\VerifiedStudent;
use Illuminate\Http\Request;

class CollaborationAndActivityController extends Controller
{
    public function index($verifiedStudentId)
    {
        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $activities = CollaborationAndActivity::where('verified_student_id', $verifiedStudentId)->paginate(10);

        return view('collaboration_activity.index', compact('verifiedStudent', 'activities'));
    }

    public function store(Request $request, $verifiedStudentId)
    {
        $request->validate([
            'value' => 'required|numeric',
            'note' => 'nullable|string',
        ]);

        CollaborationAndActivity::create([
            'verified_student_id' => $verifiedStudentId,
            'value' => $request->input('value'),
            'note' => $request->input('note'),
        ]);

        return response()->json(['success' => true, 'message' => 'Activity added successfully']);
    }

    public function update(Request $request, $verifiedStudentId, $id)
    {
        $request->validate([
            'value' => 'required|numeric',
            'note' => 'nullable|string',
        ]);

        $activity = CollaborationAndActivity::findOrFail($id);
        $activity->update([
            'value' => $request->input('value'),
            'note' => $request->input('note'),
        ]);

        return response()->json(['success' => true, 'message' => 'Activity updated successfully']);
    }

    public function destroy($verifiedStudentId, $id)
    {
        $activity = CollaborationAndActivity::findOrFail($id);
        $activity->delete();

        return response()->json(['success' => true, 'message' => 'Activity deleted successfully']);
    }
}
