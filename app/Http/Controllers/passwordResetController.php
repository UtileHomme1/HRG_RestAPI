<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Notifications\passwordResetSendToUser;
use App\Notifications\passwordResetDone;
use App\User;
use App\passwordReset;

class passwordResetController extends Controller
{
    public function checkUserEmail(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        $userDetails = User::where('email', $request->email)->first();

        if (!$userDetails)
        return response()->json([
            'data' => 'User with this email address does not exist'
        ], 404);

        $passwordReset = passwordReset::updateOrCreate(
            ['email' => $userDetails->email],
            [
                'email' => $userDetails->email,
                'token' => str_random(60)
             ]
        );

        if ($userDetails && $passwordReset)
        $userDetails->notify(
            new passwordResetSendToUser($passwordReset->token)
        );

        return response()->json([
            'data' => 'Password Reset Link Sent!'
        ]);


    }

    public function checkToken($token)
    {
        $passwordReset = passwordReset::where('token', $token)->first();

            if (!$passwordReset)
            return response()->json([
                'message' => 'Password reset token is invalid'
            ], 404);

            return response()->json($passwordReset);
    }

    public function reset(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string|confirmed',
            'token' => 'required|string'
        ]);

        $passwordReset = passwordReset::where([
            ['token', $request->token],
            ['email', $request->email] ])->first();

        if (!$passwordReset)
        return response()->json([
            'message' => 'Password reset token is not valid'
        ], 404);

    $user = User::where('email', $passwordReset->email)->first();

    if (!$user)
        return response()->json([
            'message' => 'User with this email id does not exist'
        ], 404);

    $user->password = bcrypt($request->password);

    $user->save();

    $passwordReset->delete();

    $user->notify(new passwordResetDone($passwordReset));
    return response()->json($user);

    }
}
