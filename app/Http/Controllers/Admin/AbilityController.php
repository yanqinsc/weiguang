<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use Silber\Bouncer\Database\Ability;
use App\Model\Permissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AbilityController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:ability-list');
        $this->middleware('can:ability-create')->only(['create', 'store']);
        $this->middleware('can:ability-edit')->only(['edit', 'update']);
        $this->middleware('can:ability-destroy')->only('destroy');
    }

    public function index(Ability $ability)
    {
        $abilities = $ability->get();

        return view('admin.ability.index', [
            'abilities' => $abilities,
            'title' => '权限管理'
        ]);
    }

    public function create(Request $request)
    {
        return view('admin.ability.create', [
            'title' => '添加权限'
        ]);
    }

    public function store(Request $request)
    {
        $this->inputValidate($request);

        if ($this->doesNameExist($request->name)) {
            redirect()->back()->withErrors('权限标识不能重复');
        }

        Bouncer::ability()->create([
            'name' => $request->name,
            'title' => $request->title
        ]);

        return redirect(route('ability.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $ability = Ability::find($id);

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
        $this->inputValidate($request);

        $data = [];

        if (!$this->doesNameExist($request->name)) {
            $data['name'] = $request->name;
        } else {
            $condition['name'] = $request->name;
        }

        $data['title'] = $request->title;
        $condition['id'] = $id;

        $result = Ability::where($condition)->update($data);

        if ($result) {
            return redirect(route('ability.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，该权限标识可能已存在。');
        }
    }

    public function destroy($id)
    {
        $abilityId = (int)$id;
        $permissions = new Permissions();
        DB::transaction(function () use ($abilityId, $permissions) {
            $permissions->destroyById($abilityId);
            Ability::destroy($abilityId);
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
            'title' => 'max:255'
        ]);
    }

    /**
     * 检查权限名称是否重复
     * @param $name
     * @return bool
     */
    private function doesNameExist($name)
    {
        return Ability::where('name', $name)->exists();
    }
}
