<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\SvgId;

class SvgController extends Controller
{
    // Method to show the list of SVG files   // Method to show the list of SVG files
    public function index()
    {
        // Get all SVG files in the public directory
        $files = Storage::disk('public')->files('store/grade');
        // Filter to include only .svg files
        $svgFiles = array_filter($files, function ($file) {
            return pathinfo($file, PATHINFO_EXTENSION) === 'svg';
        });

        // Extract filenames
        $svgFileNames = array_map(function ($file) {
            return basename($file);
        }, $svgFiles);

        return view('svg.index', ['files' => $svgFileNames]);
    }

    // Method to show the upload form
    public function showUploadForm()
    {
        return view('svg.upload');
    }

    public function uploadSvg(Request $request)
    {
        $request->validate([
            'svgFile' => 'required|mimes:svg|max:2048',
            'fileName' => 'nullable|string|max:255'
        ]);

        if ($request->file('svgFile')->isValid()) {
            $file = $request->file('svgFile');
            $filename = $request->input('fileName') ?: $file->getClientOriginalName();
            $path = $file->storeAs('store/grade', $filename, 'public');
            return response()->json(['success' => true, 'path' => $path]);
        }

        return response()->json(['success' => false], 500);
    }

    // Method to get SVG IDs from a selected file
    public function getSvgIds($filename)
    {
        // Path to the SVG file in the public directory
        $filePath = storage_path('app/public/store/grade/' . $filename);

        // Check if the file exists
        if (!file_exists($filePath)) {
            return redirect()->route('svg.index')->with('error', 'File not found');
        }

        // Load the SVG file
        $svgContent = file_get_contents($filePath);

        // Parse the SVG file using SimpleXML
        $svg = simplexml_load_string($svgContent);

        // Register namespaces
        $namespaces = $svg->getNamespaces(true);

        // Extract IDs
        $ids = [];
        $this->extractIds($svg, $ids, $namespaces);

        // Encode SVG content for safe rendering in HTML
        // $encodedSvgContent = htmlspecialchars($svgContent);

        // Return the view with SVG content and IDs
        return view('svg.ids', [
            'filename' => $filename,
            'svgIds' => $ids,
            'svgContent' => $svgContent
        ]);
    }

    // Recursive method to extract IDs from SVG elements
    private function extractIds($element, &$ids, $namespaces)
    {
        // Check if the element has an ID attribute
        if (isset($element['id'])) {
            $ids[] = (string) $element['id'];
        }

        foreach ($element->children() as $child) {
            $this->extractIds($child, $ids, $namespaces);
        }

        // Recursively check child elements
        foreach ($namespaces as $prefix => $namespace) {
            foreach ($element->children($namespace) as $child) {
                $this->extractIds($child, $ids, $namespaces);
            }
        }
    }

    // Method to store the selected SVG ID with associated fields
    public function storeSvgId(Request $request)
    {
        // Validate the request
        $request->validate([
            'exam_id' => 'required|integer',
            'classs_school_years_id' => 'required|integer',
            'subject_detail_id' => 'required|integer',
            'svg_id' => 'required|string',
            'name' => 'nullable|string|max:255',
            'note' => 'nullable|string',
            'max_width' => 'nullable|integer',
            'max_height' => 'nullable|integer',
            'font_size' => 'nullable|string|max:255',
            'fill_color' => 'nullable|string|max:255',
            'anchortext' => 'nullable|string|max:255',
            'transform' => 'nullable|string|max:255',
        ]);

        // Create a new SvgId record
        SvgId::create([
            'exam_id' => $request->exam_id,
            'classs_school_years_id' => $request->classs_school_years_id,
            'subject_detail_id' => $request->subject_detail_id,
            'svg_id' => $request->svg_id,
            'name' => $request->name,
            'note' => $request->note,
            'max_width' => $request->max_width,
            'max_height' => $request->max_height,
            'font_size' => $request->font_size,
            'fill_color' => $request->fill_color,
            'anchortext' => $request->anchortext,
            'transform' => $request->transform,
        ]);

        return redirect()->route('svg.index')->with('success', 'SVG ID stored successfully!');
    }

    public function delete($filename)
    {
        if (Storage::disk('public')->exists('store/grade/' . $filename)) {
            Storage::disk('public')->delete('store/grade/' . $filename);
            return redirect()->route('svg.index')->with('success', 'SVG file deleted successfully.');
        } else {
            return redirect()->route('svg.index')->with('error', 'SVG file not found.');
        }
    }
}
