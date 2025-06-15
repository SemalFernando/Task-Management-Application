<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class TaskSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $user = \App\Models\User::first();
        $categories = $user->categories;

        $tasks = [
            [
                'title' => 'Complete project proposal',
                'description' => 'Finish the client proposal document',
                'due_date' => now()->addDays(3),
                'category_id' => $categories->where('name', 'Work')->first()->id,
            ],
            [
                'title' => 'Buy groceries',
                'description' => 'Milk, eggs, bread, fruits',
                'due_date' => now()->addDays(1),
                'category_id' => $categories->where('name', 'Personal')->first()->id,
            ],
        ];

        foreach ($tasks as $task) {
            $user->tasks()->create($task);
        }
    }
}
