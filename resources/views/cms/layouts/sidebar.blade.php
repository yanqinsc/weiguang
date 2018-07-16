<div class="sitebar-list">
    <form class="form-inline my-2 my-lg-0" id="search" action="{{ route('contents', ['category' => 'home']) }}">
        <input name="key_words" class="form-control mr-sm-2" type="search" placeholder="请输入关键词" aria-label="Search"
               value="{{ $key_words ?? null }}">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
    </form>
    <br>
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
