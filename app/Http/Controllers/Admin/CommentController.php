<?php

namespace App\Http\Controllers\Admin;

use App\Model\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function index(Request $request)
    {
        $number = (int)$request->number ?: 10;
        $comments = Comment::leftJoin('users as u', 'uid', '=', 'u.id')
            ->leftJoin('articles as a', 'aid', '=', 'a.id')
            ->select('comments.id', 'reviewed', 'a.title', 'u.name', 'aid', 'comments.content', 'comments.created_at')
            ->orderBy('comments.id', 'desc')
            ->paginate($number);

        return view('admin.comment.index', [
            'comments' => $comments,
            'paginate_number' => $number,
            'title' => '评论管理'
        ]);
    }

    /**
     * 评论审核
     */
    public function review($id)
    {
        Comment::where('id', (int)$id)->update(['reviewed' => '']);
        return redirect()->back();
    }

    public function destroy($id)
    {
        Comment::where('id', (int)$id)->delete();
        return redirect()->back();
    }
}
