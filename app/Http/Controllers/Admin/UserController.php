<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\Admin;
use Illuminate\Http\Request;
use Silber\Bouncer\Database\Role;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:admin-list');
        $this->middleware('can:admin-create')->only(['create', 'store']);
        $this->middleware('can:admin-edit')->only(['edit', 'update']);
        $this->middleware('can:admin-forbiden')->only('destroy');
    }

    public function index(Admin $admin)
    {
        $users = Admin::select(
            'admins.id', 'admins.name', 'roles.name as role', 'nickname',
            'real_name', 'email', 'phone', 'address', 'avatar', 'motto'
        )
            ->leftJoin('assigned_roles', 'entity_id', 'id')
            ->leftJoin('roles', 'role_id', 'roles.id')
            ->get();

         return view('admin.user.index', [
            'users' => $users,
            'title' => '管理员'
        ]);
    }

    public function create()
    {
        return view('admin.user.create', [
            'title' => '添加管理员'
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => [
                'required',
                'max:150',
                'unique:admins',
                'regex:"^[0-9a-z]{6,16}$"'
            ],
            'password' => [
                'required',
                'max:150',
                'regex:"^[0-9a-z]{6,16}$"'
            ],
            'email' => 'required|email|unique:admins',
            'nickname' => 'required|max:50|unique:admins',
            'real_name' => 'required|max:20',
            'phone' => 'regex:"^[0-9]{11,15}$"'
        ]);

        Admin::create([
            'name' => $request->name,
            'password' => bcrypt($request->password),
            'nickname' => $request->nickname,
            'real_name' => $request->real_name,
            'email' => $request->email,
            'phone' => $request->phone
        ]);

        return redirect(route('admins.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $user = Admin::select(
            'admins.id', 'admins.name', 'roles.name as role', 'nickname',
            'real_name', 'email', 'phone', 'address', 'avatar', 'motto'
        )
            ->leftJoin('assigned_roles', 'entity_id', 'id')
            ->leftJoin('roles', 'role_id', 'roles.id')
            ->find($id);

        if (!$user) {
            return redirect()->back()->withErrors('用户不存在，请重试。');
        }

        return view('admin.user.edit', [
            'title' => '编辑管理员信息',
            'user' => $user,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'real_name' => 'max:20|nullable',
            'phone' => [
                'nullable',
                'regex:"^[0-9]{11,15}$"'
            ],
            'password' => [
                'max:150',
                'regex:"^[0-9a-z]{6,16}$"',
                'nullable'
            ],
            'email' => 'email|unique:admins|nullable',
            'nickname' => 'max:50|unique:admins|nullable',
            'role' => 'alpha|max:10|nullable'
        ]);

        $data = array_filter([
            'email' => $request->email,
            'password' => $request->password,
            'nickname' => $request->nickname,
            'real_name' => $request->real_name,
            'phone' => $request->phone,
            'avatar' => $request->avatar,
            'address' => $request->address,
            'motto' => $request->motto
        ]);

        $user = Admin::where(['id' => (int)$id])->first();
        $result = $user->update($data);

        if ($request->role) {
            if (Role::where('name', $request->role)->exists()) {
                Bouncer::assign($request->role)->to($user);
            } else {
                return redirect()->back()->withErrors('角色名错误。');
            }
        }

        if ($result) {
            return redirect(route('admins.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，请重试。');
        }
    }

    public function destroy($id)
    {
        Admin::where('id', (int)$id)->delete();
        return redirect()->back();
    }
}
