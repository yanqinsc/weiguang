<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\WgAbility;
use App\Model\Permissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AbilityController extends Controller
{
    public function index(WgAbility $ability)
    {
        $this->middleware('can:ability-list');
        $abilities = $ability->getAbilitiesByPid(0);

        return view('admin.ability.index', [
            'abilities' => $abilities,
            'title' => '权限管理'
        ]);
    }

    public function create(Request $request)
    {
        $this->middleware('can:ability-list,create-ability');

        return view('admin.ability.create', [
            'title' => '添加权限',
            'pid' => (int)$request->id ?: null
        ]);
    }

    public function store(Request $request)
    {
        $this->middleware('can:ability-list,create-ability');
        $this->inputValidate($request);

        if ($this->doesNameExist($request->name)) {
            redirect()->back()->withErrors('权限标识不能重复');
        }

        $now = date('Y-m-d H:i:s');
        Bouncer::ability()->insert([
            'name' => $request->name,
            'title' => $request->title,
            'pid' => $request->pid,
            'route_name' => $request->route,
            'icon' => $request->icon ?: '',
            'order' => $request->order,
            'is_menu' => $request->is_menu == 1 ? '' : null,
            'created_at' => $now,
            'updated_at' => $now
        ]);

        return redirect(route('ability.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $this->middleware('can:ability-list,edit-ability');
        $ability = WgAbility::find($id);

        if (!$ability) {
            return redirect()->back()->withErrors('该权限不存在，请重试。');
        }

        return view('admin.ability.edit', [
            'title' => '编辑权限',
            'ability' => $ability,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $this->middleware('can:ability-list,edit-ability');
        $this->inputValidate($request);

        $data = [];
        // If 'name' exists just update other info
        if (!$this->doesNameExist($request->name)) {
            $data['name'] = $request->name;
        } else {
            $condition['name'] = $request->name;
        }

        $data['pid'] = $request->pid;
        $data['icon'] = $request->icon ?: '';
        $data['order'] = $request->order;
        $data['is_menu'] = $request->is_menu == 1 ? '' : null;
        $data['title'] = $request->title;
        $condition['id'] = $id;

        $result = WgAbility::where($condition)->update($data);

        if ($result) {
            return redirect(route('ability.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，该权限标识可能已存在。');
        }
    }

    public function destroy($id)
    {
        $this->middleware('can:ability-list,destroy-ability');
        $abilityId = (int)$id;
        $permissions = new Permissions();
        DB::transaction(function () use ($abilityId, $permissions) {
            $permissions->destroyById($abilityId);
            WgAbility::destroy($abilityId);
        });
        return redirect()->back();
    }

    /**
     * Validate input data
     * @param $request
     */
    private function inputValidate($request)
    {
        $request->validate([
            'name' => [
                'bail', 'required',
                'max:150',
                'regex:"^[-_0-9a-z]{6,16}$"'
            ],
            'title' => 'max:255',
            'pid' => 'required|integer',
            'is_menu' => 'required|digits_between:0,1',
            'route' => 'required',
        ]);
    }

    /**
     * 检查权限名称是否重复
     * @param $name
     * @return bool
     */
    private function doesNameExist($name)
    {
        return WgAbility::where('name', $name)->exists();
    }

    /**
     * 权限管理页面获取下级权限列表
     * @param WgAbility $ability
     * @param Request $request
     * @return mixed
     */
    public function getSubAbility(WgAbility $ability, Request $request)
    {
        if ($request->ajax()) {
            $request->validate(['pid' => 'required|integer|min:1']);
            return $ability->getAbilitiesByPid($request->pid);
        }
    }
}
