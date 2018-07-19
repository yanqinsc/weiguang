@extends('cms.layouts.base')

@section('content')
    <style>
        textarea {
            padding: 10px;
        }
    </style>
    <div id="article">
    <span class="position">当前位置：
        <a href="{{ env('APP_URL') }}">首页</a> >
        <a href="{{ route('contents', ['category' => $article->slug])}}">{{$article->category }}</a> >
        正文
    </span>
        <div class="article-title">
            <a id="comment-number">{{ $article->comments }}</a>
            <div id="title-text">
                <h1 id="article-title" title="{{ $article->title }}">
                    {{ $article->title }}
                </h1>
                <p>
                    <span>作者:<i>{{ $article->author }}</i></span>
                    <span>发表于:<i>{{ substr($article->created_at, 0, 10) }}</i></span>
                    <span>阅读(<i>{{ $article->view_count }}</i>)</span>
                    <span class="mobile-hide">评论(<i>{{ $article->comment_count }}</i>)</span>
                </p>
            </div>
        </div>
        <div class="article-body">
            {!! $article->content !!}
        </div>
        @if(count($comments))
        <div class="article-comments">
            <hr>
            <div class="col-md-12 bottom-20"><b>评论:</b></div>
            <ul>
                @foreach($comments as $comment)
                <li  class="item-li" id="comment-{{ $comment['id'] }}">
                    <div class="comment-info">
                        <img src="{{ $comment['avatar'] ?: asset('/cms/images/avatar.png') }}" alt="头像">
                        <div class="user-info">
                            <b>{{ $comment['name'] }}</b><br>
                            <i>{{ substr($comment['created_at'], 0, 16) }}</i>
                        </div>
                    </div>
                    <div class="comment-body">{{ $comment['content'] }}</div>
                    <div class="btn-replay">
                        <a href="javascript:void(0)">
                            <i class="re-replay" data-uid="$comment['uid']" data-name="{{ $comment['name'] }}" data-comment-id="{{ $comment['id'] }}">回复</i>
                        </a>
                    </div>
                    @if(isset($comment['replies']))
                    <ul class="sub-items">
                        @foreach($comment['replies'] as $reply)
                        <li class="item-li-dashed" id="comment-{{ $reply['id'] }}">
                            <div class="comment-info">
                                <img src="{{ $reply['avatar'] ?: asset('/cms/images/avatar.png') }}" alt="头像">
                                <div class="user-info">
                                    <b>{{ $reply['name'] }}</b><br>
                                    <i>{{ substr($reply['created_at'], 0, 16) }}</i>
                                </div>
                            </div>
                            <div class="comment-body border-left-orange">{{ $reply['content'] }}</div>
                            <div class="btn-replay">
                                <a href="javascript:void(0)"><i class="re-replay" data-name="{{ $reply['name'] }}" data-comment-id="{{ $reply['id'] }}">回复</i></a>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                    @endif
                </li>
                @endforeach
            </ul>
        </div>
        @endif

        <form class="comment-relay" action="{{ route('comment.create') }}" method="post">
            {{ csrf_field() }}
            <textarea name="comment" id="replay-text" rows="5" maxlength="120" placeholder="内容不超过120字。"></textarea>
            <input type="hidden" name="pid" value="0">
            <input type="hidden" name="aid" value="{{ $article->id }}">
            <br>
            @guest
            <a href="{{ route('login') }}" id="login">登录</a>后才能发表评论！<br>
            @endguest
            @if($errors->any())
            <p class="show-error" id="commentError"> {{ $errors->first() }} </p>
            @endif
            <br>
            <button class="btn btn-primary" id="comment">发表评论</button>
        </form>
    </div>
    <script>
        $(function () {
            if ($("#login").length === 1) {
                $("#replay-text").attr('disabled', true);
            }

            if ($("#commentError").length) {
                window.location.href = '#comment';
            }

            $(".re-replay").click(function () {
                let pid = $(this).attr('data-comment-id'),
                    name = $(this).attr('data-name');

                $("input[name=pid]").val(pid);
            @guest
            @else
                if (name !== '{{ Auth::user()->name }}' && name !== '{{ Auth::user()->real_name }}') {
                    $("#replay-text").html('@' + name + '  ');
                }
            @endguest
                window.location.href = '#comment';
            });
        });
    </script>
@endsection