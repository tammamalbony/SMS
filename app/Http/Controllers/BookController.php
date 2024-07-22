<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Classs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BookController extends Controller
{
    public function index($classId)
    {
        // Fetch the class
        $class = Classs::findOrFail($classId);

        // Fetch books related to the class
        $books = Book::where('class_id', $classId)->paginate(20);

        return view('books.index', compact('books', 'class'));
    }

    public function store(Request $request, $classId)
    {

        // Validate the request
        $request->validate([
            'title' => 'required|string|max:255',
            'url1' => 'nullable|url|max:2048',
            'url2' => 'nullable|url|max:2048',
            'url3' => 'nullable|file|mimes:pdf,doc,docx,jpg,png|max:2048',
        ]);

        // Handle file upload for url3
        if ($request->hasFile('url3')) {
            // Handle file upload for url3
            $url3 = $request->file('url3')->store('public/books');
    
            // Debugging statement
            if ($url3) {
                \Log::info('File uploaded successfully: ' . $url3);
            } else {
                \Log::error('File upload failed.');
            }
        } else {
            \Log::info('No file uploaded.');
            $url3 = null;
        }

        // Create the book
        $book = Book::create([
            'title' => $request->input('title'),
            'class_id' => $classId,
            'url1' => $request->input('url1'),
            'url2' => $request->input('url2'),
            'url3' => $url3 ? str_replace('public/', '', $url3) : null,
        ]);
        \Log::info('Book created: ' . $book->id);
        return response()->json(['success' => true, 'message' => 'Book created successfully!']);
    }

    public function update(Request $request, $classId, $bookId)
    {
        // Validate the request
        $request->validate([
            'title' => 'required|string|max:255',
            'url1' => 'nullable|url|max:2048',
            'url2' => 'nullable|url|max:2048',
            'url3' => 'nullable|file|mimes:pdf,doc,docx,jpg,png|max:2048',
        ]);

        // Find the book
        $book = Book::where('class_id', $classId)->findOrFail($bookId);

        // Handle file upload for url3
        if ($request->file('url3')) {
            // Delete the old file if a new one is uploaded
            if ($book->url3) {
                Storage::delete($book->url3);
            }
            $url3 = $request->file('url3')->store('books');
        } else {
            $url3 = $book->url3;
        }

        // Update the book
        $book->update([
            'title' => $request->input('title'),
            'url1' => $request->input('url1'),
            'url2' => $request->input('url2'),
            'url3' => $url3,
        ]);

        return response()->json(['success' => true, 'message' => 'Book updated successfully!']);
    }

    public function destroy($classId, $bookId)
    {
        // Find the book
        $book = Book::where('class_id', $classId)->findOrFail($bookId);

        // Delete the associated file
        if ($book->url3) {
            Storage::delete($book->url3);
        }

        // Delete the book
        $book->delete();

        return response()->json(['success' => true, 'message' => 'Book deleted successfully!']);
    }
}
