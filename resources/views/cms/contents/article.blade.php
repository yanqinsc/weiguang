@extends('cms.layouts.base')

@section('content')
    <div id="article">
    <span class="position">当前位置：
        <a href="{{ env('APP_URL') }}">首页</a> >
        <a href="{{ route('contents', ['category' => $article->slug])}}">{{$article->category }}</a> >
        正文
    </span>
        <div class="article-title">
            <a id="comment-number">{{ $article->comments }}</a>
            <div id="title-text">
                <h1>{{ $article->title }}</h1>
                <p>
                    <span>作者：<i>{{ $article->author }}</i></span>
                    <span>发表于：<i>{{ substr($article->created_at, 0, 10) }}</i></span>
                    <span>已有 <i>{{ $article->view_count }}</i> 人阅读此文</span>
                    <span>评论：<i>{{ $article->comment_count }}</i> 条</span>
                </p>
            </div>
        </div>
        <div class="article-body">
            {!! $article->content !!}
        </div>
        <div class="article-comments">
            <hr>
            <div class="col-md-12 bottom-20"><b>评论:</b></div>
            <ul>
                <li>
                    <div class="comment-info">
                        <img src="http://yuwen.litlight.cn/admin/adminlte/dist/img/user2-160x160.jpg" alt="avatar">
                        <div class="user-info">
                            <b>盼盼</b><br>
                            <i>2018-07-06 09:23</i>
                        </div>
                    </div>
                    <div class="comment-body">
                        这是第一条评论这这是第一条评论这是第一条评论这是第
                        一条评论这是第一条评论这是第一条评论这是第一条评论这是第一条
                        评论这是第一条评论这是第一条评论这是第一条评论这是第一条评论这是第一
                        条评论这是第一条评论是第一条评论这是第一条评论这是第一条评论这是第一条评论这是第一条评论
                        这是第一条评论这是第一条评论这是第一条评论这是第一条评论这是第一条评论
                        这是第一条评论这是第一条评论这是第一条评论这是第一条评论这是第一条评论
                        这是第一条评论这是第一条评论这是第一条评论这是第一条评论
                    </div>
                    <div class="btn-replay">
                        <i>回复</i>
                    </div>
                </li>
                <li>
                    <div class="comment-info">
                        <img src="http://yuwen.litlight.cn/admin/adminlte/dist/img/user2-160x160.jpg" alt="avatar">
                        <div class="user-info">
                            <b>盼盼</b><br>
                            <i>2018-07-06 09:23</i>
                        </div>
                    </div>
                    <div class="comment-body">
                        这是第一条评论这这是第一条评论这是第一条评论这是第
                    </div>
                    <div class="btn-replay">
                        <i>回复</i>
                    </div>
                </li>
                <li>
                    <div class="comment-info">
                        <img src="http://yuwen.litlight.cn/admin/adminlte/dist/img/user2-160x160.jpg" alt="avatar">
                        <div class="user-info">
                            <b>盼盼</b><br>
                            <i>2018-07-06 09:23</i>
                        </div>
                    </div>
                    <div class="comment-body">
                        这是第一条评论这这是第一条评论这是第一条评论这是第
                    </div>
                    <div class="btn-replay">
                        <i>回复</i>
                    </div>
                </li>
                <li>
                    <div class="comment-info">
                        <img src="http://yuwen.litlight.cn/admin/adminlte/dist/img/user2-160x160.jpg" alt="avatar">
                        <div class="user-info">
                            <b>盼盼</b><br>
                            <i>2018-07-06 09:23</i>
                        </div>
                    </div>
                    <div class="comment-body">
                        这是第一条评论这是第一条评论这是第一条评论这是第一条评论
                    </div>
                    <div class="btn-replay">
                        <i>回复</i>
                    </div>
                </li>
                <li>
                    <div class="comment-info">
                        <img src="http://yuwen.litlight.cn/admin/adminlte/dist/img/user2-160x160.jpg" alt="avatar">
                        <div class="user-info">
                            <b>盼盼</b><br>
                            <i>2018-07-06 09:23</i>
                        </div>
                    </div>
                    <div class="comment-body">
                        这是第一条评论这这是第一条评论这是第一条评论这是第
                    </div>
                    <div class="btn-replay">
                        <i>回复</i>
                    </div>
                </li>
                <li>
                    <div class="comment-info">
                        <img src="http://yuwen.litlight.cn/admin/adminlte/dist/img/user2-160x160.jpg" alt="avatar">
                        <div class="user-info">
                            <b>盼盼</b><br>
                            <i>2018-07-06 09:23</i>
                        </div>
                    </div>
                    <div class="comment-body">
                        这是第一条评论这这是第一条评论这是第一条评论这是第
                    </div>
                    <div class="btn-replay">
                        <i>回复</i>
                    </div>
                </li>
            </ul>
        </div>
        
        <div class="comment-relay">
            <hr>
        </div>
    </div>
@endsection