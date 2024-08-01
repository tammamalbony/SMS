<?php

namespace App\Http\Controllers;

use App\Models\EmployeeType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EmployeeTypeController extends Controller
{
    public function index() {
        $employeeTypes = EmployeeType::paginate(10);
        return view('employee_types.index', compact('employeeTypes'));
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        EmployeeType::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id) {
        $employeeType = EmployeeType::findOrFail($id);
        return response()->json($employeeType);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }

        $employeeType = EmployeeType::findOrFail($id);
        $employeeType->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id) {
        $employeeType = EmployeeType::findOrFail($id);
        $employeeType->delete();

        return response()->json(['success' => true]);
    }
}
