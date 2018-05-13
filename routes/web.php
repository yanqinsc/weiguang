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

Route::prefix('home')->namespace('admin')->middleware('auth')->group(function () {
    Route::get('/', 'HomeController@index')->name('home');
    Route::get('/index', 'HomeController@home')->name('home.index');
    Route::get('ability/submenu', 'AbilityController@getSubAbility');
    Route::get('role/permissions', 'RoleController@permissions')->name('role.permissions');
    Route::resource('ability', 'AbilityController');
    Route::resource('article', 'ArticleController');
    Route::resource('role', 'RoleController');
});
