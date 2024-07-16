<?php

namespace App\Http\Controllers;

use App\Models\Teacher;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TeacherController extends Controller
{
    public function index()
    {
        $teachers = Teacher::paginate(10);
        return view('teachers.index', compact('teachers'));
    }

    public function create()
    {
        return view('teachers.create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:teachers',
            'password' => 'required|min:6',
            'name_ar' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'mother' => 'required|string|max:255',
            'specialization_id' => 'required|integer',
            'gender_id' => 'required|integer',
            'marital_status' => 'required|integer',
            'birthdate' => 'required|date',
            'address_birth' => 'required|string|max:255',
            'add_num' => 'required|string|max:255|unique:teachers',
            'tel' => 'required|string|max:15',
            'mobile' => 'required|string|max:15',
            'gern' => 'required|string|max:255',
            'religion' => 'required|string|max:255',
            'work_type' => 'required|string|max:255',
            'joining_date' => 'required|date',
            'address' => 'required|string',
            'address_fixed' => 'required|string|max:255',
            'state' => 'required|string|max:255',
            'certificates' => 'required|string|max:255',
            'highest_cert' => 'required|string|max:255',
            'date_obtained' => 'required|date',
            'salary' => 'required|numeric',
            'type_job' => 'required|string|max:255',
            'type_dis' => 'required|string|max:255',
            'type_of_job' => 'required|integer',
            'cityI' => 'required|string|max:255',
            'date_admin_work' => 'required|date',
            'belongs_him' => 'required|string|max:255',
            'subjet' => 'required|string|max:255',
            'quorum_hours' => 'required|integer',
            'e_quorum_hours' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $data = $request->all();
        $data['password'] = Hash::make($request->password);

        Teacher::create($data);

        return redirect()->route('teachers.index')->with('success', 'Teacher created successfully.');
    }

    public function show($id)
    {
        $teacher = Teacher::findOrFail($id);
        return view('teachers.show', compact('teacher'));
    }

    public function edit($id)
    {
        $teacher = Teacher::findOrFail($id);
        return view('teachers.create', compact('teacher'));
    }

    public function update(Request $request, $id)
    {
        $teacher = Teacher::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|min:6',
            'name_ar' => 'required|string|max:255',
            'name_en' => 'required|string|max:255',
            'mother' => 'required|string|max:255',
            'specialization_id' => 'required|integer',
            'gender_id' => 'required|integer',
            'marital_status' => 'required|integer',
            'birthdate' => 'required|date',
            'address_birth' => 'required|string|max:255',
            'add_num' => 'required|string|max:255',
            'tel' => 'required|string|max:15',
            'mobile' => 'required|string|max:15',
            'gern' => 'required|string|max:255',
            'religion' => 'required|string|max:255',
            'work_type' => 'required|string|max:255',
            'joining_date' => 'required|date',
            'address' => 'required|string',
            'address_fixed' => 'required|string|max:255',
            'state' => 'required|string|max:255',
            'certificates' => 'required|string|max:255',
            'highest_cert' => 'required|string|max:255',
            'date_obtained' => 'required|date',
            'salary' => 'required|numeric',
            'type_job' => 'required|string|max:255',
            'type_dis' => 'required|string|max:255',
            'type_of_job' => 'required|integer',
            'cityI' => 'required|string|max:255',
            'date_admin_work' => 'required|date',
            'belongs_him' => 'required|string|max:255',
            'subjet' => 'required|string|max:255',
            'quorum_hours' => 'required|integer',
            'e_quorum_hours' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $data = $request->all();
        if ($request->filled('password')) {
            $data['password'] = Hash::make($request->password);
        } else {
            unset($data['password']);
        }

        $teacher->update($data);

        return redirect()->route('teachers.index')->with('success', 'Teacher updated successfully.');
    }

    public function destroy($id)
    {
        $teacher = Teacher::findOrFail($id);
        $teacher->delete();
        return response()->json(['success' => true, 'message' => 'Teacher deleted successfully.']);
    }
}
