@extends('cms.layouts.base')

@section('content')
    <div>
        @foreach($contents as $article)
            <section class="list-item">
                @if(empty($article->thumb))
                    <div class="title-picture">
                        <i>
                            @if($article->comments <= 99)
                                {{$article->comments}}
                            @else
                                99+
                            @endif

                        </i>
                    </div>
                @else
                    <img src="{{$article->thumb}}" alt="{{$article->title}}" class="title-picture">
                @endif
                <div class="title-text">
                    <p class="title"><a href="{{route('article', ['id' => $article->id])}}">{{$article->title}}
                            (作者：{{$article->author}})</a></p>
                    <span>{{substr($article->created_at, 0, 10)}} - {{$article->category}}
                        - 阅 {{$article->views}}</span>
                    <p class="describe">
                        {{$article->summary}}
                    </p>
                </div>
            </section>
        @endforeach
        <nav aria-label="Page navigation">
            {{$contents->links()}}
        </nav>
    </div>
    <input type="hidden" name="category" value="{{$active_nav_item or 'home'}}">
@endsection