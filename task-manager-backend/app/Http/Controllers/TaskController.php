<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function index()
    {
        try {
            return response()->json(
                Auth::user()->tasks()
                    ->with('category')
                    ->latest()
                    ->get()
            );
        } catch (\Exception $e) {
            Log::error('Task fetch error: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to load tasks'], 500);
        }
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'due_date' => 'required|date|after_or_equal:today',
            'priority' => 'required|in:high,medium,low',
            'category_id' => 'required|exists:categories,id'
        ]);

        try {
            $task = Auth::user()->tasks()->create([
                'title' => $validated['title'],
                'description' => $validated['description'],
                'due_date' => $validated['due_date'],
                'priority' => $validated['priority'],
                'category_id' => $validated['category_id'],
                'status' => 'pending',
                'progress' => 0
            ]);

            return response()->json($task->load('category'), 201);

        } catch (\Exception $e) {
            Log::error('Task creation error: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to create task'], 500);
        }
    }

    public function update(Request $request, Task $task)
    {
        $this->authorize('update', $task);

        $validated = $request->validate([
            'title' => 'sometimes|string|max:255',
            'description' => 'nullable|string',
            'due_date' => 'sometimes|date|after_or_equal:today',
            'priority' => 'sometimes|in:high,medium,low',
            'category_id' => 'sometimes|exists:categories,id',
            'status' => 'sometimes|in:pending,in_progress,completed',
            'progress' => 'sometimes|integer|min:0|max:100'
        ]);

        try {
            if (isset($validated['status']) && $validated['status'] === 'completed') {
                $validated['progress'] = 100;
            }

            $task->update($validated);

            return response()->json($task->fresh()->load('category'));

        } catch (\Exception $e) {
            Log::error('Task update error: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to update task'], 500);
        }
    }

    public function destroy(Task $task)
    {
        $this->authorize('delete', $task);

        try {
            $task->delete();
            return response()->json(null, 204);
        } catch (\Exception $e) {
            Log::error('Task deletion error: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to delete task'], 500);
        }
    }
}
