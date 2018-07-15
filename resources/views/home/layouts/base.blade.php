<!DOCTYPE html>
<html>
@include('home.layouts.header')
<body class="hold-transition skin-blue sidebar-mini" style="overflow: hidden;">
<div class="wrapper">
    <header class="main-header">
        <a href="{{ url('/') }}" class="logo">
            <span class="logo-mini"><b>W</b>G</span>
            <span class="logo-lg">
                <img src="{{ asset('cms/images/logo_min.png') }}" alt="微光">
                {{ config('app.name_ch') }}
            </span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="{{ $user->avatar ?: asset('/cms/images/avatar.png') }}" class="user-image"
                                 alt="User Image">
                            <span class="hidden-xs">{{ $user->real_name }}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="{{ $user->avatar ?: asset('/cms/images/avatar.png') }}" class="img-circle"
                                     alt="User Image">
                                <p>
                                    {{ $user->nickname ?: $user->name }}
                                    <small>{{ $user->motto }}</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="/" class="btn btn-default btn-flat">首页</a>
                                </div>
                                <div class="pull-right">
                                    <a href="javascript:void(0)" class="btn btn-default btn-flat"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        退出
                                    </a>
                                    <form id="logout-form" action="{{ route('logout') }}" method="post" style="display: none;">
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
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">导航栏</li>
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="{{ $user->avatar ?: asset('/cms/images/avatar.png')  }}" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <a href="#"></a>
                        <p>{{ $user->nickname ?: $user->name }}</p>
                    </div>
                </div>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-user"></i>
                        <span>会员中心</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('home.user.info') }}" target="sub_page"><i class="fa fa-list"></i>基本资料</a></li>
                        <li><a href="{{ route('home.user.changePassword') }}" target="sub_page"><i class="fa fa-lock"></i>修改密码</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>我的文章</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('home.article.index') }}" target="sub_page"><i class="fa fa-list"></i>文章列表</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-comments"></i>
                        <span>我的评论</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('home.comment.index') }}" target="sub_page"><i class="fa fa-list"></i>评论列表</a></li>
                    </ul>
                </li>

            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <span id="current-title">{{ $title }}</span>
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/panel"><i class="fa fa-dashboard"></i> 控制台</a></li>
                <li class="active" id="current-title-right">首页</li>
            </ol>
        </section>
        <iframe name="sub_page" id="sub_page" frameborder="0" scrolling="no" src="{{ route('home.overview') }}"></iframe>
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
    

    
    
    

