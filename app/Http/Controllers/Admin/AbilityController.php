<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\WgAbility;
use Illuminate\Http\Request;

class AbilityController extends Controller
{
    /**
     * Display all abilities.
     *
     * @param WgAbility $ability
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(WgAbility $ability, Request $request)
    {
        $number = (int)$request->showNumber ?: 10;
        $condition = $request->condition;
        $abilities = $ability->getAbilities($number, $condition);

        return view('admin.ability.index', [
            'abilities' => $abilities,
            'title' => '权限管理',
            'paginateNumber' => $number,
            'condition' => $request->condition ?: '',
            'sub_page' => route('ability.index')
        ]);
    }

    /**
     * Show the form for creating a new ability.
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
     * Store a newly created ability in storage.
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
     * Show the form for editing the specified resource.
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->inputValidate($request);

        // 如果name存在则只更新title
        $data = [];
        if (!$this->isNameExist($request->name)) {
            $data['name'] = $request->name;
        } else {
            $condition['name'] = $request->name;
        }

        $data['title'] = $request->title;
        $condition['id'] = $id;


        if (WgAbility::where($condition)->update($data)) {
            return redirect(route('ability.index'));
        }else {
            return redirect()->back()->withInput()->withErrors('更新失败,该权限可能已存在。');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

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

    private function isNameExist($name) {
        return WgAbility::where('name', $name)->first() ? true : false;
    }
}
