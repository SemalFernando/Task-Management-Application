<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        return response()->json([
            'categories' => auth()->user()->categories
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:categories,name,NULL,id,user_id,'.auth()->id()
        ]);

        $category = auth()->user()->categories()->create([
            'name' => $request->name
        ]);

        return response()->json([
            'message' => 'Category created successfully',
            'category' => $category
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);

        // This will check the policy
        $this->authorize('update', $category);

        $validated = $request->validate([
            'name' => 'required|string|unique:categories,name,'.$id.',id,user_id,'.auth()->id()
        ]);

        $category->update($validated);

        return response()->json([
            'message' => 'Category updated successfully',
            'category' => $category
        ]);
    }

    public function destroy(Category $category)
    {
        $this->authorize('delete', $category);

        // Check if category has tasks first
        if($category->tasks()->exists()) {
            return response()->json([
                'message' => 'Cannot delete category with existing tasks'
            ], 422);
        }

        $category->delete();

        return response()->json([
            'message' => 'Category deleted successfully'
        ]);
    }

    public function show(Category $category)
    {
        $this->authorize('view', $category);

        return response()->json([
            'category' => $category->load('tasks')
        ]);
    }
}
