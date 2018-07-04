<?php

namespace App\Http\Controllers\Cms;

use App\Model\Article;
use App\Model\Category;
use Illuminate\Http\Request;

class ContentsController extends Controller
{
    /**
     * 列表页
     * @param string $category
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index($category = 'home')
    {
        // 读取文章信息
        if ($category == 'home') {
            $categoryInfo = (object)['id' => 0, 'name' => '首页'];
        } else {
            $categoryInfo = Category::getInfoBySlug($category, ['id', 'name']);
        }

        return view('cms.contents.index', [
            'current_controller' => 'contents',
            'active_nav_item' => $category,
            'active_nav_name' => $categoryInfo->name,
            'contents' => Article::getListByCategory($categoryInfo->id, 10)
        ]);
    }
}
