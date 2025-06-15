<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $user = \App\Models\User::first(); // Assign to the first user

        $categories = [
            ['name' => 'Work', 'color' => '#3b82f6'],
            ['name' => 'Personal', 'color' => '#10b981'],
            ['name' => 'Urgent', 'color' => '#ef4444'],
        ];

        foreach ($categories as $category) {
            $user->categories()->create($category);
        }
    }
}
