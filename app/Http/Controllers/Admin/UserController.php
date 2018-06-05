<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\Admin;
use App\Model\Permissions;
use DeepCopy\f001\A;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $users = $admin->get();

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
        $user = Admin::find($id);

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
            'real_name' => 'max:20',
            'phone' => 'regex:"^[0-9]{11,15}$"'
        ]);

        $data = [
            'real_name' => $request->real_name,
            'phone' => $request->phone,
            'avatar' => $request->avatar,
            'address' => $request->address ?: '',
            'motto' => $request->motto
        ];

        if ($request->password) {
            $request->validate([
                'password' => [
                    'max:150',
                    'regex:"^[0-9a-z]{6,16}$"'
                ]
            ]);
            $data['password'] = bcrypt($request->password);
        }

        if ($request->email) {
            $request->validate([
                'email' => 'email'
            ]);
            $data['email'] = $request->email;
        }

        if ($request->nickname) {
            $request->validate([
                'nickname' => 'max:50|unique:admins'
            ]);
            $data['nickname'] = $request->nickname;
        }

        $result = Admin::where(['id' => (int)$id])->update($data);

        if ($result) {
            return redirect(route('admins.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，请重试。');
        }
    }

    public function destroy($id)
    {
        $abilityId = (int)$id;
        $permissions = new Permissions();
        DB::transaction(function () use ($abilityId, $permissions) {
            $permissions->destroyById($abilityId);
            WgAbility::destroy($abilityId);
        });
        return redirect()->back();
    }
}
