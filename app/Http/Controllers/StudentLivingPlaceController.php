<?php

namespace App\Http\Controllers;

use App\Models\StudentLivingPlace;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StudentLivingPlaceController extends Controller
{
    public function index()
    {
        $livingPlaces = StudentLivingPlace::paginate(10);
        return view('student.student_living_places', compact('livingPlaces'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'note' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $livingPlace = new StudentLivingPlace();
        $livingPlace->name = $request->name;
        $livingPlace->note = $request->note;
        $livingPlace->save();

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $livingPlace = StudentLivingPlace::find($id);
        return response()->json($livingPlace);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'note' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $livingPlace = StudentLivingPlace::find($id);
        $livingPlace->name = $request->name;
        $livingPlace->note = $request->note;
        $livingPlace->save();

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $livingPlace = StudentLivingPlace::find($id);
        $livingPlace->delete();

        return response()->json(['success' => true]);
    }
}
