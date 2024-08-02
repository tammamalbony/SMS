<?php

namespace App\Http\Controllers;

use App\Models\Column;
use App\Models\Tableheader;
use App\Models\Term;
use Illuminate\Http\Request;

class ColumnController extends Controller
{
    public function index(Request $request)
    {
        $tableheaderId = $request->query('tableheader_id');
        $columns = Column::where('tableheader_id', $tableheaderId)->with('tableheader', 'parent')->paginate(10);
        $tableheader = Tableheader::find($tableheaderId);
        $terms = Term::all();
        return view('tables.columns', compact('columns', 'tableheader','terms'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'text_direction' => 'required|in:vertical,horizontal',
            'min_width' => 'required|integer',
            'max_text_width' => 'required|integer',
            'font_size' => 'required|integer',
            'is_active_for_finals' => 'required|boolean',
            'tableheader_id' => 'required|integer',
            'parent_id' => 'nullable|integer',
        ]);

        Column::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $column = Column::find($id);
        return response()->json($column);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'text_direction' => 'required|in:vertical,horizontal',
            'min_width' => 'required|integer',
            'max_text_width' => 'required|integer',
            'font_size' => 'required|integer',
            'is_active_for_finals' => 'required|boolean',
            'tableheader_id' => 'required|integer',
            'parent_id' => 'nullable|integer',
        ]);

        $column = Column::find($id);
        $column->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $column = Column::find($id);
        $column->delete();

        return response()->json(['success' => true]);
    }
}
