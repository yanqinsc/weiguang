<?php

namespace App\Http\Controllers\Admin;


use Bouncer;
use App\Model\WgAbility;
use App\Model\Permissions;
use App\Model\AssignedRoles;
use Illuminate\Http\Request;
use Silber\Bouncer\Database\Role;
use Illuminate\Support\Facades\DB;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:role-list');
        $this->middleware('can:role-create')->only(['create', 'store']);
        $this->middleware('can:role-edit')->only(['edit', 'update']);
        $this->middleware('can:role-destroy')->only('destroy');
        $this->middleware('can:role-permissions')->only(['permissions', 'roleAuthorize']);
    }

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
        $role = new Role();
        $result = $role->find($id);

        if (!$result) {
            return redirect()->back()->withErrors('该角色不存在，请重试。');
        }

        return view('admin.role.edit', [
            'title' => '编辑角色',
            'role' => $result,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $this->inputValidate($request);
        $role = new Role();

        $data = [];
        // If 'name' exists just update other info
        if (!$this->doesNameExist($role, $request->name)) {
            $data['name'] = $request->name;
        } else {
            $condition['name'] = $request->name;
        }

        $data['title'] = $request->title;
        $condition['id'] = $id;

        $result = $role->where($condition)->update($data);
        if ($result) {
            return redirect(route('role.index'));
        } else {
            return redirect()->back()->withErrors('更新错误，该角色标识可能已存在');
        }

    }

    public function destroy($id)
    {
        $roleId = (int)$id;
        $role = new Role();
        $assignedRoles = new AssignedRoles();
        DB::transaction(function () use ($roleId, $assignedRoles, $role) {
            $assignedRoles->destroyByRoleId($roleId);
            $role->destroy($roleId);
        });
        return redirect()->back();
    }

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
     * 检查角色名称是否存在
     * @param Role $role
     * @param $name
     * @return mixed
     */
    private function doesNameExist(Role $role, $name)
    {
        return $role->where('name', $name)->exists();
    }

    /**
     * 角色权限分配页面
     * @param WgAbility $ability
     * @param Permissions $permissions
     * @param Role $roleModel
     * @param $role
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function permissions(WgAbility $ability, Permissions $permissions, Role $roleModel, $role)
    {
        $role = $roleModel->where('name', '=', $role)->first();
        $abilities = $ability->all();
        $had = $permissions->where('entity_id', '=', $role->id)->get();

        foreach ($abilities as &$ability) {
            foreach ($had as $value) {
                if ($ability->id === $value->ability_id) {
                    $ability->checked = 1;
                    continue;
                }
            }
        }

        $abilities = $this->accessMerge($abilities);

        return view('admin.role.permissions', [
            'abilities' => $abilities,
            'roleName' => $role->name,
            'had' => $had,
            'title' => '权限分配-' . $role->title
        ]);
    }

    /**
     * 处理权限的层级关系
     * @param $abilities
     * @param int $pid
     * @return array
     */
    private function accessMerge($abilities, $pid = 0)
    {
        $result = [];
        foreach ($abilities as $ability) {
            if ($ability['pid'] == $pid) {
                $ability['children'] = $this->accessMerge($abilities, $ability['id']);
                $result[] = $ability;
            }
        }
        return $result;
    }

    /**
     * 授权
     * @param Request $request
     */
    public function roleAuthorize(Request $request)
    {
        if ($request->ajax()) {
            $role = $request->role;
            $ability = $request->ability;
            if ($request->allow === 'true') {
                Bouncer::allow($role)->to($ability);
            } else {
                Bouncer::disallow($role)->to($ability);
            }
        }
        Bouncer::refresh();
    }
}
