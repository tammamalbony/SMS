<?php

namespace App\Http\Controllers;

use App\Models\Part;
use App\Models\PartOperation;
use Illuminate\Http\Request;

class PartController extends Controller
{

    public function index(Request $request)
    {
        $yearClassSubjectId = $request->input('year_class_subject_id');

        $query = Part::query();

        if ($yearClassSubjectId) {
            $query->where('year_class_subject_id', $yearClassSubjectId);
        }

        $parts = $query->with('operations.operandPart')->get();
        $allParts = Part::all(); // Fetch all parts for the dropdown

        return view('parts.index', compact('parts', 'yearClassSubjectId', 'allParts'));
    }

    public function store(Request $request)
    {
        // Validate the request
        $request->validate([
            'year_class_subject_id' => 'required|exists:c_s_y_s_detail,id',
            'mark_review_id' => 'nullable|exists:mark_reviews,id',
            'name' => 'required|string|max:255',
            'value' => 'nullable|numeric',
            'operation' => 'nullable|string|in:add,subtract,multiply,divide',
            'is_final_result' => 'nullable|boolean',
            'is_sealed' => 'nullable|boolean',
            'is_visible' => 'nullable|boolean',
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
            'is_active',
            'must_be_calculated',
            'must_be_ceiled',
            'max_per_cent',
            'has_mark_review',
            'is_semi_final_result',
            'is_result_part',

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

        return response()->json(['success' => true]);
    }


    public function update(Request $request, $id)
    {
        // Validate the request
        $request->validate([
            'year_class_subject_id' => 'required|exists:c_s_y_s_detail,id',
            'mark_review_id' => 'nullable|exists:mark_reviews,id',
            'name' => 'required|string|max:255',
            'value' => 'nullable|numeric',
            'operation' => 'nullable|string|in:add,subtract,multiply,divide',
            'is_final_result' => 'nullable|boolean',
            'is_sealed' => 'nullable|boolean',
            'is_visible' => 'nullable|boolean',
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
            'is_active',
            'must_be_calculated',
            'must_be_ceiled',
            'max_per_cent',
            'has_mark_review',
            'is_semi_final_result',
            'is_result_part',
        ]));

        // Delete existing operations
        PartOperation::where('part_id', $part->id)->delete();

        // Create the new part operations if any
        if ($request->has('operations')) {
            foreach ($request->input('operations') as $operation) {
                PartOperation::create([
                    'part_id' => $part->id,
                    'operand_part_id' => $operation['operand_part_id'],
                    'operation' => $operation['operation'],
                ]);
            }
        }

        return response()->json(['success' => true]);
    }
    public function destroy($id)
    {
        Part::destroy($id);

        return response()->json(['success' => true]);
    }
}
