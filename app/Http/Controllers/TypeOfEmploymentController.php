<?php

namespace App\Http\Controllers;

use App\Models\TypeOfEmployment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TypeOfEmploymentController extends Controller
{
    public function index() {
        $typesOfEmployment = TypeOfEmployment::paginate(10);
        return view('types_of_employment.index', compact('typesOfEmployment'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        TypeOfEmployment::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $typeOfEmployment = TypeOfEmployment::findOrFail($id);
        return response()->json($typeOfEmployment);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $typeOfEmployment = TypeOfEmployment::findOrFail($id);
        $typeOfEmployment->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $typeOfEmployment = TypeOfEmployment::findOrFail($id);
        $typeOfEmployment->delete();

        return response()->json(['success' => true]);
    }
}
