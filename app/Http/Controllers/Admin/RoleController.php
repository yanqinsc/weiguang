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
     * 权限管理
     * @param WgAbility $ability
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(WgAbility $ability, Request $request)
    {
        $number = (int)$request->number ?: 10;
        $condition = $request->condition;
        $abilities = $ability->getAbilities($number, $condition);

        return view('admin.role.index', [
            'abilities' => $abilities,
            'title' => '角色管理',
            'paginate_number' => $number,
            'condition' => $request->condition ?: ''
        ]);
    }

    /**
     * 添加权限
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.role.create', [
            'title' => '添加角色'
        ]);
    }

    /**
     * 写入权限
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

        return redirect(route('role.index'));
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
     * 编辑权限页
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $result = WgAbility::find($id);

        return view('admin.role.edit', [
            'title' => '编辑权限',
            'info' => $result,
            'errorMsg' => $result ? null : '发生错误，指定的权限不存在！',
            'id' => $id
        ]);
    }

    /**
     * 保存编辑内容
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
            return redirect(route('role.index'));
        }else {
            return redirect()->back()->withErrors('更新失败,该权限可能已存在。');
        }
    }

    /**
     * 删除权限
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
     * 权限相关输入验证
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
     * 检查给定权限是否重名
     * @param $name
     * @return bool
     */
    private function isNameExist($name) {
        return WgAbility::where('name', $name)->first() ? true : false;
    }
}
