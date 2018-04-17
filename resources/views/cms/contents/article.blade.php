@extends('cms.layouts.base')

@section('content')
    <div id="article">
    <span class="position">当前位置：<a href="{{env('APP_URL')}}">首页</a> > <a
                href="{{route('contents', ['category' => $article->abbreviation])}}">{{$article->category}}</a> > 正文</span>
        <div class="article-title">
            <a id="comment-number">{{$article->comments}}</a>
            <div id="title-text">
                <h1>{{$article->title}}</h1>
                <p>
                    作者：<i>{{$article->author}}</i>&nbsp;&nbsp;&nbsp;&nbsp;
                    发表于：{{$article->add_time}}&nbsp;&nbsp;&nbsp;&nbsp;
                    已有 <i>{{$article->views}}</i> 人阅读此文&nbsp;&nbsp;&nbsp;&nbsp;
                    评论：<i>{{$article->comments}}</i> 条
                </p>
            </div>
        </div>
        <div class="article-body">
            {{$article->body}}
        </div>
    </div>
@endsection