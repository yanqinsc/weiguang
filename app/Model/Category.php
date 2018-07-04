<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public $timestamps = false;

    public static function getAll()
    {
        return self::where('is_nav', '=', '1')->get();
    }

    public static function getInfoBySlug($slug, array $field = [])
    {
        if (empty($field)) {
            return self::where('slug', '=', $slug)->first();
        } else {
            return self::where('slug', '=', $slug)->select($field)->first();
        }

    }
}
