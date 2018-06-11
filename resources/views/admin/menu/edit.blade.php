<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-warning create" method="post" action="{{ route('menu.update', ['id' => $id]) }}">
    {{ csrf_field() }}
    {{ method_field('PUT') }}
    <div class="box-header with-border">
        <h3 class="box-title">编辑权限</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input name="title" type="text" class="form-control"  maxlength="50" placeholder="{{ $menu->title }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">PID</span>
            <input name="pid" type="number" class="form-control" max="99" placeholder="{{ $menu->pid }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">排序</span>
            <input name="order" type="number" class="form-control" max="99" placeholder="{{ $menu->order }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">图标</span>
            <input name="icon" type="text" class="form-control" placeholder="{{ $menu->icon }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">路由</span>
            <input name="route_name" type="text" class="form-control" maxlength="50" placeholder="{{ $menu->route_name }}">
        </div>
    </div>
    <p class="color-red show-error">@if($errors->any()) {{ $errors->first() }} @endif</p>
    <div class="box-footer">
        <button type="submit" class="btn btn-primary">更新</button>
    </div>
</form>
@include('admin.layouts.footer')
</body>
</html>