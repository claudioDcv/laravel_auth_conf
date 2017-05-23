<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/scheduler', 'HomeController@scheduler')->name('scheduler')->middleware('role:admin');

Route::match(['get', 'post'], '/scheduler_data', "SchedulerController@data")->middleware('role:admin');

Route::match(['get', 'post'], '/event', "HomeController@event")->middleware('role:admin');

Route::match(['get', 'post'], '/event-calendar', "HomeController@eventCalendar")->name('event-calendar')->middleware('role:admin');

Route::match(['get'], '/users', "HomeController@users")->name('users')->middleware('role:admin');
Route::get('users/{id}', "HomeController@usersView")->name('user-view')->middleware('role:admin');


// Route::match(['get'], '/user/register', "HomeController@register")->name('register');
//
// Route::match(['post'], '/user/register', "HomeController@register");
//
//
//
//
//
// // Authentication Routes...
Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');

// Registration Routes...
Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register')->middleware('role:admin');
Route::post('register', 'Auth\RegisterController@register')->middleware('role:admin');

// Password Reset Routes...
Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
Route::post('password/reset', 'Auth\ResetPasswordController@reset');
