<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public $timestamps = false;

    protected $fillable = ['name', 'slug', 'is_nav', 'desc'];

    public static function getAll()
    {
        return self::whereNotNull('is_nav')->orderBy('order', 'desc')->get();
    }

    public static function getInfoBySlug($slug, array $field = [])
    {
        if (empty($field)) {
            return self::where('slug', '=', $slug)->first();
        } else {
            return self::where('slug', '=', $slug)->select($field)->first();
        }

    }

    public function hasArticles()
    {
        return $this->hasMany('App\Model\Article', 'category_id', 'id');
    }
}
