<?php

namespace App\Http\Controllers\Admin;

use App\Model\Article;
use App\Model\Category;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    public function index(Request $request)
    {
        $number = (int)$request->number ?: 10;
        $query = Article::leftJoin('categories as c', 'category_id', '=', 'c.id')
            ->leftJoin('admins as a', 'publisher_id', '=', 'a.id')
            ->select('articles.id', 'title', 'author', 'comment_count', 'author', 'a.name as publisher', 'excerpt', 'view_count',
                'articles.created_at', 'c.id as category_id', 'c.name as category')
            ->orderBy('articles.id', 'desc');

        if ($request->category_id) {
            $query->where('c.id', $request->category_id);
        }

        return view('admin.article.index', [
            'articles' => $query->paginate($number),
            'paginate_number' => $number,
            'title' => '文章管理'
        ]);
    }

    public function create()
    {
        $categories = Category::getAll();
        return view('admin.article.create', [
            'title' => '添加文章',
            'categories' => $categories
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'category_id' => 'exists:users,id',
            'author' => 'required',
            'article_content' => 'required',
            'username' => 'nullable|alpha_num',
            'author_id' => 'nullable|integer'
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
            'key_words' => $request->key_words,
            'author_id' => $request->author_id
        ];
        $data = array_filter($data);
        $data['is_top'] = $request->top ? '' : null;
        $data['is_hot'] = $request->hot ? '' : null;

        Article::create($data);
        return redirect(route('article.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $categories = Category::getAll();
        $article = Article::find($id);

        return view('admin.article.edit', [
            'title' => '编辑文章',
            'categories' => $categories,
            'article' => $article
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'nullable|exists:users,id',
            'username' => 'nullable|alpha_num',
            'article_content' => 'required',
            'author_id' => 'nullable|integer'
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
            'key_words' => $request->key_words,
            'author_id' => $request->author_id
        ];
        $data = array_filter($data);
        $data['is_top'] = $request->top ? '' : null;
        $data['is_hot'] = $request->hot ? '' : null;

        Article::where('id', $id)->update($data);
        return redirect(route('article.index'));
    }

    public function destroy($id)
    {
        Article::where('id', (int)$id)->delete();
        return redirect()->back();
    }
}
