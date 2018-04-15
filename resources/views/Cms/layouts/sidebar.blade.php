<div class="sitebar-list">
    <div class="sitebar-title">
        <h4>热门文章</h4>
    </div>
    <ul>
        @foreach($hot_articles as $article)
            <li><a href="{{route('article', ['id' => $article->id])}}"
                   title="{{$article->title}}">{{$article->title}}</a></li>
        @endforeach
    </ul>
</div>
