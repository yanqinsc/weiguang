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

Route::get('/', 'Cms\ContentsController@index')->name('home');
Route::get('/contents/{category}', 'Cms\ContentsController@index')->name('contents/index');
Route::get('/article/{id}', 'Cms\ArticleController@index')->name('article/index');

