<?php

namespace App\Http\Controllers\Home;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\Controller;


class HomeController extends Controller
{
    public function base()
    {
        return view('home.layouts.base', [
            'title' => '会员中心',
            'user' => Auth::user()
        ]);
    }

    public function overview()
    {
        return view('home.index', [
            'title' => '概览'
        ]);
    }

    public function info()
    {
        return view('home.info', [
            'title' => '基本资料',
            'info' => Auth::user()
        ]);
    }

    public function updateInfo($request)
    {
        if ($request->ajax()) {
            $data =$request->all();
            return $data;
        }
    }
}
