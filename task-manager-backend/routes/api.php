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
    Route::get('/user', [AuthController::class, 'user']); // Existing user endpoint
    Route::post('/logout', [AuthController::class, 'logout']); // Existing logout

    /* ========== TASK ROUTES (CRUD) ========== */
    Route::prefix('tasks')->group(function () {
        Route::get('/', [TaskController::class, 'index']);       // Get all tasks
        Route::post('/', [TaskController::class, 'store']);      // Create task
        Route::put('/{id}', [TaskController::class, 'update']);  // Update task
        Route::delete('/{id}', [TaskController::class, 'destroy']); // Delete task
    });

    /* ========== CATEGORY ROUTES ========== */
    Route::get('/categories', [CategoryController::class, 'index']); // Get categories

    /* ========== USER PROFILE ROUTES ========== */
    Route::prefix('user')->group(function () {
        Route::post('/avatar', [UserController::class, 'updateAvatar']);    // Update avatar
        Route::post('/password', [UserController::class, 'changePassword']); // Change password
    });

    /* ========== OPTIONAL USER DATA ROUTE ========== */
    // Keeping your existing optional route exactly as is
    Route::get('/user-data', function (Request $request) {
        return $request->user();
    });
});
