<?php

namespace App\Http\Controllers\Home;

use App\Model\Article;
use App\Model\Category;
use App\Rules\DataExists;
use App\Traits\Common;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\Controller;

class ArticleController extends Controller
{
    use Common;

    public function index(Request $request)
    {
        $number = (int)$request->number ?: 10;
        $query = Article::leftJoin('categories as c', 'category_id', '=', 'c.id')
            ->leftJoin('admins as a', 'publisher_id', '=', 'a.id')
            ->select('articles.type', 'articles.id', 'title', 'author', 'comment_count', 'author', 'a.name as publisher', 'excerpt', 'view_count',
                'articles.created_at', 'c.id as category_id', 'c.name as category')
            ->where('articles.author_id', Auth::user()->id)
            ->orderBy('articles.id', 'desc');


        return view('home.article.index', [
            'articles' => $query->paginate($number),
            'paginate_number' => $number,
            'title' => '文章列表'
        ]);
    }


    public function post()
    {
        $categories = Category::whereNotNull('is_nav')->whereNotNull('allow_post')->get();
        return view('home.article.post', [
            'title' => '我要投稿',
            'categories' => $categories
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'author' => 'required',
            'article_content' => 'required|min:50',
            'key_words'  => 'required',
            'excerpt'  => 'required',
            'article_license' => 'required',
            'category_id' => 'required|integer',
        ]);

        $data = [
            'title' => $request->title,
            'author' => $request->author,
            'content' => $request->article_content,
            'from' => $request->from,
            'excerpt' => $request->excerpt,
            'key_words' => $request->key_words,
            'category_id' => $request->category_id,
            'type' => 2,
            'author_id' =>  Auth::user()->id
        ];
        $data = array_filter($data);
        $data['is_original'] = '';
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

        return redirect(route('home.article.index'));
    }

    public function edit($id)
    {
        $article = Article::find($id);
        if (!$article || $article->author_id != Auth::user()->id) {
            return redirect()->back()->withErrors('文章不存在！');
        }
        $categories = Category::whereNotNull('is_nav')->whereNotNull('allow_post')->get();
        return view('home.article.edit', [
            'title' => '编辑稿件',
            'categories' => $categories,
            'article' => $article
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'nullable|exists:categories,id',
            'article_content' => 'required',
            'username' => 'nullable|exists:users,name'
        ]);

        $article = Article::find($id);
        if (!$article || $article->id != Auth::user()->id ) {
            return redirect()->back()->withErrors('文章不存在！');
        }

        $data = [
            'title' => $request->title,
            'category_id' => $request->category_id,
            'author' => $request->author,
            'content' => $request->article_content,
            'from' => $request->from,
            'excerpt' => $request->excerpt,
            'key_words' => $request->key_words
        ];

        $data = array_filter($data);
        $data['is_original'] = $request->original ? '' : null;

        if (!empty($request->username)) {
            $data['author_id'] = User::where('name', $request->username)->first()->id;
        }

        Article::where(['id' => $id, 'author_id' => Auth::user()->id])->update($data);
        return redirect(route('home.article.index'));
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
                $article = Article::find($reqquest->id);
                $reqquest->validate(['id' => [new DataExists($article, ['author_id' => Auth::user()->id])]]);
                $path = "uploads/thumb/";
                $image_name = $reqquest->id;
                $query = Article::where('id', $reqquest->id);
            }

            return $this->postImage($base64Image, $path, $image_name, $query, 'thumb');
        } else {
            return ['status' => 502, 'message' => '图片类型错误。'];
        }
    }

    public function destroy($id)
    {
        $article = Article::where(['id' => $id, 'author_id' => Auth::user()->id, 'type' => 2])->first();
        // 删除对应的图片
        $thumb = public_path($article->thumb);
        if (file_exists($thumb)) {
            unlink($thumb);
        }

        $article->forceDelete();
        return redirect()->back();
    }
}
