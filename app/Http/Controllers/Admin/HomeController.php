<?php

namespace App\Http\Controllers\Admin;

use App\Model\Admin;
use App\Model\AssignedRoles;
use Bouncer;
use App\Model\Menu;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(Menu $menu, AssignedRoles $assignedRoles)
    {
        // 获取侧边栏菜单
        $authUser = Auth::user();

        $role = $assignedRoles->where('entity_id', $authUser->id)->first();

        $items = $menu->leftJoin('menus_roles', 'menu_id', 'id')
            ->orderBy('order', 'desc')
            ->where('role_id' , $role->role_id)
            ->whereNull('disable')
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
            'user' => $authUser
        ]);
    }

    public function home()
    {
        return view('admin.home.index', [
            'title' => '控制台'
        ]);
    }
}
