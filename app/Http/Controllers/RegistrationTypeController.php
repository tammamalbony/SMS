<?php

namespace App\Http\Controllers;

use App\Models\RegistrationType;
use Illuminate\Http\Request;

class RegistrationTypeController extends Controller
{
    public function index()
    {
        $registrationTypes = RegistrationType::paginate(10);
        return view('registration_types.index', compact('registrationTypes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        RegistrationType::create($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $registrationType = RegistrationType::findOrFail($id);
        return response()->json($registrationType);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $registrationType = RegistrationType::findOrFail($id);
        $registrationType->update($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $registrationType = RegistrationType::findOrFail($id);
        $registrationType->delete();

        return response()->json(['success' => true]);
    }
}
