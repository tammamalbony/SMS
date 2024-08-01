<?php

namespace App\Http\Controllers;

use App\Models\SchoolRoomType;
use Illuminate\Http\Request;

class SchoolRoomTypeController extends Controller
{
    public function index()
    {
        $schoolRoomTypes = SchoolRoomType::paginate(10);
        return view('setting.school-room-types', compact('schoolRoomTypes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        SchoolRoomType::create($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $schoolRoomType = SchoolRoomType::findOrFail($id);
        return response()->json($schoolRoomType);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $schoolRoomType = SchoolRoomType::findOrFail($id);
        $schoolRoomType->update($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $schoolRoomType = SchoolRoomType::findOrFail($id);
        $schoolRoomType->delete();

        return response()->json(['success' => true]);
    }
}
