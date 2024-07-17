<?php

namespace App\Http\Controllers;

use App\Models\MarkReview;
use Illuminate\Http\Request;

class MarkReviewController extends Controller
{
    public function index()
    {
        $markReviews = MarkReview::all();
        return view('mark_reviews.index', compact('markReviews'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'min_mark' => 'required|numeric',
            'max_mark' => 'required|numeric',
            'result' => 'required|string',
            'color' => 'required|string',
        ]);

        MarkReview::create($request->all());
        return redirect()->route('mark_reviews.index')->with('success', 'Mark Review created successfully.');
    }

    public function update(Request $request, MarkReview $markReview)
    {
        $request->validate([
            'min_mark' => 'required|numeric',
            'max_mark' => 'required|numeric',
            'result' => 'required|string',
            'color' => 'required|string',
        ]);

        $markReview->update($request->all());
        return redirect()->route('mark_reviews.index')->with('success', 'Mark Review updated successfully.');
    }

    public function destroy(MarkReview $markReview)
    {
        $markReview->delete();
        return redirect()->route('mark_reviews.index')->with('success', 'Mark Review deleted successfully.');
    }
}
