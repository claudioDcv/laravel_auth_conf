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


Route::match(['get'], '/users', "HomeController@users")->name('users')->middleware('role:admin|reservation');
Route::get('users/{id}', "HomeController@usersView")->name('user-view')->middleware('role:admin|reservation');
Route::match(['get'], '/user-view-asigns-role/{id}', "HomeController@userViewAsignsRole")->name('user-view-asigns-role')->middleware('role:admin');
Route::match(['get'], '/user-view-asigns-specialities/{id}', "HomeController@userViewAsignsSpecialities")->name('user-view-asigns-specialities')->middleware('role:admin');

Route::match(['post'], '/save-asigns-role', "HomeController@saveAsignsRole")->name('save-asigns-role')->middleware('role:admin');
Route::match(['post'], '/save-asigns-specialities', "HomeController@saveAsignsSpecialities")->name('save-asigns-specialities')->middleware('role:admin');


Route::resource('event','EventController');
//ruta para realizar busqueda de registros.
Route::post('event/search', ['as' => 'event/search', 'uses'=>'EventController@search']);

Route::get('json/event/list', ['as' => 'json/event/list', 'uses'=>'EventController@json_list']);
Route::post('json/event', ['as' => 'json/event/create', 'uses'=>'EventController@json_create']);
Route::post('json/event/delete', ['as' => 'json/event/delete', 'uses'=>'EventController@json_delete']);
Route::post('json/event/update/{id}', ['as' => 'json/event/update', 'uses'=>'EventController@json_update']);
Route::get('json/event/filter', ['as' => 'event/filter', 'uses'=>'EventController@json_by_filter']);

Route::get('medic-event/{user}/{spec}/{date}', "EventController@medicEventList")
  ->name('medic-event-list')
  ->where(array(
    'user' => '[0-9]+',
    'spec' => '[0-9]+',
    'date' => '(0[1-9]|[1-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-[0-9]{4}',
  ))
  ->middleware('role:admin|reservation|medic|client');


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



// Calendar
Route::get('week-event/{id}', 'WeekCalendar@event')
  ->where(array(
    'id' => '[0-9]+',
  ))
  ->name('WCEvent')
  ->middleware('role:admin|reservation|medic|client');
Route::post('week-event/save', 'WeekCalendar@save')->name('WCEvent')->middleware('role:admin');


// Users
Route::get('medic/specialities/json', 'HomeController@specialities')->name('medic-specialities-json')->middleware('role:admin|reservation|medic|client');
Route::get('medic/user/json/{specialities_id}', 'HomeController@medicBySpecialities')->name('medic-by-specialities')->middleware('role:admin|reservation|medic|client');

Route::get('horario', 'HomeController@myHH')->name('my-hh')->middleware('role:admin|reservation|medic|client');
