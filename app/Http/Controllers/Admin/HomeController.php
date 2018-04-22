<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index()
    {
        return view('admin.layouts.base', [
            'title' => '控制台',
            'user' => Auth::user()
        ]);
    }

    public function home()
    {
        return view('admin.home.index', [
            'title' => '控制台'
        ]);
    }
}
