<?php

namespace App\Http\Controllers;

use App\Models\TypeOfPermanence;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TypeOfPermanenceController extends Controller
{
    public function index() {
        $typesOfPermanence = TypeOfPermanence::paginate(10);
        return view('setting.types_of_permanence', compact('typesOfPermanence'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        TypeOfPermanence::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $typeOfPermanence = TypeOfPermanence::findOrFail($id);
        return response()->json($typeOfPermanence);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $typeOfPermanence = TypeOfPermanence::findOrFail($id);
        $typeOfPermanence->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $typeOfPermanence = TypeOfPermanence::findOrFail($id);
        $typeOfPermanence->delete();

        return response()->json(['success' => true]);
    }
}
