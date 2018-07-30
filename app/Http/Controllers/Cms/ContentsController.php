<?php

namespace App\Http\Controllers\Cms;

use App\Model\Article;
use App\Model\Category;
use Illuminate\Http\Request;

class ContentsController extends Controller
{
    /**
     * 列表页
     * @param string $slug
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index($slug = 'home', Request $request)
    {
        // 读取文章信息
        if ($slug == 'home') {
            $category = (object)['id' => 0, 'name' => '首页', 'slug' => 'home', 'desc' => config('app.description')];
        } else {
            $category = Category::getInfoBySlug($slug, ['id', 'name', 'slug', 'desc']);
        }

        // 关键词检索
        if ($request->key_words) {
            $key_words = '%' . $request->key_words . '%';
            $contents = Article::where('title', 'like', $key_words)
                ->where('type', '=', 1)
                ->orWhere('author', 'like', $key_words)
                ->orWhere('key_words', 'like', $key_words)
                ->paginate(5);
        } else {
            $contents = Article::getListByCategory($category->id, 10);
        }

        return view('cms.contents.index', [
            'current_controller' => 'contents',
            'active_nav_item' => $slug,
            'category' => $category,
            'contents' => $contents,
            'key_words' => $request->key_words ?? null,
            'search_count' => $contents->count() ?? null
        ]);
    }

    public function aboutUs()
    {
        return view('cms.contents.aboutus', [
            'current_controller' => 'aboutus'
        ]);
    }
}
