<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('menu.store') }}">
    {{ csrf_field() }}
    <div class="box-header with-border">
        <h3 class="box-title">添加菜单</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input name="title" type="text" class="form-control"  maxlength="50">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">PID</span>
            <input name="pid" type="number" class="form-control" max="99">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">排序</span>
            <input name="order" type="number" class="form-control" max="99">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">图标</span>
            <input name="icon" type="text" class="form-control">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">路由</span>
            <input name="route_name" type="text" class="form-control" maxlength="50">
        </div>
    </div>
    <p class="color-red show-error">@if($errors->any()) {{ $errors->first() }} @endif</p>
    <div class="box-footer">
        <button type="submit" class="btn btn-primary">添加</button>
    </div>
</form>
@include('admin.layouts.footer')
</body>
</html>