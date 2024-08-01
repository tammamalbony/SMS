<?php

namespace App\Http\Controllers;

use App\Models\QuestionOptionRelation;
use Illuminate\Http\Request;

class QuestionOptionController extends Controller
{
    public function index()
    {
        $relations = QuestionOptionRelation::all();
        return response()->json($relations);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'question_id' => 'required|integer|exists:questions,id',
            'option_id' => 'required|integer|exists:options,id',
        ]);

        $relation = QuestionOptionRelation::create($validated);
        return response()->json($relation, 201);
    }

    public function show($id)
    {
        $relation = QuestionOptionRelation::find($id);
        if (!$relation) {
            return response()->json(['message' => 'Not found'], 404);
        }
        return response()->json($relation);
    }

    public function update(Request $request, $id)
    {
        $relation = QuestionOptionRelation::find($id);
        if (!$relation) {
            return response()->json(['message' => 'Not found'], 404);
        }

        $validated = $request->validate([
            'question_id' => 'sometimes|required|integer|exists:questions,id',
            'option_id' => 'sometimes|required|integer|exists:options,id',
        ]);

        $relation->update($validated);
        return response()->json($relation);
    }

    public function destroy($id)
    {
        $relation = QuestionOptionRelation::find($id);
        if (!$relation) {
            return response()->json(['message' => 'Not found'], 404);
        }

        $relation->delete();
        return response()->json(['message' => 'Deleted successfully']);
    }
}
