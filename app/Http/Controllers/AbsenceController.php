<?php

namespace App\Http\Controllers;

use App\Models\Absence;
use Illuminate\Http\Request;

class AbsenceController extends Controller
{
    public function index()
    {
        $absences = Absence::paginate(10);
        return view('absences.index', compact('absences'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'limit' => 'required|integer',
        ]);

        Absence::create($request->all());
        return response()->json(['success' => true]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'limit' => 'required|integer',
        ]);

        $absence = Absence::findOrFail($id);
        $absence->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $absence = Absence::findOrFail($id);
        $absence->delete();

        return response()->json(['success' => true]);
    }
}
