<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Article extends Model
{
    use SoftDeletes;
    /**
     * 查找某个分类下的所有文章
     * @param $category_id
     * @param $paginate_number
     * @return mixed
     */
    public static function getListByCategory($category_id, $paginate_number)
    {
        if ($category_id === 0) {
            // 首页展示所有分类最新文章
            return self::leftJoin('categories as c', 'category_id', '=', 'c.id')
                ->select('articles.id', 'title', 'comment_count', 'thumb', 'author_id', 'excerpt', 'view_count', 'created_at', 'c.name as category')
                ->orderBy('articles.id', 'desc')
                ->paginate($paginate_number);
        } else {
            // 展示其它分类文章
            return self::leftJoin('categories as c', 'category_id', '=', 'c.id')
                ->select('articles.id', 'title', 'comment_count', 'thumb', 'author_id', 'excerpt', 'view_count', 'created_at', 'c.name as category')
                ->where('category_id', '=', $category_id)
                ->orderBy('articles.id', 'desc')
                ->paginate($paginate_number);
        }
    }

    /**
     * 根据文章ID获取文章信息
     * @param $id
     * @return mixed
     */
    public static function getArticle($id)
    {
        return self::leftJoin('categories as c', 'category_id', '=', 'c.id')
            ->where('articles.id', '=', $id)
            ->select('articles.id', 'title', 'thumb', 'author_id', 'excerpt', 'view_count', 'comment_count', 'content', 'created_at', 'c.slug', 'c.name as category')
            ->first();
    }

    /**
     * 获取热门文章
     * @return mixed
     */

    public static function getHotList()
    {
        return self::select('id', 'title')
            ->orderBy('comment_count', 'desc')
            ->orderBy('view_count', 'desc')
            ->limit(6)
            ->get();
    }

    /**
     * 通过用户ID获取用户已发表文章
     * @param $uid
     */
    public static function getListByUid($uid)
    {
        self::select('id', 'title', 'author_id', 'thumb', 'excerpt')
            ->where('publisher_id', '=', $uid)
            ->get();
    }
}
