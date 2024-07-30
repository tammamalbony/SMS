<?php

namespace App\Http\Controllers;

use App\Models\Governate;
use App\Models\Institution;
use Illuminate\Http\Request;

class InstitutionController extends Controller
{
    public function index()
    {
        $institutions = Institution::with('governate.country')->paginate(10);
        return view('institutions.index', compact('institutions'));
    }

    public function create()
    {
        $governates = Governate::with('country')->get();
        return view('institutions.create', compact('governates'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'mobile' => 'required|string|max:20',
            'telephone' => 'nullable|string|max:20',
            'note' => 'nullable|string',
            'governate_id' => 'required|exists:governates,id',
        ]);

        Institution::create($request->all());

        return response()->json(['success' => true, 'message' => 'تم إنشاء المدرسة بنجاح']);
    }

    public function edit(Institution $institution)
    {
        $institution->governate->get();
        // $data= ['institution'=>$institution,'governate' =>$governate];
        return response()->json($institution);
    }

    public function update(Request $request, Institution $institution)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'mobile' => 'required|string|max:20',
            'telephone' => 'nullable|string|max:20',
            'note' => 'nullable|string',
            'governate_id' => 'required|exists:governates,id',
        ]);

        $institution->update($request->all());

        return response()->json(['success' => true, 'message' => 'تم تعديل المدرسة بنجاح']);
    }

    public function destroy(Institution $institution)
    {
        $institution->delete();
        return response()->json(['success' => true, 'message' => 'تم حذف المدرسة بنجتح']);
    }
}
