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


    public function post(Request $request)
    {
        return view('home.article.post', [
            'title' => '我要投稿',
        ]);
    }

    public function store(Request $request)
    {

        $request->validate([
            'title' => 'required',
            'author' => 'required',
            'article_content' => 'required',
            'key_words'  => 'required',
            'excerpt'  => 'required',
            'license' => 'required'
        ]);

        $data = [
            'title' => $request->title,
            'author' => $request->author,
            'content' => $request->article_content,
            'from' => $request->from,
            'excerpt' => $request->excerpt,
            'key_words' => $request->key_words,
            'is_original' => '',
            'type' => 0
        ];

        $data = array_filter($data);

        if (!empty($request->username)) {
            $data['author_id'] = User::where('name', $request->username)->first()->id;
        }

        $article = Article::create($data);
        if ($request->thumb) {
            $file_type = explode('.', $request->thumb)[1];
            $path = '/uploads/thumb/' . $article->id . '.' . $file_type;
            $thumb = public_path() . $path;

            if (!file_exists($thumb)) {
                rename(public_path() . '/uploads/thumb/tmp/' . $request->thumb, $thumb);
            }

            Article::where('id', $article->id)->update(['thumb' => asset($path)]);
        }

        return redirect(route('home.article.index'));
    }
}
