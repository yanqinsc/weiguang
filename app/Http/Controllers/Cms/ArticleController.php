<?php

namespace App\Http\Controllers\Cms;

use App\Model\Comment;
use App\Model\Article;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ArticleController extends Controller
{
    public function index(Request $request, $id)
    {
        $article = Article::getArticle($id);
        $comments = Comment::join('users', 'comments.uid', 'users.id')
            ->select('comments.id', 'pid', 'uid', 'name', 'content', 'comments.created_at', 'avatar')
            ->where(['aid' => $id])
            ->orderBy('comments.id', 'asc')
            ->whereNotNull('reviewed')
            ->get()
            ->toArray();


        $comments = $this->arrangeComments($comments);
        $emojis = get_emojis(20, 'replay-text');

        $response = response()->view('cms.contents.article', [
            'article' => $article,
            'current_controller' => 'article',
            'comments' => $comments,
            'emojis' => $emojis
        ]);

        $cookie_key = 'view_count_'.$id;
        if (empty($request->cookie($cookie_key))) {
            $cookie = cookie($cookie_key, 1, 4*3600);
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


        if (config('app.article_reviewed')) {
            $data['reviewed'] = '';
        }

        DB::transaction(function () use ($data) {
            Comment::insert($data);
            $comments = Comment::select(DB::raw('count(*) as count'))->where('aid', $data['aid'])->first();
            Article::where('id', $data['aid'])->update(['comment_count'=>$comments->count]);
        });

        $response = redirect()->back();
        return config('app.article_reviewed') ? $response :
            $response->withErrors('评论成功，管理员审核正在审核，请稍后查看！');
    }

    private function arrangeComments($comments) {
        $data = [];
        $temp = [];
        $getTopId = function ($pid, $temp) use (&$getTopId) {
            if ($temp[$pid]['pid'] === 0) {
                $topId =  $temp[$pid]['id'];
            } else {
                $topId = $getTopId($temp[$pid]['pid'], $temp);
            }
            return $topId;
        };

        foreach ($comments as $comment) {
            $temp[$comment['id']] = $comment;
            if ($comment['pid'] === 0) {
                $data[$comment['id']] = $comment;
            } else {
                $data[$getTopId($comment['pid'], $temp)]['replies'][] = $comment;
            }
        }

        return $data;
    }
}
