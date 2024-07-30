<?php 
namespace App\Http\Controllers;

use App\Models\Disease;
use App\Models\DiseaseType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DiseaseController extends Controller {
    public function index() {
        $diseases = Disease::with('type')->paginate(10);
        $diseaseTypes = DiseaseType::all();
        return view('diseases.index', compact('diseases', 'diseaseTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type_id' => 'required|exists:disease_types,id',
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        Disease::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $disease = Disease::findOrFail($id);
        return response()->json($disease);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type_id' => 'required|exists:disease_types,id',
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $disease = Disease::findOrFail($id);
        $disease->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $disease = Disease::findOrFail($id);
        $disease->delete();

        return response()->json(['success' => true]);
    }
}
