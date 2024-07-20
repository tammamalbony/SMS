<?php

namespace App\Http\Controllers;

use App\Models\LeaveType;
use Illuminate\Http\Request;

class LeaveTypeController extends Controller
{
    public function index()
    {
        $leaveTypes = LeaveType::paginate(10);
        return view('leave_types.index', compact('leaveTypes'));
    }
    public function edit($id)
    {
        $leaveType = LeaveType::findOrFail($id);
        return response()->json($leaveType);
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        LeaveType::create($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $leaveType = LeaveType::findOrFail($id);
        $leaveType->update($request->only('name'));

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $leaveType = LeaveType::findOrFail($id);
        $leaveType->delete();

        return response()->json(['success' => true]);
    }
}
