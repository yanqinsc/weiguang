<?php

namespace App\Http\Controllers\Cms;

use Illuminate\Http\Request;
use App\Model\Cms\Article;

class ArticleController extends Controller
{
    /**
     * 内容页
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function index(Request $request, $id)
    {
        $article = Article::getArticle($id);

        return view('cms.contents.article', [
            'article' => $article,
            'current_controller' => 'article'
        ]);
    }
}
