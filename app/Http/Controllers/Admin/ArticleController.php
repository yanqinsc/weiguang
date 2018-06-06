<?php

namespace App\Http\Controllers\Admin;

use App\Model\Article;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ArticleController extends Controller
{
    /**
     * 查看所有文章
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $number = (int)$request->number ?: 10;
        $query = Article::leftJoin('categories as c', 'category_id', '=', 'c.id')
            ->leftJoin('users as u', 'author_id', '=', 'u.id')
            ->leftJoin('admins as a', 'publisher_id', '=', 'a.id')
            ->select('articles.id', 'title', 'comment_count', 'a.name as author', 'u.name as publisher', 'excerpt', 'view_count',
                'articles.created_at', 'c.id as category_id', 'c.name as category')
            ->orderBy('articles.id', 'desc');

        $request->category_id && $query->where('c.id', $request->category_id);
        $articles = $query->paginate($number);
//dd($articles);
        return view('admin.article.index', [
            'articles' => $articles,
            'paginate_number' => $number,
            'title' => '文章管理'
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.article.create', [
            'title' => '添加文章'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        dd($request);
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
