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
Route::post('get/register/code', 'Auth\RegisterController@mailRegisterCode')->name('getRegisterCode');
Auth::routes();

// 会员中心
Route::prefix('home')->namespace('Home')->middleware('auth')->group(function () {
    Route::get('/', 'HomeController@base')->name('home.base');
    Route::get('overview', 'HomeController@overview')->name('home.overview');
    Route::get('info', 'UserController@index')->name('home.user.info');
    Route::post('update', 'UserController@update')->name('home.user.update');
    Route::post('change/avatar', 'UserController@changeAvatar')->name('home.user.changeAvatar');
    Route::get('change/password', 'UserController@changePassword')->name('home.user.changePassword');
    Route::post('change/password', 'UserController@updatePassword')->name('home.user.updatePassword');
    Route::get('articles', 'ArticleController@index')->name('home.article.index');
    Route::get('comments', 'CommentController@index')->name('home.comment.index');
    Route::get('post', 'ArticleController@post')->name('home.article.post');
    Route::post('post', 'ArticleController@store')->name('home.article.store');
    Route::post('article/post/thumb/{type}', 'ArticleController@postThumb')->name('home.article.postThumb');
    Route::get('post/{id}/edit', 'ArticleController@edit')->name('home.article.edit');
    Route::put('post/{id}/edit', 'ArticleController@update')->name('home.article.update');
    Route::delete('post/{id}/destory', 'ArticleController@destroy')->name('home.article.destroy');

});

// 后台用户认证
Route::prefix('admin')->group(function () {
    Route::get('login', 'Admin\Auth\LoginController@showLoginForm')->name('admin.login');
    Route::post('login', 'Admin\Auth\LoginController@login');
    Route::post('logout', 'Admin\Auth\LoginController@logout')->name('admin.logout');
});

// 后台管理系统
Route::prefix('panel')->namespace('Admin')->middleware('auth:admin')->group(function () {
    Route::get('index', 'HomeController@home')->name('home.index');
    Route::get('/', 'HomeController@index')->name('home');
    Route::post('role/authorize', 'RoleController@roleAuthorize')->name('role.authorize');
    Route::post('role/set/menu', 'RoleController@setMenu')->name('role.set_menu');
    Route::get('role/permissions/{role}', 'RoleController@permissions')->name('role.permissions');
    Route::get('role/menu/{id}', 'RoleController@menu')->name('role.menu');
    Route::get('comments', 'CommentController@index')->name('comment.index');
    Route::delete('comment/{id}', 'CommentController@destroy')->name('comment.destroy');
    Route::post('comment/review/{id}', 'CommentController@review')->name('comment.review');
    Route::post('article/post/thumb/{type}', 'ArticleController@postThumb')->name('article.postThumb');
    // 管理员信息管理
    Route::get('info', 'AdminController@index')->name('admin.info');
    Route::post('update', 'AdminController@update')->name('admin.update');
    Route::post('change/avatar', 'AdminController@changeAvatar')->name('admin.changeAvatar');
    Route::get('change/password', 'AdminController@changePassword')->name('admin.changePassword');
    Route::post('change/password', 'AdminController@updatePassword')->name('admin.updatePassword');

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
