<?php

namespace App\Http\Controllers;

use App\Models\TypeOfAppointment;
use App\Models\TypeOfEmployment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TypeOfAppointmentController extends Controller
{
    public function index() {
        $typesOfAppointments = TypeOfAppointment::with('typeOfEmployment')->paginate(10);
        $typesOfEmployment = TypeOfEmployment::all();
        return view('types_of_employment.types_of_appointments', compact('typesOfAppointments', 'typesOfEmployment'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type_of_employment_id' => 'required|exists:type_of_employments,id',
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        TypeOfAppointment::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $typeOfAppointment = TypeOfAppointment::findOrFail($id);
        return response()->json($typeOfAppointment);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type_of_employment_id' => 'required|exists:type_of_employments,id',
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $typeOfAppointment = TypeOfAppointment::findOrFail($id);
        $typeOfAppointment->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $typeOfAppointment = TypeOfAppointment::findOrFail($id);
        $typeOfAppointment->delete();

        return response()->json(['success' => true]);
    }
}
