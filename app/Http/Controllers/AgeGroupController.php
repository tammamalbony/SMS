<?php

namespace App\Http\Controllers;

use App\Models\AgeGroup;
use App\Models\Classs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AgeGroupController extends Controller
{
    public function index(Request $request) {
        $classs_id = $request->query('classs_id');
        $ageGroups = AgeGroup::with('classs');

        if ($classs_id) {
            $ageGroups = $ageGroups->where('classs_id', $classs_id);
        }

        $ageGroups = $ageGroups->paginate(10);
        $classes = $classs_id ? Classs::Where('id', $classs_id)->get() : Classs::all();
        return view('classes.age_groups', compact('ageGroups', 'classes', 'classs_id'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'min_age' => 'required|integer',
            'max_age' => 'required|integer',
            'classs_id' => 'required|exists:classses,id',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        AgeGroup::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $ageGroup = AgeGroup::findOrFail($id);
        return response()->json($ageGroup);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'min_age' => 'required|integer',
            'max_age' => 'required|integer',
            'classs_id' => 'required|exists:classses,id',
            'note' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $ageGroup = AgeGroup::findOrFail($id);
        $ageGroup->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $ageGroup = AgeGroup::findOrFail($id);
        $ageGroup->delete();

        return response()->json(['success' => true]);
    }
}
