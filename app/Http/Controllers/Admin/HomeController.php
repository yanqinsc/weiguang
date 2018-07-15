<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\User;
use App\Model\Menu;
use App\Model\Article;
use App\Model\Comment;
use App\Model\AssignedRoles;
use Illuminate\Support\Facades\DB;
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
        $users = User::select(DB::raw('count(*) as count'))->first();
        $articles = Article::select(DB::raw('count(*) as count'))->first();
        $comments = Comment::select(DB::raw('count(*) as count'))->first();
        return view('admin.home.index', [
            'user_count' => $users->count,
            'article_count' => $articles->count,
            'comment_count' => $comments->count,
            'title' => '控制台'
        ]);
    }
}
