<?php

namespace App\Http\Controllers\Cms;

use App\Model\Comment;
use App\Model\Article;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ArticleController extends Controller
{
    public function index(Request $request, $id)
    {
        $article = Article::getArticle($id);
        $comments = Comment::join('users', 'comments.uid', 'users.id')
            ->select('comments.id', 'pid', 'uid', 'name', 'real_name', 'content', 'comments.created_at', 'avatar')
            ->where('aid', $id)
            ->whereNotNull('reviewed')
            ->get();

        $response = response()->view('cms.contents.article', [
            'article' => $article,
            'current_controller' => 'article',
            'comments' => $comments
        ]);

        if (empty($request->cookie('view_count'))) {
            $cookie = cookie('view_count', 1, 24*3600);
            Article::where('id', $id)->update(['view_count' => $article['view_count'] + 1]);
            $response->cookie($cookie);
        }

        return $response;
    }

    public function createComment(Request $request)
    {
        $rule = [
            'comment' => 'required|max:250',
            'aid' => 'exists:articles,id'
        ];

        if (!empty($request->pid)) {
            $rule['pid'] = 'exists:comments,id';
        }

        $request->validate($rule);
        $data = [
            'pid' => $request->pid,
            'content' => $request->comment,
            'aid' => $request->aid,
            'uid' => Auth::user()->id,
            'created_at' => date('Y-m-d H:i:s')
        ];
        Comment::insert($data);
        return redirect()->back()->withErrors('请等候管理员审核！');
    }
}
