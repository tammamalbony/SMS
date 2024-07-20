<?php
namespace App\Http\Controllers;

use App\Models\Document;
use App\Models\Father;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\Wife;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DocumentController extends Controller
{
    public function index($type, $id)
    {
        $class = $this->getClass($type);
        $model = $class::findOrFail($id);
        $documents = $model->documents()->paginate(10);

        return view('documents.index', compact('model', 'documents', 'type'));
    }

    public function store(Request $request, $type, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'file' => 'required|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ]);
    
        $class = $this->getClass($type);
        $model = $class::findOrFail($id);
    
        // Debugging output to check file upload
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            \Log::info('File details:', [
                'originalName' => $file->getClientOriginalName(),
                'size' => $file->getSize(),
                'mimeType' => $file->getMimeType()
            ]);
        } else {
            \Log::error('No file uploaded.');
        }
    
        // Save file to 'public/documents' directory
        $path = $request->file('file')->store('documents', 'public');
    
        \Log::info('File saved to path: ' . $path);
    
        $model->documents()->create([
            'name' => $request->name,
            'file_path' => $path,
        ]);
    
        return response()->json(['success' => true]);
    }
    

    public function destroy($type, $id, $documentId)
    {
        $class = $this->getClass($type);
        $model = $class::findOrFail($id);
        $document = $model->documents()->findOrFail($documentId);

        Storage::delete($document->file_path);
        $document->delete();

        return response()->json(['success' => true]);
    }

    private function getClass($type)
    {
        switch ($type) {
            case 'student':
                return Student::class;
            case 'teacher':
                return Teacher::class;
            case 'father':
                return Father::class;
            case 'wife':
                return Wife::class;
            default:
                throw new \Exception('Invalid type');
        }
    }
}
