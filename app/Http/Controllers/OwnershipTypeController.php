<?php

namespace App\Http\Controllers;

use App\Models\OwnershipType;
use Illuminate\Http\Request;

class OwnershipTypeController extends Controller
{
    public function index()
    {
        $ownershipTypes = OwnershipType::paginate(10);
        return view('setting.ownership-types', compact('ownershipTypes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        OwnershipType::create($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $ownershipType = OwnershipType::findOrFail($id);
        return response()->json($ownershipType);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $ownershipType = OwnershipType::findOrFail($id);
        $ownershipType->update($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $ownershipType = OwnershipType::findOrFail($id);
        $ownershipType->delete();

        return response()->json(['success' => true]);
    }
}
