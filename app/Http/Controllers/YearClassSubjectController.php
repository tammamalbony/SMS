<?php

namespace App\Http\Controllers;

use App\Models\YearClassSubject;
use App\Models\ClasssSchoolYear;
use App\Models\SubjectDetail;
use Illuminate\Http\Request;

class YearClassSubjectController extends Controller
{
    public function index(ClasssSchoolYear $classsSchoolYear)
    {
        $subjectDetails = SubjectDetail::all();
        $yearClassSubjects = YearClassSubject::with(['subjectDetail'])
            ->where('c_s_y_id', $classsSchoolYear->id)
            ->orderBy('order')
            ->get();

        return view('year_class_subject.index', compact('yearClassSubjects', 'classsSchoolYear', 'subjectDetails'));
    }

    public function create(ClasssSchoolYear $classsSchoolYear)
    {
        $subjectDetails = SubjectDetail::all();
        return view('year_class_subject.create', compact('classsSchoolYear', 'subjectDetails'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'classses_school_year_id' => 'required|exists:classses_school_years,id',
            'subject_detail_id' => 'required|exists:subject_details,id',
            'order' => 'nullable|integer',
        ]);

        $data = $request->all();
        $result['c_s_y_id'] = $data['classses_school_year_id'];
        $result['subject_detail_id'] = $data['subject_detail_id'];
        $result['subject_detail_id'] = $data['subject_detail_id'];
        $result['is_falling'] = $data['is_falling'];
        $yearClassSubject = YearClassSubject::create($result);

        return response()->json(['success' => 'تم إنشاء الربط بنجاح.']);
    }

    public function edit(ClasssSchoolYear $classsSchoolYear, YearClassSubject $yearClassSubject)
    {
        $data = $yearClassSubject;
        return response()->json($data);
    }
    public function update(Request $request, ClasssSchoolYear $classsSchoolYear, YearClassSubject $yearClassSubject)
    {
        $request->validate([
            'classses_school_year_id' => 'required|exists:classses_school_years,id',
            'subject_detail_id' => 'required|exists:subject_details,id',
        ]);

        $data = $request->all();
        $data['c_s_y_id'] = $data['classses_school_year_id'];
        $yearClassSubject->update($data);

        return redirect()->route('year_class_subject.index', ['classsSchoolYear' => $classsSchoolYear->id])
            ->with('success', 'تم تحديث YearClassSubject بنجاح.');
    }
    public function updateOrder(Request $request, ClasssSchoolYear $classsSchoolYear)
    {
        // dd($request);
        $orderData = $request->input('order');
    
        foreach ($orderData as $item) {
            YearClassSubject::where('id', $item['id'])->update(['order' => $item['order']]);
        }
    
        return response()->json(['success' => 'تم تحديث الترتيب بنجاح.']);
    }
    public function destroy(ClasssSchoolYear $classsSchoolYear, YearClassSubject $yearClassSubject)
    {
        $yearClassSubject->delete();

        return redirect()->route('year_class_subject.index', ['classsSchoolYear' => $classsSchoolYear->id])
            ->with('success', 'تم حذف الربط بنجاح.');
    }
}
