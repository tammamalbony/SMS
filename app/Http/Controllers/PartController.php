<?php

namespace App\Http\Controllers;

use App\Models\Part;
use App\Models\PartOperation;
use App\Models\SubjectDetail;
use App\Models\Term;
use App\Models\YearClassSubject;
use Illuminate\Http\Request;

class PartController extends Controller
{

    public function index(Request $request)
    {
        $yearClassSubjectId = $request->input('year_class_subject_id');

        $yearClassSubject = YearClassSubject::findOrFail($yearClassSubjectId);
        $query = Part::query();
      
        $subject = $yearClassSubject->subjectDetail->subject;
        $sub_subjects = $subject->children;
       
        $sub_subject_ids = array();
        array_push($sub_subject_ids, $yearClassSubjectId);
        foreach ($sub_subjects as $key => $sub_subject) {
            $subjectDetails = $sub_subject->subjectDetails()->get();
            foreach ($subjectDetails  as $key => $subjectDetail) {
                $subjectDetailyears  =  $subjectDetail->YearClassSubjects()->get();
                foreach ($subjectDetailyears as $key => $subjectDetailyear) {
                    if($subjectDetailyear->c_s_y_id ==   $yearClassSubject->c_s_y_id){
                        array_push($sub_subject_ids, $subjectDetailyear->id);
                    }
                }
               
            }
        }
        $query->whereIn('year_class_subject_id', $sub_subject_ids);
        $parts = $query->with('operations.operandPart')->get();
        $allParts =  $parts; // Fetch all parts for the dropdown


        $terms = Term::all();

        return view('parts.index', compact('parts', 'yearClassSubjectId', 'allParts','yearClassSubject','terms'));
    }

    public function store(Request $request)
    {
        // Validate the request
        $request->validate([
            'year_class_subject_id' => 'required|exists:c_s_y_s_detail,id',
            'mark_review_id' => 'nullable|exists:mark_reviews,id',
            'term_id' => 'nullable|exists:terms,id',
            'name' => 'required|string|max:255',
            'value' => 'nullable|numeric',
            'operation' => 'nullable|string|in:add,subtract,multiply,divide',
            'is_final_result' => 'nullable|boolean',
            'is_sealed' => 'nullable|boolean',
            'is_visible' => 'nullable|boolean',
            'is_in_final' => 'nullable|boolean',
            'is_in_results' => 'nullable|boolean',
            'is_active' => 'nullable|boolean',
            'must_be_calculated' => 'nullable|boolean',
            'must_be_ceiled' => 'nullable|boolean',
            'operations.*.operand_part_id' => 'nullable|exists:parts,id',
            'operations.*.operation' => 'required_with:operations.*.operand_part_id|in:add,subtract,multiply,divide',
        ]);

        // Create the part
        $part = Part::create($request->only([
            'year_class_subject_id',
            'mark_review_id',
            'name',
            'value',
            'operation',
            'is_final_result',
            'is_sealed',
            'is_visible',
            'is_in_final',
            'is_in_results',
            'is_active',
            'must_be_calculated',
            'must_be_ceiled',
            'max_per_cent',
            'has_mark_review',
            'is_semi_final_result',
            'is_result_part',
            'term_id'

        ]));
        // Create the part operations if any
        if ($request->has('operations')) {
            foreach ($request->input('operations') as $operation) {
                if (isset($operation['operand_part_id']) && isset($operation['operation'])) {
                    PartOperation::create([
                        'part_id' => $part->id,
                        'operand_part_id' => $operation['operand_part_id'],
                        'operation' => $operation['operation'],
                    ]);
                }
            }
        }
        $hasOperations = PartOperation::where('part_id', $part->id)->exists();
        if (!$hasOperations && $part->operation === null) {
            $part->update(['must_be_calculated' => false]);
            $part->update(['value' => null]);
        }
        if($part->must_be_calculated == false){
            $part->update(['must_be_calculated' => false]);
            $part->update(['value' => null]);
        }
        return response()->json(['success' => true]);
    }


    public function update(Request $request, $id)
    {
        // Validate the request
        $request->validate([
            'year_class_subject_id' => 'required|exists:c_s_y_s_detail,id',
            'mark_review_id' => 'nullable|exists:mark_reviews,id',
            'term_id' => 'nullable|exists:terms,id',
            'name' => 'required|string|max:255',
            'value' => 'nullable|numeric',
            'operation' => 'nullable|string|in:add,subtract,multiply,divide',
            'is_final_result' => 'nullable|boolean',
            'is_sealed' => 'nullable|boolean',
            'is_visible' => 'nullable|boolean',
            'is_in_final' => 'nullable|boolean',
            'is_in_results' => 'nullable|boolean',
            'is_active' => 'nullable|boolean',
            'must_be_calculated' => 'nullable|boolean',
            'must_be_ceiled' => 'nullable|boolean',
            'operations.*.operand_part_id' => 'nullable|exists:parts,id',
            'operations.*.operation' => 'required_with:operations.*.operand_part_id|in:add,subtract,multiply,divide',
        ]);

        // Find the part
        $part = Part::findOrFail($id);

        // Update the part
        $part->update($request->only([
            'year_class_subject_id',
            'mark_review_id',
            'name',
            'value',
            'operation',
            'is_final_result',
            'is_sealed',
            'is_visible',
            'is_in_final',
            'is_in_results',
            'is_active',
            'must_be_calculated',
            'must_be_ceiled',
            'max_per_cent',
            'has_mark_review',
            'is_semi_final_result',
            'is_result_part',
            'term_id'
        ]));

        // Delete existing operations
        PartOperation::where('part_id', $part->id)->delete();

        // Create the new part operations if any
        if ($request->has('operations')) {
            foreach ($request->input('operations') as $operation) {
                if($operation['operand_part_id'] != null){
                    PartOperation::create([
                        'part_id' => $part->id,
                        'operand_part_id' => $operation['operand_part_id'],
                        'operation' => $operation['operation'],
                    ]);
                }
            }
        }
        $hasOperations = PartOperation::where('part_id', $part->id)->exists();
        if (!$hasOperations && $part->operation === null) {
            $part->update(['must_be_calculated' => false]);
            $part->update(['value' => null]);
        }
        if($part->must_be_calculated == false){
            $part->update(['must_be_calculated' => false]);
            $part->update(['value' => null]);
        }
        return response()->json(['success' => true]);
    }
    public function destroy($id)
    {
        Part::destroy($id);

        return response()->json(['success' => true]);
    }
}
