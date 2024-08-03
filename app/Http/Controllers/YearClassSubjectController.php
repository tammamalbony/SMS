<?php

namespace App\Http\Controllers;

use App\Models\YearClassSubject;
use App\Models\ClasssSchoolYear;
use App\Models\SubjectDetail;
use App\Models\Language;
use Illuminate\Http\Request;

class YearClassSubjectController extends Controller
{
    public function index(ClasssSchoolYear $classsSchoolYear)
    {
        $subjectDetails = SubjectDetail::where("grade_id", $classsSchoolYear->classs->grade_id)->get();
        $yearClassSubjects = YearClassSubject::with(['subjectDetail', 'foreignLanguage'])
            ->where('c_s_y_id', $classsSchoolYear->id)
            ->orderBy('order')
            ->get();
        $hasnew = false;
        foreach ($subjectDetails as $key => $subjectDetail) {
            if (!$yearClassSubjects->contains('subject_detail_id', $subjectDetail->id)) {
                $hasnew = true;
            }
        }
        // dd($subjectDetails);
        $languages = Language::all();
        return view('year_class_subject.index', compact('yearClassSubjects', 'classsSchoolYear', 'subjectDetails', 'hasnew', 'languages'));
    }

    public function create(ClasssSchoolYear $classsSchoolYear)
    {
        $subjectDetails = SubjectDetail::all();
        $languages = Language::all();
        return view('year_class_subject.create', compact('classsSchoolYear', 'subjectDetails', 'languages'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'classses_school_year_id' => 'required|exists:classs_school_years,id',
            'subject_detail_id' => 'required|exists:subject_details,id',
            'order' => 'nullable|integer',
            'is_falling' => 'required|boolean',
            'is_optional_foreign_subject' => 'required|boolean',
            'foreign_language_id' => 'nullable|exists:languages,id',
        ]);

        $data = $request->all();
        $result['c_s_y_id'] = $data['classses_school_year_id'];
        $result['subject_detail_id'] = $data['subject_detail_id'];
        $result['order'] = $data['order'];
        $result['is_falling'] = $data['is_falling'];
        $result['is_optional_foreign_subject'] = $data['is_optional_foreign_subject'];
        $result['foreign_language_id'] = $data['foreign_language_id'];

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
            'classses_school_year_id' => 'required|exists:classs_school_years,id',
            'subject_detail_id' => 'required|exists:subject_details,id',
            'order' => 'nullable|integer',
            'is_falling' => 'required|boolean',
            'is_optional_foreign_subject' => 'required|boolean',
            'foreign_language_id' => 'nullable|exists:languages,id',
        ]);

        $data = $request->all();
        $data['c_s_y_id'] = $data['classses_school_year_id'];
        $yearClassSubject->update($data);

        return response()->json(['success' => 'تم تحديث الربط بنجاح.']);
    }

    public function updateOrder(Request $request, ClasssSchoolYear $classsSchoolYear)
    {
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
