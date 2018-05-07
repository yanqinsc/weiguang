<!DOCTYPE html>
<html>
@include('admin.layouts.header')
<body class="hold-transition skin-blue sidebar-mini" style="overflow: hidden;">
<div class="wrapper">
    <header class="main-header">
        <a href="{{ url('/') }}" class="logo">
            <span class="logo-mini"><b>W</b>G</span>
            <span class="logo-lg">{{ config('app.name_ch') }}</span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="{{ $user->avatar }}" class="user-image"
                                 alt="User Image">
                            <span class="hidden-xs">{{ $user->real_name }}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="{{ $user->avatar }}" class="img-circle"
                                     alt="User Image">
                                <p>
                                    {{ $user->real_name }}
                                    <small>{{ $user->motto }}</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">主页</a>
                                </div>
                                <div class="pull-right">
                                    <a href="{{ route('logout') }}" class="btn btn-default btn-flat"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        退出
                                    </a>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="{{ $user->avatar }}" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <a href="#"></a>
                    <p>{{ $user->real_name }}</p>
                </div>
            </div>
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">导航栏</li>
                @foreach($menu as $item)
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-lock"></i>
                        <span>{{ $item['title'] }}</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        @foreach($item['sub_menu'] as $value)
                        <li><a href="{{ route($value['route_name']) }}" target="sub_page"><i class="fa {{ $value['icon'] }}"></i>{{ $value['title'] }}</a></li>
                        @endforeach
                    </ul>
                </li>
                @endforeach
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <span id="current-title">{{ $title }}</span>
                <small>{{ $user->motto }}</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{ route('home') }}"><i class="fa fa-dashboard"></i> 控制台</a></li>
                <li class="active" id="current-title-right">个人中心</li>
            </ol>
        </section>
        <iframe name="sub_page" id="sub_page" frameborder="0" scrolling="no" src="{{ route('home.index') }}"></iframe>
    </div>
    <footer class="main-footer">
        <div class="pull-left hidden-xs">
            <strong>Copyright &copy; 2018 <a href="{{ url('/') }}">litlight.cn</a>.</strong> All rights
            reserved.
        </div>
    </footer>
</div>
@include('admin.common.js')
</body>
</html>
    

    
    
    

