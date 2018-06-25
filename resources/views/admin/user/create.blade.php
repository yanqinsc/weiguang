<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('user.store') }}">
    {{ csrf_field() }}
    <div class="box-header with-border">
        <h3 class="box-title">{{ $title }}</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">账号</span>
            <input name="name" type="text" class="form-control" placeholder="只能是英文、数字组合，必填">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">密码</span>
            <input name="password" type="password" class="form-control" placeholder="必填" maxlength="50">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">姓名</span>
            <input name="real_name" type="text" class="form-control" placeholder="必填">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">Email</span>
            <input name="email" type="email" class="form-control" placeholder="必填">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">电话</span>
            <input name="phone" type="text" class="form-control">
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