<?php

namespace App\Http\Controllers;

use App\Models\RewardPunishment;
use App\Models\Teacher;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class RewardPunishmentController extends Controller
{
    public function index($id)
    {
        $rewardsPunishments = RewardPunishment::where('teacher_id',$id)->with('teacher')->paginate(50);
        $teachers = Teacher::all();
        return view('rewards_punishments.index', compact('rewardsPunishments', 'teachers','id'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'teacher_id' => 'required|exists:teachers,id',
            'reward_punishment_name' => 'required|string|max:255',
            'reason' => 'required|string|max:255',
            'year' => 'required|date',
        ]);

        RewardPunishment::create($request->all());

        return response()->json(['success' => true, 'message' => 'Reward or Punishment created successfully.']);
    }

    
    public function edit(Request $request, $id)
    {
        try {
            $data = RewardPunishment::findOrFail($id);
            $teachers = Teacher::all(); 
        
            return response()->json([
              'success' => true,
              'rewards_punishments' => $data,
              'teachers' => $teachers->map(function ($teacher) {
                return [
                  'id' => $teacher->id,
                  'name_ar' => $teacher->name_ar,
                ];
              })->toArray(),
            ]);
          } catch (ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => 'Job Sequence not found'], 404);
          }
    }

    public function update(Request $request,$id)
    {
        $rewardPunishment = RewardPunishment::findOrFail($id);

        $request->validate([
            'teacher_id' => 'required|exists:teachers,id',
            'reward_punishment_name' => 'required|string|max:255',
            'reason' => 'required|string|max:255',
            'year' => 'required|date',
        ]);

        $rewardPunishment->update($request->all());

        return response()->json(['success' => true, 'message' => 'Reward or Punishment updated successfully.']);
    }

    public function destroy($id)
    {
        $rewardPunishment = RewardPunishment::findOrFail($id);

        $rewardPunishment->delete();

        return response()->json(['success' => true, 'message' => 'Reward or Punishment deleted successfully.']);
    }
}
