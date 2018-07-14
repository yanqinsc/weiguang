<?php

namespace App\Http\Controllers\Home;

use App\Model\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\Controller;

class CommentController extends Controller
{
    public function index(Request $request)
    {
        $number = (int)$request->number ?: 10;
        $comments = Comment::leftJoin('users as u', 'uid', '=', 'u.id')
            ->leftJoin('articles as a', 'aid', '=', 'a.id')
            ->select('comments.id', 'a.title', 'comments.content', 'comments.created_at')
            ->where('comments.uid', Auth::user()->id)
            ->orderBy('comments.id', 'desc')
            ->paginate($number);

        return view('home.comment.index', [
            'comments' => $comments,
            'title' => '我的评论'
        ]);
    }
}
