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

// CMS
Route::namespace('Cms')->group(function () {
    Route::get('/', 'ContentsController@index')->name('index');
    Route::get('/contents/{category}', 'ContentsController@index')->name('contents');
    Route::get('/article/{id}', 'ArticleController@index')->name('article');
    Route::post('/article/createComment', 'ArticleController@createComment')->name('comment.create');
});

// Auth
Route::post('getRegisterCode', 'Auth\RegisterController@mailRegisterCode')->name('getRegisterCode');
Auth::routes();

// 会员中心
Route::prefix('home')->namespace('home')->middleware('auth')->group(function () {
    Route::get('/', 'HomeController@base')->name('home.base');
    Route::get('overview', 'HomeController@overview')->name('home.overview');
    Route::get('info', 'UserController@index')->name('home.user.info');
    Route::post('update', 'UserController@update')->name('home.user.update');
    Route::post('changeAvatar', 'UserController@changeAvatar')->name('home.user.changeAvatar');
    Route::get('changePassword', 'UserController@changePassword')->name('home.user.changePassword');
    Route::post('changePassword', 'UserController@updatePassword')->name('home.user.updatePassword');
    Route::get('articles', 'ArticleController@index')->name('home.article.index');
    Route::get('comment', 'CommentController@index')->name('home.comment.index');
});

// 后台用户认证
Route::prefix('admin')->group(function () {
    Route::get('login', 'Admin\Auth\LoginController@showLoginForm')->name('admin.login');
    Route::post('login', 'Admin\Auth\LoginController@login');
    Route::post('logout', 'Admin\Auth\LoginController@logout')->name('admin.logout');
});

// 后台管理系统
Route::prefix('panel')->namespace('admin')->middleware('auth:admin')->group(function () {
    Route::get('index', 'HomeController@home')->name('home.index');
    Route::get('/', 'HomeController@index')->name('home');
    Route::post('role/authorize', 'RoleController@roleAuthorize')->name('role.authorize');
    Route::post('role/setMenu', 'RoleController@setMenu')->name('role.set_menu');
    Route::get('role/permissions/{role}', 'RoleController@permissions')->name('role.permissions');
    Route::get('role/menu/{id}', 'RoleController@menu')->name('role.menu');
    Route::get('comments', 'CommentController@index')->name('comment.index');
    Route::delete('comment/{id}', 'CommentController@destroy')->name('comment.destroy');
    Route::post('commentReview/{id}', 'CommentController@destroy')->name('comment.review');

    Route::resource('ability', 'AbilityController');
    Route::resource('article', 'ArticleController');
    Route::resource('role', 'RoleController');
    Route::resource('admins', 'AdminsController');
    Route::resource('menu', 'MenuController');
    Route::resource('user', 'UserController');
    Route::resource('school', 'SchoolController');
    Route::resource('class', 'ClassController');
    Route::resource('category', 'CategoryController');
});
