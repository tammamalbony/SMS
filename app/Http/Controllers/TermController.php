<?php

namespace App\Http\Controllers;

use App\Models\Term;
use Illuminate\Http\Request;

class TermController extends Controller
{
    public function index()
    {
        $terms = Term::paginate(10);
        return view('terms.index', compact('terms'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        Term::create($request->all());
        return response()->json(['success' => true]);
    }
    public function edit($id ) {
        
        $term = Term::findOrFail($id);
        return response()->json($term);
    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $term = Term::findOrFail($id);
        $term->update($request->all());
        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $term = Term::findOrFail($id);
        $term->delete();
        return response()->json(['success' => true]);
    }
}
