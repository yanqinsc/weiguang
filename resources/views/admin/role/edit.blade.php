<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('role.update', ['id' => $id]) }}">
    {{ csrf_field() }}
    {{ method_field('PUT') }}
    <div class="box-header with-border">
        <h3 class="box-title">编辑角色</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">标识</span>
            <input name="name" type="text" value="{{ $role->name }}"
                   class="form-control" placeholder="只能是英文、数字或下划线的组合">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input name="title" type="text" value="{{ $role->title }}" class="form-control">
        </div>
        <br>
    </div>
    <p class="color-red show-error">@if($errors->any()) {{ $errors->first() }} @endif</p>
    <div class="box-footer">
        <button type="submit" class="btn btn-primary">更新</button>
    </div>
</form>
@include('admin.layouts.footer')
</body>
</html>