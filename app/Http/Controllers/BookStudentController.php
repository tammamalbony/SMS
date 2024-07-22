<?php 
namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\VerifiedStudent;
use Illuminate\Http\Request;

class BookStudentController extends Controller
{
    public function index($verifiedStudentId)
    {
        // Fetch the verified student
        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $classId = $verifiedStudent->section->classsSchoolYear->classs_id;
        // Fetch books related to the verified student
        $books = $verifiedStudent->books()->paginate(10); // Adjust pagination as needed

        // Fetch books related to the class
        $studentBookIds = $verifiedStudent->books->pluck('id')->toArray();
        $sectionBooks = Book::where('class_id', $classId)->whereNotIn('id', $studentBookIds)->get();
        $booksStatus = $verifiedStudent->booksStatus();
        return view('verified_students.books', compact('books', 'verifiedStudent', 'sectionBooks','booksStatus'));
    }

    public function store(Request $request, $verifiedStudentId)
    {
        $request->validate([
            'book_id' => 'required|exists:books,id',
        ]);

        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $verifiedStudent->books()->attach($request->book_id);

        return response()->json(['success' => true, 'message' => 'Book added successfully.']);
    }

    public function update(Request $request, $verifiedStudentId, $bookId)
    {
        $request->validate([
            'book_id' => 'required|exists:books,id',
        ]);

        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $verifiedStudent->books()->syncWithoutDetaching([$request->book_id]);

        return response()->json(['success' => true, 'message' => 'Book updated successfully.']);
    }

    public function destroy($verifiedStudentId, $bookId)
    {
        $verifiedStudent = VerifiedStudent::findOrFail($verifiedStudentId);
        $verifiedStudent->books()->detach($bookId);

        return response()->json(['success' => true, 'message' => 'Book deleted successfully.']);
    }
}
