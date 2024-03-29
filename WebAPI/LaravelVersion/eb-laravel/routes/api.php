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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('register', 'UserController@register');
    Route::post('login', 'UserController@authenticate');
    Route::get('open', 'DataController@open');
    Route::get('checkdb', 'UserController@checkdb');
    Route::get('checktable', 'UserController@checktable');
   

    Route::group(['middleware' => ['jwt.verify']], function() {
    	 
    Route::post('updatedata', 'UserController@updatedata');
    	Route::get('logout', 'UserController@logout');
        Route::get('user', 'UserController@getAuthenticatedUser');
        Route::get('closed', 'DataController@closed');
    });