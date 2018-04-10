<?php

namespace App\Model\Cms;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
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
                ->select('articles.id', 'title', 'thumb', 'author', 'summary', 'views', 'created_at', 'c.name as category')
                ->orderBy('articles.id', 'desc')
                ->where('deleted', '=', '0')
                ->paginate($paginate_number);
        } else {
            // 展示其它分类文章
            return self::leftJoin('categories as c', 'category_id', '=', 'c.id')
                ->select('articles.id', 'title', 'thumb', 'author', 'summary', 'views', 'created_at', 'c.name as category')
                ->where([['category_id', '=', $category_id], ['deleted', '=', '0']])
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
            ->leftJoin('article_bodies as b', 'articles.id', '=', 'b.aid')
            ->where([['articles.id', '=', $id], ['deleted', '=', '0']])
            ->select('articles.id', 'title', 'thumb', 'author', 'summary', 'views', 'comments', 'body', 'created_at', 'c.abbreviation', 'c.name as category')
            ->first();
    }

    /**
     * 获取热门文章
     * @return mixed
     */

    public static function getHotList()
    {
        return self::select('id', 'title')
            ->orderBy('comments', 'desc')
            ->orderBy('views', 'desc')
            ->where('deleted', '=', '0')
            ->limit(6)
            ->get();
    }
}
