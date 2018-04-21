<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{ env('APP_NAME_CH') }} | 管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    @include('admin.common.css')
@if($title == '添加文章')
        @include('UEditor::head')
@endif
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    @include('admin.layouts.header')
    @include('admin.layouts.sidebar')
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                {{ $title }}
                <small>孜孜不倦，不紧不慢</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">概况</li>
            </ol>
        </section>
    @section('content')
        This is the content!
    @show
    </div>
    @include('admin.layouts.footer')
</div>
@include('admin.common.js')
</body>
</html>

