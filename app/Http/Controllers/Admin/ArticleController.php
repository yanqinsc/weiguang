<?php

namespace App\Http\Controllers\Admin;

use App\Model\User;
use App\Model\Article;
use App\Traits\Common;
use App\Model\Category;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    use Common;

    public function index(Request $request)
    {
        $number = (int)$request->number ?: 15;
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
            'category_id' => 'required|exists:categories,id',
            'author' => 'required',
            'article_content' => 'required',
            'username' => 'nullable|exists:users,name'
        ]);

        $data = [
            'title' => $request->title,
            'category_id' => $request->category_id,
            'author' => $request->author,
            'content' => $request->article_content,
            'publisher_id' => $request->user()->id,
            'from' => $request->from,
            'excerpt' => $request->excerpt,
            'key_words' => $request->key_words
        ];

        $data = array_filter($data);
        $data['is_top'] = $request->top ? '' : null;
        $data['is_hot'] = $request->hot ? '' : null;
        $data['is_original'] = $request->original ? '' : null;

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

            Article::where('id', $article->id)->update(['thumb' => $path]);
        }

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

        $data = [
            'title' => '编辑文章',
            'categories' => $categories,
            'article' => $article
        ];

        if ($article->author_id) {
            $data['username'] = User::find($article->author_id)->name;
        }

        return view('admin.article.edit', $data);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'nullable|exists:categories,id',
            'article_content' => 'required',
            'username' => 'nullable|exists:users,name'
        ]);

        $data = [
            'title' => $request->title,
            'category_id' => $request->category_id,
            'author' => $request->author,
            'content' => $request->article_content,
            'publisher_id' => $request->user()->id,
            'from' => $request->from,
            'excerpt' => $request->excerpt,
            'key_words' => $request->key_words,
            'author_id' => $request->author_id
        ];

        $data = array_filter($data);
        $data['is_top'] = $request->top ? '' : null;
        $data['is_hot'] = $request->hot ? '' : null;
        $data['is_original'] = $request->original ? '' : null;

        if (!empty($request->username)) {
            $data['author_id'] = User::where('name', $request->username)->first()->id;
        }

        Article::where('id', $id)->update($data);
        return redirect(route('article.index'));
    }

    public function destroy($id)
    {
        Article::where('id', (int)$id)->delete();
        return redirect()->back();
    }

    public function postThumb($type, Request $reqquest)
    {
        if ($reqquest->ajax()) {
            $base64Image = $reqquest->imgData;
            if ($type == 'create') {
                $path = "uploads/thumb/tmp/";
                $image_name = date('Ymdhis') . rand(1000, 9999);
                $query = null;
            } else {
                $reqquest->validate(['id' => 'exists:articles,id']);
                $path = "uploads/thumb/";
                $image_name = $reqquest->id;
                $query = Article::where('id', $reqquest->id);
            }

            return $this->postImage($base64Image, $path, $image_name, $query, 'thumb');
        } else {
            return ['status' => 502, 'message' => '图片类型错误。'];
        }
    }
}
