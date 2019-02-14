<?php

use Illuminate\Http\Request;

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

Route::post('loginuser', 'userController@login');
Route::post('signupuser', 'userController@signup');


Route::group([
    'middleware' => 'api',
    'prefix' => 'forgotpassword'
], function ()
{
    Route::post('checkUserEmail', 'passwordForgotController@checkUserEmail');
    Route::get('checkToken/{token}', 'passwordForgotController@checkToken');
    Route::post('forgot', 'passwordForgotController@forgot');
});

Route::group([
    'middleware' => 'api',
    'prefix' => 'resetpassword'
], function ()
{
    Route::post('checkEmail', 'passwordResetController@checkEmail');
    Route::post('reset', 'passwordResetController@reset');
});
