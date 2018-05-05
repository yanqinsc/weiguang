<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\WgAbility;
use App\Model\AbilityMeta;
use App\Model\Permissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class AbilityController extends Controller
{
    public function index(WgAbility $ability)
    {
        $abilities = $ability->leftJoin('ability_meta', 'id', '=', 'ability_id')
            ->select('id', 'name', 'title', 'icon', 'route_name', 'order', 'pid')
            ->where()
              ->get();

        return view('admin.ability.index', [
            'abilities' => $abilities,
            'title' => '权限管理'
        ]);
    }

    public function create(Request $request)
    {
        return view('admin.ability.create', [
            'title' => '添加权限',
            'pid' => (int)$request->id ?: null
        ]);
    }

    public function store(Request $request)
    {
        $this->inputValidate($request);

        DB::transaction(function () use ($request) {
            $ability = Bouncer::ability()->create([
                'name' => $request->name,
                'title' => $request->title
            ]);

            AbilityMeta::insert([
                'ability_id' => $ability->id,
                'pid' => $request->pid,
                'route_name' => $request->route,
                'icon' => $request->icon ?: '',
                'order' => $request->order,
                'is_menu' => $request->is_menu == 1 ? '' : null
            ]);
        });


        return redirect(route('ability.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $ability = WgAbility::find($id);
        $meta = AbilityMeta::where('ability_id', $id)->first();

        if (!$ability || !$meta) {
            return redirect()->back()->withErrors('该权限不存在，请重试。');
        }

        return view('admin.ability.edit', [
            'title' => '编辑权限',
            'ability' => $ability,
            'meta' => $meta,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $this->inputValidate($request);

        // If 'name' exists just update other info
        $data = [];
        if (!$this->doesNameExist($request->name)) {
            $ability['name'] = $request->name;
        } else {
            $condition['name'] = $request->name;
        }

        $data['pid'] = $request->pid;
        $data['icon'] = $request->icon ?: '';
        $data['order'] = $request->order;
        $data['is_menu'] = $request->is_menu == 1 ? '' : null;
        $ability['title'] = $request->title;
        $condition['id'] = $id;

        DB::transaction(function () use ($data, $request, $ability, $condition) {
            WgAbility::where($condition)->update($ability);
            AbilityMeta::where('ability_id', $condition['id'])->update($data);
        });
    }

    public function destroy($id)
    {
        $abilityId = (int)$id;
        $permissions = new Permissions();
        DB::transaction(function () use ($abilityId, $permissions) {
            $permissions->destroyById($abilityId);
            WgAbility::destroy($abilityId);
            AbilityMeta::destroyById($abilityId);
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
     * Whether the given name exists
     * @param $name
     * @return bool
     */
    private function doesNameExist($name)
    {
        return WgAbility::where('name', $name)->first() ? true : false;
    }
}
