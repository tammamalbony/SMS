<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Governate;
use Illuminate\Http\Request;

class CountryController extends Controller
{
    public function index()
    {
        $countries = Country::paginate(10);
        return view('countries.index', compact('countries'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        Country::create($request->all());

        return response()->json(['success' => true, 'message' => 'Country created successfully']);
    }

    public function edit($id)
    {
        $country = Country::findOrFail($id);
        return response()->json($country);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $country = Country::findOrFail($id);
        $country->update($request->all());
        
        return response()->json(['success' => true, 'message' => 'Country updated successfully']);
    }

    public function destroy($id)
    {
        $country = Country::findOrFail($id);
        $country->delete();

        return response()->json(['success' => true, 'message' => 'Country deleted successfully']);
    }

    public function getGovernates($countryId)
    {
        $governates = Governate::where('country_id', $countryId)->get();
        return response()->json($governates);
    }
}
