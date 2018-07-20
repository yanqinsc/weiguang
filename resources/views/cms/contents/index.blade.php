@extends('cms.layouts.base')

@section('content')
    <div>
        @foreach($contents as $article)
            <section class="list-item">
                @if(empty($article->thumb))
                    <div class="title-picture">
                        <i>
                            @if($article->comment_count <= 99)
                                {{ $article->comment_count }}
                            @else
                                99+
                            @endif

                        </i>
                    </div>
                @else
                    <img src="{{ $article->thumb }}" alt="{{ $article->title }}" class="title-picture">
                @endif
                <div class="title-text">
                    <p class="title" title="{{ $article->title }}">
                        <a id="article-title" href="{{ route('article', ['id' => $article->id]) }}">
                            {{ $article->title }}
                        </a>
                    </p>
                    <span>
                        <span class="right-20"><span class="mobile-hide">作者：{{ $article->from }} </span>{{ $article->author }}</span>
                        <span class="right-20"><span class="mobile-hide">分类：</span>{{ $article->category }}</span>
                        <span class="right-20">阅({{ $article->view_count }})</span>
                        <span class="mobile-hide">评({{ $article->comment_count }})</span>
                    </span>
                    <p class="describe">
                        {{ $article->excerpt }}
                    </p>
                </div>
            </section>
        @endforeach
        <nav aria-label="Page navigation">
            {{ $contents->links() }}
        </nav>
    </div>
    @if($key_words)
    <div class="search-title">
        <a id="comment-number"></a>
        <div id="title-text">
            <h5>搜索 <i>{{ $key_words }}</i> 共找到 <i>{{ $search_count }}</i> 个结果</h5>
        </div>
    </div>
    @endif
    <input type="hidden" name="category" value="{{ $active_nav_item or 'home' }}">
@endsection