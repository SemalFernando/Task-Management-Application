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

/* ==================== PUBLIC ROUTES ==================== */
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

/* ==================== PROTECTED ROUTES ==================== */
Route::middleware('auth:sanctum')->group(function () {
    /* ========== AUTHENTICATION ROUTES ========== */
    Route::get('/user', [AuthController::class, 'user']); // Get authenticated user
    Route::post('/logout', [AuthController::class, 'logout']); // Logout

    /* ========== TASK ROUTES ========== */
    Route::apiResource('tasks', TaskController::class)->except(['create', 'edit']);

    /* ========== CATEGORY ROUTES ========== */
    Route::get('/categories', [CategoryController::class, 'index']); // Get all categories

    /* ========== USER PROFILE ROUTES ========== */
    Route::prefix('user')->group(function () {
        Route::post('/upload-avatar', [UserController::class, 'uploadAvatar']); // Update avatar
        Route::post('/change-password', [UserController::class, 'changePassword']); // Change password
    });
});
