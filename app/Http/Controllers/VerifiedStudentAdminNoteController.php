<?php

namespace App\Http\Controllers;

use App\Models\VerifiedStudent;
use App\Models\VerifiedStudentAdminNote;
use Illuminate\Http\Request;

class VerifiedStudentAdminNoteController extends Controller
{
    public function index($verifiedStudentId)
    {
        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $notes = $verifiedStudent->adminNotes()->paginate(10);

        return view('verified_student_admin_notes.index', compact('verifiedStudent', 'notes'));
    }

    public function store(Request $request, $verifiedStudentId)
    {
        $request->validate([
            'note' => 'required|string|max:1000',
        ]);

        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $verifiedStudent->adminNotes()->create($request->all());

        return response()->json(['success' => true]);
    }

    public function update(Request $request, $verifiedStudentId, $noteId)
    {
        $request->validate([
            'note' => 'required|string|max:1000',
        ]);

        $note = VerifiedStudentAdminNote::findOrFail($noteId);
        $note->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($verifiedStudentId, $noteId)
    {
        $note = VerifiedStudentAdminNote::findOrFail($noteId);
        $note->delete();

        return response()->json(['success' => true]);
    }
}
