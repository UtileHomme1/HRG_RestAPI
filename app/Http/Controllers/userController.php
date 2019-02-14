<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\User;

class userController extends Controller
{
    public function signup(Request $request)
    {
        $request->validate(
            [
                'name' => 'required|string',
                'email' => 'required|email|unique:users',
                'password' => 'required|string|confirmed'
            ]
        );

        $user = new User(
            [
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password)

            ]
        );

        $user->save();

        return response()->json([
            'data' => 'User Created'
        ], 201);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $userCredentials = request(['email', 'password']);

        if(!Auth::attempt($userCredentials))
        {
            return response()->json(
                [
                    'data' => 'Unauthorized'
                ], 401
            );
        }

        $user = $request->user();

        $tokenForUser = $user->createToken('User Token');

        $userToken = $tokenForUser->token;
        // dd($userToken);
        $userToken->save();

        return response()->json(
            [
            'access_token' => $tokenForUser->accessToken,
            'token_type' => 'Bearer'
        ]
    );


    }



}
