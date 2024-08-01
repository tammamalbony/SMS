<?php

namespace App\Http\Controllers;

use App\Models\QuestionOption;
use App\Models\QuestionOptionRelation;
use App\Models\SchoolQuestion;
use Illuminate\Http\Request;

class SchoolQuestionController extends Controller
{
    public function index()
    {
        $schoolQuestions = SchoolQuestion::with('options')->paginate(10);
        return view('setting.school_questions', compact('schoolQuestions'));
    }
    public function getall()
    {
        $questions = SchoolQuestion::with('options')
            ->whereIn('type', ['select_many', 'select_one'])
            ->get(['id', 'title', 'type']);
        return response()->json($questions);
    }
    public function updateOrder(Request $request)
    {
        $order = $request->input('order');

        foreach ($order as $index => $id) {
            \DB::table('school_questions')->where('id', $id)->update(['order' => $index + 1]);
        }

        return response()->json(['success' => true]);
    }

    public function getOptions(SchoolQuestion $question)
    {
        return response()->json($question->options);
    }
    public function getOptionstargetid(SchoolQuestion $question, $targetid)
    {
        // Retrieve only IDs of options related to the targetId to reduce query load
        $relatedOptionIds = QuestionOptionRelation::where('question_id', $targetid)
            ->pluck('option_id');

        // Eager load options to avoid the N+1 problem
        $options = $question->options()->get();

        // Check each option and set 'checked' attribute accordingly
        foreach ($options as $option) {
            $option->checked = $relatedOptionIds->contains($option->id);
        }

        return response()->json($options);
    }
    public function updateRelations(Request $request)
    {
        foreach ($request->relations as $relation) {
            $option = QuestionOption::find($relation['option_id']);
            $question = SchoolQuestion::find($relation['related_question_id']);
            if ($option && $question) {
                $question->update(['dependent_option_id' => $option->id]);
            }
        }

        return response()->json(['success' => true]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'type' => 'required|in:true_or_false,select_many,select_one',
            'options' => 'array|required_if:type,select_many,select_one',
            'options.*' => 'required_with:options|string'
        ]);

        $schoolQuestion = SchoolQuestion::create($request->all());
        if ($request->has('options')) {
            foreach ($request->options as $option) {
                $schoolQuestion->options()->create(['option_text' => $option]);
            }
        }
        return response()->json(['success' => true, 'data' => $schoolQuestion]);
    }

    public function edit($id)
    {
        $schoolQuestion = SchoolQuestion::with("options")->where('id', $id)->first();
        return response()->json($schoolQuestion);
    }
    public function link(Request $request)
    {
        $request->validate([
            'questionId' => 'required|exists:school_questions,id',
            'optionIds' => 'array',
            'optionIds.*' => 'exists:question_options,id'
        ]);

        $questionId = $request->questionId;
        $newOptionIds = $request->optionIds ?: [];

        // Get existing option IDs for the question
        $existingOptionIds = QuestionOptionRelation::where('question_id', $questionId)
            ->pluck('option_id')
            ->toArray();

        // Calculate option IDs to delete (existing but not in new)
        $optionIdsToDelete = array_diff($existingOptionIds, $newOptionIds);

        // Calculate option IDs to add (new but not in existing)
        $optionIdsToAdd = array_diff($newOptionIds, $existingOptionIds);

        // Delete the old relations
        QuestionOptionRelation::where('question_id', $questionId)
            ->whereIn('option_id', $optionIdsToDelete)
            ->delete();

        // Add the new relations
        foreach ($optionIdsToAdd as $optionId) {
            QuestionOptionRelation::create([
                'question_id' => $questionId,
                'option_id' => $optionId,
            ]);
        }

        return response()->json(['success' => true]);
    }
    public function update(Request $request, $id)
    {

        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'type' => 'required|in:true_or_false,select_many,select_one',
            'options' => 'array|required_if:type,select_many,select_one',
            'options.*' => 'required_with:options|string'
        ]);

        $schoolQuestion = SchoolQuestion::findOrFail($id);
        $schoolQuestion->update($request->all());

        if ($request->has('options')) {
            $schoolQuestion->options()->delete();
            foreach ($request->options as $option) {
                $schoolQuestion->options()->create(['option_text' => $option]);
            }
        }

        return response()->json(['success' => true, 'data' => $schoolQuestion]);
    }

    public function destroy($id)
    {
        $schoolQuestion = SchoolQuestion::findOrFail($id);
        $schoolQuestion->delete();

        return response()->json(['success' => true]);
    }
}
