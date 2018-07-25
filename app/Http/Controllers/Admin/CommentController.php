<?php

namespace App\Http\Controllers\Admin;

use App\Model\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommentController extends Controller
{

    public function __construct()
    {
        $this->middleware('can:comment-list');
        $this->middleware('can:comment-review')->only(['review']);
        $this->middleware('can:comment-destroy')->only('destroy');
    }

    public function index(Request $request)
    {
        $number = (int)$request->number ?: 20;
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
        Comment::where('id', $id)->update(['reviewed' => '']);
        return redirect()->back();
    }

    public function destroy($id)
    {
        $comment = Comment::find($id);
        if ($comment) {
            DB::transaction(function () use ($comment) {
                Comment::where('id', $comment->id)->delete();
                // 将已删除评论的所有子评论归属到其上级评论
                Comment::where('pid', $comment->id)->update(['pid' => $comment->pid]);
            });
        }
        return redirect()->back();
    }
}
