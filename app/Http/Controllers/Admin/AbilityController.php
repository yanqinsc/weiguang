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
    /**
     * Ability list
     * @param WgAbility $ability
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(WgAbility $ability, Request $request)
    {
        $number = (int)$request->number ?: 10;
        $condition = $request->condition;
        $abilities = $ability->getAbilities($number, $condition);

        return view('admin.ability.index', [
            'abilities' => $abilities,
            'title' => '权限管理',
            'paginate_number' => $number,
            'condition' => $request->condition ?: ''
        ]);
    }

    /**
     * Add ability
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.ability.create', [
            'title' => '添加权限'
        ]);
    }

    /**
     * Save ability
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
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

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Edit ability
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $ability = WgAbility::find($id);
        $meta = AbilityMeta::where('ability_id', '=', $id)->first();

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

    /**
     * Update ability
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
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
        $data['icon'] = $request->icon;
        $data['order'] = $request->order;
        $data['is_menu'] = $request->is_menu == 1 ? '' : null;
        $ability['title'] = $request->title;
        $condition['id'] = $id;

        DB::beginTransaction();

        $resA = WgAbility::where($condition)->update($ability);
        $resB = AbilityMeta::where('ability_id', '=', $id)->update($data);

        if ($resA && $resB) {
            DB::commit();
            return redirect(route('ability.index'));
        } else {
            DB::rollBack();
            return redirect()->back()->withErrors('更新失败,该权限可能已存在。');
        }
    }

    /**
     * Delete ability
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $abilityId = (int)$id;
        $permissions = new Permissions();
        DB::transaction(function () use ($abilityId, $permissions) {
            $permissions->destroyAbilityById($abilityId);
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
     * Whether the given name exists
     * @param $name
     * @return bool
     */
    private function doesNameExist($name)
    {
        return WgAbility::where('name', $name)->first() ? true : false;
    }
}
