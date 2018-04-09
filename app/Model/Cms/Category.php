<?php

namespace App\Model\Cms;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public $timestamps = false;

    /**
     * 获取全部分类信息
     * @return mixed
     */
    public static function getAll()
    {
        return self::where('is_nav', '=', '1')->get();
    }

    /**
     * 通过简称获取分类信息
     * @param $abbreviation
     * @param null $field
     * @return mixed
     */
    public static function getInfoByAbbreviation($abbreviation, array $field = [])
    {
        if (empty($field)) {
            return self::where('abbreviation', '=', $abbreviation)->first();
        } else {
            return self::where('abbreviation', '=', $abbreviation)->select($field)->first();
        }

    }
}
