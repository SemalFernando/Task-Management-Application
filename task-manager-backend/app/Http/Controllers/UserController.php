<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    // Upload user avatar
    public function updateAvatar(Request $request)
    {
        $request->validate([
            'avatar' => 'required|image|max:2048',
        ]);

        $path = $request->file('avatar')->store('avatars');
        auth()->user()->update(['avatar_path' => $path]);

        return response()->json([
            'avatar_url' => Storage::url($path)
        ]);
    }

    // Change user password
    public function changePassword(Request $request)
    {
        $request->validate([
            'current' => 'required|current_password',
            'new' => 'required|min:8|different:current',
            'confirm' => 'required|same:new',
        ]);

        auth()->user()->update([
            'password' => Hash::make($request->new)
        ]);

        return response()->json(['message' => 'Password updated']);
    }
}
