<?php

namespace App\Http\Controllers\Admin;

use App\Model\Menu;
use Illuminate\Http\Request;


class MenuController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:menu-list');
        $this->middleware('can:menu-create')->only(['create', 'store']);
        $this->middleware('can:menu-edit')->only(['edit', 'update']);
        $this->middleware('can:menu-destroy')->only('destroy');
    }

    public function index(Menu $menu)
    {
        $items = $menu->get()->toArray();
        $menu = [];

        // 归纳菜单
        foreach ($items as $key => $item) {
            if ($item['pid'] === 0) {
                $menu[$item['id']] = $item;
            } else {
                $menu[$item['pid']]['sub_menu'][] = $item;
            }
        }

        return view('admin.menu.index', [
            'menu' => $menu,
            'title' => '菜单管理'
        ]);
    }

    public function create(Request $request)
    {
        return view('admin.menu.create', [
            'title' => '添加菜单'
        ]);
    }

    public function store(Request $request, Menu $menu)
    {
        $request->validate([
            'title' => 'bail|required|max:50|alpha_num',
            'pid' => 'required|numeric|max:99',
            'order' => 'required|numeric|max:99',
            'icon' => 'required',
            'route_name' => 'required'
        ]);

        $menu->create([
            'pid' => $request->pid,
            'title' => $request->title,
            'order' => $request->order,
            'icon' => $request->icon,
            'route_name' => $request->route_name
        ]);

        return redirect(route('menu.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $menu = Menu::find($id);

        if (!$menu) {
            return redirect()->back()->withErrors('该菜单项不存在，请重试。');
        }

        return view('admin.menu.edit', [
            'title' => '编辑菜单',
            'menu' => $menu,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'max:50|alpha_num|nullable',
            'pid' => 'numeric|max:99|nullable',
            'order' => 'numeric|max:99|nullable'
        ]);

        $data = [
            'title' => $request->title,
            'pid' => $request->pid,
            'order' => $request->order,
            'icon' => $request->icon,
            'route_name' => $request->route_name
        ];

        $result = Menu::where('id', $id)->update( array_filter($data));

        if ($result) {
            return redirect(route('menu.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，该权限标识可能已存在。');
        }
    }

    public function destroy($id)
    {
        $result = Menu::where('id', (int)$id)->delete();

        if ($result) {
            return redirect()->back();
        } else {
            return redirect()->back()->withErrors('禁用失败，请重试。');
        }

    }
}
