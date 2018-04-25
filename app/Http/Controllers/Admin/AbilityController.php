<?php

namespace App\Http\Controllers\Admin;

use App\Model\Permissions;
use Bouncer;
use App\Model\WgAbility;
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

        Bouncer::ability()->create([
            'name' => $request->name,
            'title' => $request->title
        ]);

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
        $result = WgAbility::find($id);

        return view('admin.ability.edit', [
            'title' => '编辑权限',
            'info' => $result,
            'errorMsg' => $result ? null : '发生错误，指定的权限不存在！',
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
            $data['name'] = $request->name;
        } else {
            $condition['name'] = $request->name;
        }

        $data['title'] = $request->title;
        $data['pid'] = $request->pid;
        $data['icon'] = $request->icon;
        $data['order'] = $request->order;
        $data['is_menu'] = $request->is_menu;
        $condition['id'] = $id;

        if (WgAbility::where($condition)->update($data)) {
            return redirect(route('ability.index'));
        }else {
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
        $abilityId = (int) $id;
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
    private function inputValidate($request) {
        $request->validate([
            'name' => [
                'bail', 'required',
                'max:150',
                'regex:"^[-_0-9a-z]{6,16}$"'
            ],
            'title' => 'max:255',
        ]);
    }

    /**
     * Whether the given name exists
     * @param $name
     * @return bool
     */
    private function doesNameExist($name) {
        return WgAbility::where('name', $name)->first() ? true : false;
    }
}
