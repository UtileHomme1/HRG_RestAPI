<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Notifications\passwordForgotSendToUser;
use App\Notifications\passwordForgotDone;
use App\User;
use App\passwordForgot;

class passwordForgotController extends Controller
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

        $passwordForgot = passwordForgot::updateOrCreate(
            ['email' => $userDetails->email],
            [
                'email' => $userDetails->email,
                'token' => str_random(60)
             ]
        );

        if ($userDetails && $passwordForgot)
        $userDetails->notify(
            new passwordForgotSendToUser($passwordForgot->token)
        );

        return response()->json([
            'data' => 'Password Forgot Link Sent!'
        ]);


    }

    public function checkToken($token)
    {
        $passwordForgot = passwordForgot::where('token', $token)->first();

            if (!$passwordForgot)
            return response()->json([
                'message' => 'Password Forgot token is invalid'
            ], 404);

            return response()->json($passwordForgot);
    }

    public function forgot(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string|confirmed',
            'token' => 'required|string'
        ]);

        $passwordForgot = passwordForgot::where([
            ['token', $request->token],
            ['email', $request->email] ])->first();

        if (!$passwordForgot)
        return response()->json([
            'message' => 'Password Forgot token is not valid'
        ], 404);

    $user = User::where('email', $passwordForgot->email)->first();

    if (!$user)
        return response()->json([
            'message' => 'User with this email id does not exist'
        ], 404);

    $user->password = bcrypt($request->password);

    $user->save();

    $passwordForgot->delete();

    $user->notify(new passwordForgotDone($passwordForgot));
    return response()->json($user);

    }
}
