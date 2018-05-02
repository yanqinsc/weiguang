<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('ability.update', ['id' => $id]) }}">
    {{ csrf_field() }}
    {{ method_field('PUT') }}
    <div class="box-header with-border">
        <h3 class="box-title">编辑权限</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input name="name" type="text" value="{{ $ability->name }}"
                   class="form-control" placeholder="只能是英文、数字或下划线的组合">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">注释</span>
            <input name="title" type="text" value="{{ $ability->title }}" class="form-control">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">上级ID</span>
            <input name="pid" type="number" value="{{ $meta->pid }}" class="form-control input-20" max="999">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">图标</span>
            <input name="icon" type="text" value="{{ $meta->icon }}" class="form-control input-50">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">排序</span>
            <input name="order" type="number" value="{{ $meta->order }}" class="form-control input-20" max="999">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">菜单</span>
            <input name="is_menu" type="number" @if($meta->is_menu === '') value="1" @else  value="0" @endif
                   class="form-control input-20" max="1" placeholder="0|1">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">路由名称</span>
            <input name="route" type="text" value="{{ $meta->route_name }}"
            class="form-control input-50">
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