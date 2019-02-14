<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Notifications\PasswordResetDone;
use App\Notifications\PasswordResetRequest;

class passwordResetController extends Controller
{
    public function checkEmail(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user)
            return response()->json([
                'message' => 'We cant find a user with that e-mail address.'
            ], 404);


        if ($user)
            $user->notify(
                new PasswordResetRequest()
            );
        return response()->json([
            'message' => 'We have e-mailed your password reset link!'
        ]);
    }


    public function reset(Request $request)
    {
    $request->validate([
        'email' => 'required|string|email',
        'old_password' => 'required|string',
        'password' => 'required|string|confirmed',
    ]);

$user = User::where('email', $request->email)->first();


if (!$user)
    return response()->json([
        'message' => 'User with this email id does not exist'
    ], 404);





if(!Hash::check($request->old_password, $user->password))
{
    return response()->json([
        'message' => 'Old Password Does not match'
    ], 404);
}

else
{
    $user->password = Hash::make($request->password);
    $user->save();
}



$user->notify(new PasswordResetDone());
return response()->json($user);
}

}
