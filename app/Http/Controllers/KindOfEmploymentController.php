<?php

namespace App\Http\Controllers;

use App\Models\KindOfEmployment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KindOfEmploymentController extends Controller
{
    public function index() {
        $kindsOfEmployment = KindOfEmployment::paginate(10);
        return view('types_of_employment.kinds_of_employment', compact('kindsOfEmployment'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        KindOfEmployment::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $kindOfEmployment = KindOfEmployment::findOrFail($id);
        return response()->json($kindOfEmployment);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $kindOfEmployment = KindOfEmployment::findOrFail($id);
        $kindOfEmployment->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $kindOfEmployment = KindOfEmployment::findOrFail($id);
        $kindOfEmployment->delete();

        return response()->json(['success' => true]);
    }
}
