<?php

namespace App\Http\Controllers;

use App\Models\LearningType;
use Illuminate\Http\Request;

class LearningTypeController extends Controller
{
    public function index()
    {
        $learningTypes = LearningType::paginate(10);
        return view('sections.learning_types', compact('learningTypes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        $learningType = LearningType::create($request->all());

        return response()->json(['success' => true, 'message' => 'تم إضافة نوع التعلم بنجاح.', 'data' => $learningType]);
    }

    public function edit(LearningType $learningType)
    {
        return response()->json($learningType);
    }

    public function update(Request $request, LearningType $learningType)
    {
        $request->validate([
            'type' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        $learningType->update($request->all());

        return response()->json(['success' => true, 'message' => 'تم تعديل نوع التعلم بنجاح.', 'data' => $learningType]);
    }

    public function destroy(LearningType $learningType)
    {
        $learningType->delete();

        return response()->json(['success' => true, 'message' => 'تم حذف نوع التعلم بنجاح.']);
    }
}
