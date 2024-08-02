<?php

namespace App\Http\Controllers;

use App\Models\Classs;
use App\Models\Tableheader;
use Illuminate\Http\Request;

class TableheaderController extends Controller
{
    public function index()
    {
        $tableheaders = Tableheader::paginate(10);
        $classes = Classs::all();
        return view('tables.tableheaders', compact('tableheaders', 'classes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'class_id' => 'required|integer',
            'min_height' => 'required|integer',
            'max_width' => 'required|integer',
            'left_margin' => 'required|integer',
        ]);

        Tableheader::create($request->all());

        return response()->json(['success' => true]);
    }

    public function edit($id)
    {
        $tableheader = Tableheader::find($id);
        return response()->json($tableheader);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'class_id' => 'required|integer',
            'min_height' => 'required|integer',
            'max_width' => 'required|integer',
            'left_margin' => 'required|integer',
        ]);

        $tableheader = Tableheader::find($id);
        $tableheader->update($request->all());

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        $tableheader = Tableheader::find($id);
        $tableheader->delete();

        return response()->json(['success' => true]);
    }
}
