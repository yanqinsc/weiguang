<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        return view('Admin.DashboardIndex');
    }
}
