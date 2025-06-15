<?php

namespace App\Http\Controllers;

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        // Validate input
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|confirmed',
        ]);

        // Create user
        $user = User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => Hash::make($validated['password']),
        ]);

        // Return response (customize as needed)
        return response()->json([
            'user' => $user,
            'message' => 'Registration successful!'
        ], 201);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        return response()->json([
            'token' => $user->createToken('auth_token')->plainTextToken
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logged out successfully']);
    }

    public function updateAvatar(Request $request)
    {
        $request->validate([
            'avatar' => 'required|image|max:2048', // 2MB max
        ]);

        // Delete old avatar if exists
        if (auth()->user()->avatar_path) {
            Storage::delete(auth()->user()->avatar_path);
        }

        // Store new avatar
        $path = $request->file('avatar')->store('avatars');
        auth()->user()->update(['avatar_path' => $path]);

        return response()->json([
            'avatar_url' => Storage::url($path),
        ]);
    }

    /**
     * Change user password
     */
    public function changePassword(Request $request)
    {
        $request->validate([
            'current_password' => 'required|current_password',
            'new_password' => 'required|min:8|different:current_password',
            'confirm_password' => 'required|same:new_password',
        ]);

        auth()->user()->update([
            'password' => Hash::make($request->new_password),
        ]);

        return response()->json(['message' => 'Password updated successfully']);
    }
}
