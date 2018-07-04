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
    </div>
@endsection