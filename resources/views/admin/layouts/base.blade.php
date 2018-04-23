<!DOCTYPE html>
<html>
@include('admin.layouts.header')
<body class="hold-transition skin-blue sidebar-mini" style="overflow: hidden;">
<div class="wrapper">
    <header class="main-header">
        <a href="{{ url('/') }}" class="logo">
            <span class="logo-mini"><b>W</b>G</span>
            <span class="logo-lg">{{ env('APP_NAME_CH') }}</span>
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
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>文章管理</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('article.create') }}" target="sub_page"><i class="fa fa-edit"></i>添加文章</a></li>
                        <li><a href="{{ route('article.index') }}" target="sub_page"><i class="fa fa-list-ul"></i>文章管理</a></li>
                        <li><a href="pages/forms/general.html" target="sub_page"><i class="fa fa-list-ul"></i>分类管理</a></li>
                        <li><a href="pages/forms/advanced.html" target="sub_page"><i class="fa fa-edit"></i>草稿箱</a></li>
                        <li><a href="pages/forms/editors.html" target="sub_page"><i class="fa fa-trash"></i>回收站</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-lock"></i>
                        <span>授权管理</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href=""><i class="fa fa-user" target="sub_page"></i>添加用户</a></li>
                        <li><a href="{{ route('role.index') }}"><i class="fa fa-group" target="sub_page"></i>角色管理</a></li>
                        <li><a href="{{ route('ability.index') }}" target="sub_page"><i class="fa fa-key"></i>权限管理</a></li>
                    </ul>
                </li>
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
    

    
    
    

