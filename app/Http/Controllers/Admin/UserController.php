<?php

namespace App\Http\Controllers\Admin;

use Bouncer;
use App\Model\User;
use App\Traits\Common;
use Illuminate\Http\Request;

class UserController extends Controller
{
    use Common;

    public function __construct()
    {
        $this->middleware('can:user-list');
        $this->middleware('can:user-create')->only(['create', 'store']);
        $this->middleware('can:user-edit')->only(['edit', 'update']);
        $this->middleware('can:user-forbiden')->only('destroy');
    }

    public function index()
    {
        $users = User::select('users.id', 'users.name', 'nickname', 'real_name', 'team_id', 'email', 'avatar', 'users.address', 'motto')
            ->leftJoin('teams', 'team_id', '=', 'teams.id')
            ->paginate(20);

        return view('admin.user.index', [
            'users' => $users,
            'title' => '用户列表'
        ]);
    }

    public function create()
    {
        return view('admin.user.create', [
            'title' => '添加用户'
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
                'max:50',
            ],
            'email' => 'required|email|unique:admins',
            'phone' => 'regex:"^[0-9]{11,15}$"'
        ]);

        User::insert([
            'name' => $request->name,
            'password' => bcrypt($request->password),
            'nickname' => 'wg' . str_random(8),
            'email' => $request->email,
            'phone' => $request->phone
        ]);

        return redirect(route('user.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $user = User::find($id);
        if (!$user) {
            return redirect()->back()->withErrors('用户不存在，请重试。');
        }

        return view('admin.user.edit', [
            'title' => '编辑用户信息',
            'user' => $user,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'phone' => [
                'nullable',
                'regex:"^[0-9]{11,15}$"'
            ],
            'email' => 'email|unique:admins|nullable',
            'nickname' => 'max:50|unique:admins|nullable',
            'role' => 'alpha|max:10|nullable'
        ]);

        $data = array_filter([
            'email' => $request->email,
            'nickname' => $request->nickname,
            'phone' => $request->phone,
            'avatar' => $request->avatar,
            'address' => $request->address,
            'motto' => $request->motto,
            'qq' => $request->qq

        ]);

        $result = User::where(['id' => (int)$id])->update($data);

        if ($result) {
            return redirect(route('user.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，请重试。');
        }
    }

    public function destroy($id)
    {
        User::where('id', (int)$id)->delete();
        return redirect()->back();
    }
}
