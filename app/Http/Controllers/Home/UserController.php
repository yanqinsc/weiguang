<?php

namespace App\Http\Controllers\Home;

use App\Model\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\Controller;


class UserController extends Controller
{
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
            $path = public_path() . "/uploads/avatars/";
            //匹配出图片的格式
            if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64Image, $result)) {
                $type = $result[2];

                if (!file_exists($path)) {
                    //检查是否有该文件夹，如果没有就创建，并给予最高权限
                    mkdir($path, 0777);
                }

                $file_name = Auth::user()->id . ".{$type}";
                $new_file = $path . $file_name;

                if (file_exists($new_file)) {
                    unlink($new_file);
                }

                if (file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64Image)))) {
                    $avatar_url = asset('/uploads/avatars/' . $file_name);
                    $result = User::where('id', Auth::user()->id)->update(['avatar' => $avatar_url]);

                    if ($result) {
                        return ['status' => 200, 'avatarUrl' => $avatar_url];
                    } else {
                        return ['status' => 500, 'message' => '无法保存图片。'];
                    }

                } else {
                    return ['status' => 501, 'message' => '无法保存图片。'];
                }
            } else {
                return ['status' => 502, 'message' => '无法确定图片类型。'];
            }
        } else {
            return ['status' => 502, 'message' => '图片类型错误。'];
        }
    }
}
