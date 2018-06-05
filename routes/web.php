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

Route::namespace('Cms')->group(function () {
    Route::get('/', 'ContentsController@index')->name('index');
    Route::get('/contents/{category}', 'ContentsController@index')->name('contents');
    Route::get('/article/{id}', 'ArticleController@index')->name('article');
});

Auth::routes();

// 后台用户认证
Route::prefix('admin')->group(function () {
    Route::get('login', 'Admin\Auth\LoginController@showLoginForm')->name('admin_login');
    Route::post('login', 'Admin\Auth\LoginController@login');
    Route::post('logout', 'Admin\Auth\LoginController@logout')->name('admin_logout');
});

Route::prefix('panel')->namespace('admin')->middleware('auth:admin')->group(function () {
    Route::get('index', 'HomeController@home')->name('home.index');
    Route::get('/', 'HomeController@index')->name('home');
    Route::post('role/authorize', 'RoleController@roleAuthorize')->name('role.authorize');
    Route::get('role/permissions/{role}', 'RoleController@permissions')->name('role.permissions');
    Route::resource('ability', 'AbilityController');
    Route::resource('article', 'ArticleController');
    Route::resource('role', 'RoleController');
    Route::resource('admins', 'UserController');
});

Route::get('/home', 'HomeController@index')->name('home');
