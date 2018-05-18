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
    // Authentication Routes...
    Route::get('login', 'Admin\Auth\LoginController@showLoginForm')->name('admin_login');
    Route::post('login', 'Admin\Auth\LoginController@login');
    Route::post('logout', 'Admin\Auth\LoginController@logout')->name('admin_logout');
});

Route::prefix('teacher')->namespace('admin')->middleware('auth:admin')->group(function () {
    Route::get('/', 'HomeController@index')->name('home');
    Route::get('index', 'HomeController@home')->name('home.index');
    Route::get('ability/submenu', 'AbilityController@getSubAbility')->name('ability.submenu');
    Route::post('role/assign/{name}/{abilityId}', 'RoleController@assign');
    Route::get('role/permissions/{role}', 'RoleController@permissions')->name('role.permissions');
    Route::resource('ability', 'AbilityController');
    Route::resource('article', 'ArticleController');
    Route::resource('role', 'RoleController');
});
