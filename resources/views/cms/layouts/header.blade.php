<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{env('APP_NAME_CH')}}-{{$active_nav_name or $article->title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('cms/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('cms/css/sidebar.css')}}">
    @if($current_controller == 'contents')
<link rel="stylesheet" href="{{asset('cms/css/contents.css')}}">
    @endif

    @if($current_controller == 'article')
<link rel="stylesheet" href="{{asset('cms/css/article.css')}}">
    @endif
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/"><img src="{{asset('cms/images/logo.png')}}" alt=""></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" id="home"
                   href="{{route('index')}}">首页</a>
            </li>
            @foreach( $categories as $item)
            <li class="nav-item">
                <a class="nav-link" id="{{$item->abbreviation}}"
                   href="{{route('contents', ['category' => $item->abbreviation])}}">{{$item->name}}</a>
            </li>
            @endforeach
        </ul>
        <form class="form-inline my-2 my-lg-0" id="search">
            <input class="form-control mr-sm-2" type="search" placeholder="请输入关键词" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>
