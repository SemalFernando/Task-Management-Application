<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index()
    {
        return response()->json([
            'tasks' => auth()->user()->tasks()->with('category')->get()
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'description' => 'nullable|string',
            'due_date' => 'nullable|date',
            'status' => 'nullable|in:pending,in_progress,completed',
            'category_id' => 'required|exists:categories,id'
        ]);

        $task = auth()->user()->tasks()->create($request->all());

        return response()->json([
            'message' => 'Task created successfully',
            'task' => $task
        ], 201);
    }

    public function update(Request $request, Task $task)
    {
        $this->authorize('update', $task);

        $request->validate([
            'title' => 'sometimes|string',
            'description' => 'nullable|string',
            'due_date' => 'nullable|date',
            'status' => 'nullable|in:pending,in_progress,completed',
            'category_id' => 'sometimes|exists:categories,id'
        ]);

        $task->update($request->all());

        return response()->json([
            'message' => 'Task updated successfully',
            'task' => $task
        ]);
    }

    public function destroy(Task $task)
    {
        $this->authorize('delete', $task);
        $task->delete();
        return response()->json(['message' => 'Task deleted successfully']);
    }
}
