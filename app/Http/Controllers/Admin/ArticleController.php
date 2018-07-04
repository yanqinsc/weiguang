<?php

namespace App\Http\Controllers\Admin;

use App\Model\Article;
use App\Model\Category;
use App\Model\Classes;
use App\Model\School;
use App\Model\User;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    public function index(Request $request)
    {
        $number = (int)$request->number ?: 10;
        $query = Article::leftJoin('categories as c', 'category_id', '=', 'c.id')
            ->leftJoin('users as u', 'author_id', '=', 'u.id')
            ->leftJoin('admins as a', 'publisher_id', '=', 'a.id')
            ->select('articles.id', 'title', 'author', 'comment_count', 'a.name as author', 'u.name as publisher', 'excerpt', 'view_count',
                'articles.created_at', 'c.id as category_id', 'c.name as category')
            ->orderBy('articles.id', 'desc');

        $request->category_id && $query->where('c.id', $request->category_id);
        $articles = $query->paginate($number);

        return view('admin.article.index', [
            'articles' => $articles,
            'paginate_number' => $number,
            'title' => '文章管理'
        ]);
    }

    public function create()
    {
        $categories = Category::getAll();
        $schools = School::all();

        return view('admin.article.create', [
            'title' => '添加文章',
            'categories' => $categories,
            'schools' => $schools
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'category_id' => 'exists:users,id',
            'author' => 'required',
            'article_content' => 'required',
            'username' => 'nullable|alpha_num'
        ]);

        $data = [
            'title' => $request->title,
            'category_id' => $request->category_id,
            'author' => $request->author,
            'content' => $request->article_content,
            'publisher_id' => $request->user()->id,

            'from' => $request->from,
            'thumb' => $request->thumb,
            'excerpt' => $request->excerpt,
            'key_words' => $request->key_words
        ];
        $data = array_filter($data);
        $data['is_top'] = $request->top ? '' : null;
        $data['is_hot'] = $request->hot ? '' : null;

        if (isset($request->username)) {
            $user = User::where('name', $request->username)->first();
            $data['author_id'] = $user->id;
        }

        Article::create($data);
        return redirect(route('article.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
