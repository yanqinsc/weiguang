<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{ config('app.name_ch') }}-{{ $active_nav_name or $article->title }}</title>
    <meta charset="utf-8">
    @if($current_controller == 'contents')
        <meta name="keywords" content="微光语文,微光,语文,作文,文学,艺术,{{ $active_nav_name }}">
        <meta name="description" content="微光语文({{ config('app.domain') }}) {{ $active_nav_name }} 栏目">
        <link rel="stylesheet" href="{{ asset('cms/css/contents.css') }}">
    @elseif($current_controller == 'article')
        <meta name="keywords" content="{{ $article->key_words }}">
        <meta name="description" content="{{ $article->excerpt }}">
        <meta name="author" content="{{ $article->author }}"/>
        <link rel="stylesheet" href="{{ asset('cms/css/article.css') }}">
    @endif
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="{{ asset('common/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cms/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('cms/css/sidebar.css') }}">
    <script src="{{ asset('common/js/jquery.min.js') }}"></script>
</head>
<body>
@include('cms.layouts.nav')
