<?php

namespace App\Http\Controllers\Home;

use App\Model\Article;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\Controller;

class ArticleController extends Controller
{
    public function index(Request $request)
    {
        $number = (int)$request->number ?: 10;
        $query = Article::leftJoin('categories as c', 'category_id', '=', 'c.id')
            ->leftJoin('admins as a', 'publisher_id', '=', 'a.id')
            ->select('articles.id', 'title', 'author', 'comment_count', 'author', 'a.name as publisher', 'excerpt', 'view_count',
                'articles.created_at', 'c.id as category_id', 'c.name as category')
            ->where('articles.author_id', Auth::user()->id)
            ->orderBy('articles.id', 'desc');


        return view('home.article.index', [
            'articles' => $query->paginate($number),
            'paginate_number' => $number,
            'title' => '我的文章'
        ]);
    }
}
