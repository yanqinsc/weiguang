<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Admin\Controller;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index()
    {
        return view('member.layouts.base', [
            'title' => '会员中心',
            'user' => Auth::user()
        ]);
    }

    public function home()
    {
        return view('member.home.index', [
            'title' => '控制台'
        ]);
    }
}
