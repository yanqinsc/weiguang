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
                @if(empty($item['sub_menu']))
                <li class="nav-item">
                    <a class="nav-link" id="{{$item['slug']}}"
                       href="{{ route('contents', ['category' => $item['slug']]) }}">{{ $item['name'] }}</a>
                </li>
                @else
                <li class="nav-item">
                    <div class="dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" id="{{$item['slug']}}"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {{ $item['name'] }}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            @foreach($item['sub_menu'] as $value)
                            <a class="dropdown-item" id="{{$value['slug']}}" href="{{ route('contents', ['category' => $value['slug']]) }}">{{ $value['name'] }}</a>
                            @endforeach
                        </div>
                    </div>
                </li>
                @endif
            @endforeach
            <li class="nav-item">
                <a class="nav-link" id="home"
                   href="{{ route('aboutUs') }}">关于我们</a>
            </li>

        </ul>
        <ul class="nav navbar-nav navbar-right">
            @guest
                {{--在后台登录的模板使用js隐藏登录注册链接--}}
                <li><a class="nav-link" href="{{ route('login') }}">登录</a></li>
                <li><a class="nav-link" href="{{ route('register') }}">注册</a></li>
            @else
                <li>
                    <a href="{{ route('home.base') }}" class="nav-link" style="color: #99dd00; margin-top: -5px;">
                        <img id="nav-avatar" src="{{ Auth::user()->avatar ?: asset('cms/images/avatar.png') }}">
                        {{ mb_substr(Auth::user()->nickname ?: Auth::user()->name, 0, 6) }}</a><span></span>
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
