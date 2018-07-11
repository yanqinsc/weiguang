<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/"><img src="{{ asset('cms/images/logo.png') }}" alt=""></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" id="home"
                   href="{{ route('index') }}">首页</a>
            </li>
            @foreach( $categories as $item)
            <li class="nav-item">
                <a class="nav-link" id="{{$item->slug}}"
                   href="{{ route('contents', ['category' => $item->slug]) }}">{{ $item->name }}</a>
            </li>
            @endforeach
        </ul>
        <ul class="nav navbar-nav navbar-right">
            @guest
                <li><a class="nav-link" href="{{ route('login') }}">登录</a></li>
                <li><a class="nav-link" href="{{ route('register') }}">注册</a></li>
            @else
                    <li>
                        <a href="home" class="nav-link">
                            {{ mb_substr(Auth::user()->nickname ?: Auth::user()->name, 0, 6) }}同学</a>
                    </li>
                    <li>
                        <a href="{{ route('logout') }}" class="nav-link"
                           onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();">
                            退出
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
                    </li>
            @endguest
        </ul>
    </div>
</nav>
