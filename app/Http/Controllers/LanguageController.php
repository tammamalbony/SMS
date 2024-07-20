<?php

namespace App\Http\Controllers;

use App\Models\Language;
use Illuminate\Http\Request;

class LanguageController extends Controller
{
    public function index()
    {
        $languages = Language::paginate(10);
        return view('languages.index', compact('languages'));
    }

    public function create()
    {
        return view('languages.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'short_name' => 'required|string|max:255',

        ]);

        $language = Language::create($request->all());

        return response()->json(['success' => true, 'message' => 'تم إنشاء اللغة بنجاح.', 'data' => $language]);
    }

    public function edit(Language $language)
    {
        return response()->json($language);
    }

    public function update(Request $request, Language $language)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'short_name' => 'required|string|max:255',
        ]);

        $language->update($request->all());

        return response()->json(['success' => true, 'message' => 'تم تعديل اللغة بنجاح.', 'data' => $language]);
    }

    public function destroy(Language $language)
    {
        $language->delete();

        return response()->json(['success' => true, 'message' => 'تم حذف اللغة بنجاح.']);
    }
}
