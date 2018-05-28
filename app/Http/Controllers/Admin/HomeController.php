<?php

namespace App\Http\Controllers\Admin;

use App\Model\Permissions;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(Permissions $permissions)
    {
        // 获取侧边栏菜单
        $authUser = Auth::user();
        $items = $permissions->from('permissions as p')
            ->leftJoin('abilities as a', 'a.id', '=', 'ability_id')
            ->select('a.id', 'a.pid', 'a.title', 'a.route_name', 'a.icon', 'a.is_menu')
            ->whereNotNull('a.is_menu')
            ->where(['p.entity_id' => $authUser->id, 'p.entity_type' => 'roles'])
            ->orderBy('a.order', 'desc')
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
