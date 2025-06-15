<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Public routes (no auth required)
Route::post('/login', [AuthController::class, 'login']);

// Protected routes (require Sanctum token authentication)
Route::middleware('auth:sanctum')->group(function () {
    // Authentication
    Route::post('/logout', [AuthController::class, 'logout']);

    // Tasks (full CRUD)
    Route::get('/tasks', [TaskController::class, 'index']);
    Route::post('/tasks', [TaskController::class, 'store']);
    Route::put('/tasks/{id}', [TaskController::class, 'update']);
    Route::delete('/tasks/{id}', [TaskController::class, 'destroy']);

    // Categories
    Route::get('/categories', [CategoryController::class, 'index']);

    // User Profile
    Route::post('/user/avatar', [UserController::class, 'updateAvatar']);
    Route::post('/user/password', [UserController::class, 'changePassword']);

    // Optional: Get authenticated user data
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
});
