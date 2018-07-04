<?php

namespace App\Http\Controllers\Cms;

use Illuminate\Http\Request;
use App\Model\Article;

class ArticleController extends Controller
{
    public function index(Request $request, $id)
    {
        $article = Article::getArticle($id);

        $response = response()->view('cms.contents.article', [
            'article' => $article,
            'current_controller' => 'article'
        ]);

        if (empty($request->cookie('view_count'))) {
            $cookie = cookie('view_count', 1, 24*3600);
            Article::where('id', $id)->update(['view_count' => $article['view_count'] + 1]);
            $response->cookie($cookie);
        }

        return $response;
    }
}
