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
    'prefix' => 'passwordreset'
], function ()
{
    Route::post('checkUserEmail', 'passwordResetController@checkUserEmail');
    Route::get('checkToken/{token}', 'passwordResetController@checkToken');
    Route::post('reset', 'passwordResetController@reset');
});
