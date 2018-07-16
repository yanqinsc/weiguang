<?php

namespace App\Http\Controllers\Home;

use App\Model\User;
use App\Traits\Common;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\Controller;


class UserController extends Controller
{
    use Common;

    public function index()
    {
        return view('home.user.info', [
            'title' => '基本资料',
            'info' => Auth::user()
        ]);
    }

    public function update(Request $request)
    {
        if ($request->ajax()) {
            $request->validate([
                'key' => 'required',
                'value' => 'required'
            ]);

            if ($request->key == 'phone' || $request->key == 'qq') {
                if (!ctype_digit($request->value)) {
                    return ['status' => 450, 'message' => '手机号码只能是数字。'];
                }
            }

            if ($request->key == 'phone' && (strlen($request->value) < 11 || strlen($request->value) > 15)) {
                return ['status' => 450, 'message' => '手机号码不正确。'];
            }

            $data = [$request->key => $request->value];
            User::where('id', Auth::user()->id)->update($data);
            return ['status' => 200, 'name'=>$request->key, 'val' => $request->value];
        }
    }

    public function changePassword()
    {
        return view('home.user.change_password', [
            'title' => '修改密码'
        ]);
    }

    public function updatePassword(Request $request)
    {
        $request->validate(['new_password' => 'required|confirmed']);
        $new_password = bcrypt($request->new_password);
        $check = Auth::guard()->attempt(['name' => Auth::user()->name, 'password' => $request->password]);

        if ($check) {
            User::where('id', Auth::user()->id)->update(['password'=> $new_password]);
            return redirect()->back()->with('message','修改成功!');
        } else {
            return redirect()->back()->withErrors('原密码错误');
        }
    }

    public function changeAvatar(Request $reqquest)
    {
        if ($reqquest->ajax()) {
            $base64Image = $reqquest->imgData;
            $path = "uploads/avatars/users/";
            $query = User::where('id', Auth::user()->id);
            return $this->postImage($base64Image, $path, Auth::user()->id, $query);
        } else {
            return ['status' => 502, 'message' => '图片类型错误。'];
        }
    }
}
