<?php

namespace App\Http\Controllers\Admin;

use App\Model\WgAbility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(WgAbility $ability)
    {
        // 获取侧边栏菜单
        $items = $ability->select('id', 'pid', 'title', 'route_name', 'icon', 'is_menu')
            ->whereNotNull('is_menu')
            ->orderBy('order', 'desc')
            ->get()
            ->toArray();

        $menu = [];
        // 获取一级菜单
        foreach ($items as $key => $item) {
            if ($item['pid'] === 0) {
                $menu[$item['id']] = $item;
            }
        }
        // 归纳二级菜单
        foreach ($items as $key => $item) {
            if ($item['pid'] === 0) {
                continue;
            } else {
                $menu[$item['pid']]['sub_menu'][] = $item;
            }
        }

        return view('admin.layouts.base', [
            'title' => '控制台',
            'menu' => $menu,
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
