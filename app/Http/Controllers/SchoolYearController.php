<?php

namespace App\Http\Controllers;

use App\Models\SchoolYear;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SchoolYearController extends Controller
{
    public function index()
    {
        $schoolYears = SchoolYear::paginate(10);
        return view('school_years.index', compact('schoolYears'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'start_year' => [
                'required',
                'regex:/^\d{2}\/\d{4}$/',
                function ($attribute, $value, $fail) use ($request) {
                    try {
                        $startDate = Carbon::createFromFormat('m/Y', $value);
                    } catch (\Exception $e) {
                        return $fail('The ' . $attribute . ' is not a valid date.');
                    }

                    if (!empty($request->end_month_year)) {
                        try {
                            $endDate = Carbon::createFromFormat('m/Y', $request->end_month_year);
                        } catch (\Exception $e) {
                            return $fail('The end date is not a valid date.');
                        }

                        if ($startDate->greaterThanOrEqualTo($endDate)) {
                            return $fail('The start date must be before the end date.');
                        }
                    }
                }
            ],
            'end_year' => [
                'required',
                'regex:/^\d{2}\/\d{4}$/',
                function ($attribute, $value, $fail) {
                    try {
                        Carbon::createFromFormat('m/Y', $value);
                    } catch (\Exception $e) {
                        return $fail('The ' . $attribute . ' is not a valid date.');
                    }
                }
            ],
            'is_active' => 'required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->first()], 422);
        }

        $data = $validator->validated();

        SchoolYear::create($data);

        return response()->json(['success' => true, 'message' => 'School Year created successfully.']);
    }
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'start_year' => 'required|integer',
            'end_year' => 'required|integer',
            'is_active' => 'required|boolean',
        ]);

        $schoolYear = SchoolYear::findOrFail($id);

        $schoolYear->update($data);

        return response()->json(['success' => true, 'message' => 'School Year updated successfully.']);
    }

    public function destroy($id)
    {
        $schoolYear = SchoolYear::findOrFail($id);
        $schoolYear->delete();

        return response()->json(['success' => true, 'message' => 'School Year deleted successfully.']);
    }
}
