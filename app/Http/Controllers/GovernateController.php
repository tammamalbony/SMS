<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Governate;
use Illuminate\Http\Request;

class GovernateController extends Controller
{
    public function index($countryId)
    {
        $country = Country::findOrFail($countryId);
        $governates = Governate::where('country_id', $countryId)->paginate(10);
        return view('governates.index', compact('country', 'governates'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'country_id' => 'required|exists:countries,id',
        ]);

        Governate::create($request->all());

        return response()->json(['success' => true, 'message' => 'Governate created successfully']);
    }

    public function edit($id)
    {
        $governate = Governate::findOrFail($id);
        return response()->json($governate);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'country_id' => 'required|exists:countries,id',
        ]);

        $governate = Governate::findOrFail($id);
        $governate->update($request->all());

        return response()->json(['success' => true, 'message' => 'Governate updated successfully']);
    }

    public function destroy($id)
    {
        $governate = Governate::findOrFail($id);
        $governate->delete();

        return response()->json(['success' => true, 'message' => 'Governate deleted successfully']);
    }
}
