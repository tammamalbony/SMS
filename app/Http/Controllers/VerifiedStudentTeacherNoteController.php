<?php

namespace App\Http\Controllers;

use App\Models\VerifiedStudent;
use App\Models\VerifiedStudentTeacherNote;
use Illuminate\Http\Request;

class VerifiedStudentTeacherNoteController extends Controller
{
    public function index($verifiedStudentId)
    {
        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $notes = $verifiedStudent->teacherNotes()->paginate(10);

        return view('verified_student_teacher_notes.index', compact('verifiedStudent', 'notes'));
    }

    public function store(Request $request, $verifiedStudentId)
    {
        $request->validate([
            'note' => 'required|string|max:1000',
        ]);

        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $verifiedStudent->teacherNotes()->create($request->all());

        return response()->json(['success' => true]);
    }

    public function update(Request $request, $verifiedStudentId, $noteId)
    {
        $request->validate([
            'note' => 'required|string|max:1000',
        ]);

        $note = VerifiedStudentTeacherNote::findOrFail($noteId);
        $note->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($verifiedStudentId, $noteId)
    {
        $note = VerifiedStudentTeacherNote::findOrFail($noteId);
        $note->delete();

        return response()->json(['success' => true]);
    }
}
