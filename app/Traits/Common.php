<?php
/**
 * Created by PhpStorm.
 * User: YamTsin
 * Date: 2018/6/24
 * Time: 11:34
 */

namespace App\Traits;

use Illuminate\Support\Facades\Auth;

trait Common
{
    private function postImage($base64Image, $relative_path, $image_name, $query = null, $filed = 'avatar')
    {
        //匹配出图片的格式
        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64Image, $result)) {
            $type = $result[2];
            $path = public_path() . '/' . $relative_path;
            if (!file_exists($path)) {
                //检查是否有该文件夹，如果没有就创建，并给予最高权限
                mkdir($path, 0777);
            }

            $file_name = $image_name . ".{$type}";
            $new_file = $path . $file_name;

            if (file_exists($new_file)) {
                unlink($new_file);
            }

            if (file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64Image)))) {
                $avatar_url = asset('/' . $relative_path . $file_name);
                $result = true;
                if ($query) {
                    $result = $query->update([$filed => $avatar_url]);
                }

                return $result ? ['status' => 200, 'avatarUrl' => $avatar_url, 'fileName' => $file_name]
                    : ['status' => 500, 'message' => '图片上传成功，数据库保存地址错误。'];
            } else {
                return ['status' => 501, 'message' => '无法保存图片。'];
            }
        } else {
            return ['status' => 502, 'message' => '无法确定图片类型。'];
        }
    }
}