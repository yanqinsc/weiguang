<?php

namespace App\Http\Controllers\Home;

use App\Model\Article;
use App\Model\Comment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\Controller;


class HomeController extends Controller
{
    public function base()
    {
        return view('home.layouts.base', [
            'title' => '会员中心',
            'user' => Auth::user()
        ]);
    }

    public function overview()
    {
        $uid = Auth::user()->id;
        $article = Article::select(DB::raw('count(*) as count'))->where('author_id', $uid)->first();
        $comment = Comment::select(DB::raw('count(*) as count'))->where('uid', $uid)->first();
        return view('home.index', [
            'title' => '概览',
            'article_count' => $article->count,
            'comment_count' => $comment->count,
        ]);
    }
}
