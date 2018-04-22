<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
    <form class="box box-info create" method="post" action="{{ route('ability.store') }}">
        {{ csrf_field() }}
        <div class="box-header with-border">
            <h3 class="box-title">添加权限</h3>
        </div>
        <div class="box-body">
            <div class="input-group">
                <span class="input-group-addon">名称</span>
                <input name="name" type="text" class="form-control" placeholder="只能是英文、数字或下划线的组合">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">注释</span>
                <input name="title" type="text" class="form-control">
            </div>
        </div>
        <p class="color-red show-error">@if($errors->has('name')) {{ $errors->first() }} @endif</p>
        <div class="box-footer">
            <button type="submit" class="btn btn-primary">添加</button>
        </div>
    </form>
    @include('admin.layouts.footer')
</body>
</html>