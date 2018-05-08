<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\Permissions;
use Illuminate\Http\Request;
use Silber\Bouncer\Database\Role;
use Illuminate\Support\Facades\DB;


class RoleController extends Controller
{
    public function index(Role $role)
    {
        $roles = $role->select('id', 'name', 'title')->orderBy('id')->get();

        return view('admin.role.index', [
            'roles' => $roles,
            'title' => '角色管理'
        ]);
    }

    public function create()
    {
        return view('admin.role.create', [
            'title' => '添加角色'
        ]);
    }

    public function store(Role $role, Request $request)
    {
        $this->inputValidate($request);
        if ($this->doesNameExist($role, $request->name)) {
            return redirect()->back()->withErrors('角色标识不能重复');
        }

        Bouncer::role()->create([
            'name' => $request->name,
            'title' => $request->title
        ]);

        return redirect(route('role.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $role = Wgrole::find($id);

        if (!$role) {
            return redirect()->back()->withErrors('该角色不存在，请重试。');
        }

        return view('admin.role.edit', [
            'title' => '编辑角色',
            'role' => $role,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
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

        Wgrole::where($condition)->update($data);

        return redirect(route('role.index'));
    }

    public function destroy($id)
    {
        $roleId = (int)$id;
        $permissions = new Permissions();
        DB::transaction(function () use ($roleId, $permissions) {
            $permissions->destroyById($roleId);
            Wgrole::destroy($roleId);
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
                'regex:"^[-_0-9a-z]{3,16}$"'
            ],
            'title' => 'max:255'
        ]);
    }

    /**
     * Whether the given name exists
     * @param Role $role
     * @param $name
     * @return mixed
     */
    private function doesNameExist(Role $role, $name)
    {
        return $role->where('name', $name)->exists();
    }
}
