<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Subject;
use App\Models\SubjectDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SubjectDetailController extends Controller
{
    public function index()
    {
        $subjects = Subject::all();
        $grades = Grade::all();
        $subjectDetails = SubjectDetail::paginate(50);
        return view('subject_details.index', compact('subjectDetails','subjects','grades'));
    }

    public function create()
    {
        $subjects = Subject::all();
        $grades = Grade::all();
        return view('subject_details.create', compact('subjects', 'grades'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_id' => 'required|exists:subjects,id',
            'max_grade' => 'required|integer',
            'failing_grade' => 'required|integer',
            'is_failing' => 'required|boolean',
            'is_active' => 'required|boolean',
            'grade_id' => 'required|exists:grades,id',
        ]);

        $validator->after(function ($validator) use ($request) {
            if ($request->max_grade < $request->failing_grade) {
                $validator->errors()->add('max_grade', 'eThe max grade must be greater than or equal to the failing grad.');
            }
        });

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        SubjectDetail::create($request->all());

        return response()->json(['success' => true, 'message' => 'Subject Detail created successfully.']);
    }

    public function update(Request $request, $id)
    {
        $subjectDetail = SubjectDetail::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'subject_id' => 'required|exists:subjects,id',
            'max_grade' => 'required|integer',
            'failing_grade' => 'required|integer',
            'is_failing' => 'required|boolean',
            'is_active' => 'required|boolean',
            'grade_id' => 'required|exists:grades,id',
        ]);

        $validator->after(function ($validator) use ($request) {
            if ($request->max_grade < $request->failing_grade) {
                $validator->errors()->add('max_grade', 'The max grade must be greater than or equal to the failing grade.');
            }
        });

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $subjectDetail->update($request->all());

        return response()->json(['success' => true, 'message' => 'Subject Detail Updated successfully.']);

    }
    public function edit($id)
    {
        $subjectDetail = SubjectDetail::findOrFail($id);
        $subjects = Subject::all();
        $grades = Grade::all();
        $data =[
            'subjectDetail'=> $subjectDetail,
            'grades'=>$grades,
            'subjects'=>$subjects
        ];
        return response()->json(['success' => true, 'data' => $data]);
    }
    public function show($id)
    {
        $subjectDetail = SubjectDetail::with(['subject', 'grade'])->findOrFail($id);
        return view('subject_details.show', compact('subjectDetail'));
    }
    public function destroy($id)
    {
        $subjectDetail = SubjectDetail::findOrFail($id);

        $subjectDetail->delete();
        return response()->json(['success' => true, 'message' => 'Subject Detail deleted successfully.']);
    }
}
