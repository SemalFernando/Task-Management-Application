<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class TaskController extends Controller
{
    /**
     * Display authenticated user's tasks
     */
    public function index()
    {
        try {
            return response()->json(
                Task::where('user_id', auth()->id())
                    ->with('category')
                    ->latest()
                    ->get()
            );
        } catch (\Exception $e) {
            Log::error('Task index error: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to fetch tasks'], 500);
        }
    }

    /**
     * Create a new task
     */
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
            $task = Task::create([
                ...$validated,
                'user_id' => auth()->id(),
                'status' => 'pending',
                'progress' => 0
            ]);

            return response()->json($task->load('category'), 201);

        } catch (\Exception $e) {
            Log::error('Task creation failed: ' . $e->getMessage());
            return response()->json(['error' => 'Task creation failed'], 500);
        }
    }

    /**
     * Update an existing task
     */
    public function update(Request $request, $id)
    {
        $task = auth()->user()->tasks()->findOrFail($id);

        if (!$task) {
            return response()->json(['error' => 'Task not found'], 404);
        }

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
            // Auto-complete when status changes to completed
            if (isset($validated['status'])) {
                $validated['progress'] = ($validated['status'] === 'completed') ? 100 : min($validated['progress'] ?? 0, 99);
            }

            $task->update($validated);

            return response()->json($task->fresh()->load('category'));

        } catch (\Exception $e) {
            Log::error('Task update failed: ' . $e->getMessage());
            return response()->json(['error' => 'Task update failed'], 500);
        }
    }

    /**
     * Delete a task
     */
    public function destroy($id)
    {
        $task = Task::where('user_id', auth()->id())->find($id);

        if (!$task) {
            return response()->json(['error' => 'Task not found'], 404);
        }

        try {
            $task->delete();
            return response()->json(null, 204);
        } catch (\Exception $e) {
            Log::error('Task deletion failed: ' . $e->getMessage());
            return response()->json(['error' => 'Task deletion failed'], 500);
        }
    }
}
