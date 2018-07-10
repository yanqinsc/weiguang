<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{ config('app.name_ch') }}-{{ $active_nav_name or $article->title }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="{{ asset('common/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cms/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('cms/css/sidebar.css') }}">
    @if($current_controller == 'contents')
    <link rel="stylesheet" href="{{ asset('cms/css/contents.css') }}">
    @endif

    @if($current_controller == 'article')
    <link rel="stylesheet" href="{{ asset('cms/css/article.css') }}">
    @endif
    <script src="{{ asset('common/js/jquery.min.js') }}"></script>
</head>
<body>
@include('cms.layouts.nav')
