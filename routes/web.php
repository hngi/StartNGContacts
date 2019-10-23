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
    return view('index');
});



// route to process the form
Route::post('/login', 'AdminController@Login');

Route::get('/addcontacts', 'ContactController@FetchCategories');
Route::get('/dashboard', function () {
    return view('dashboard');
});
Route::get('/admin', 'AdminController@index');

Route::get('/admin/createadmin', 'AdminController@create');
Route::post('/storeadmin', 'AdminController@storeadmin');

Route::post('/storecategory', 'CategoryController@storecategory');



