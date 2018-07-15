<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('admin.updatePassword') }}">
    {{ csrf_field() }}
    <div class="box-header with-border">
        <h3 class="box-title">修改密码</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">原密码</span>
            <input name="password" type="password" class="form-control">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">新密码</span>
            <input name="new_password" type="password" class="form-control">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">确认密码</span>
            <input name="new_password_confirmation" type="password" class="form-control">
        </div>
    </div>
    <p class="color-red show-error">@if($errors->any()) {{ $errors->first() }} @endif</p>
    <p class="color-red show-error">{{ session('message') }}</p>
    <div class="box-footer">
        <button type="submit" class="btn btn-primary">提交</button>
    </div>
</form>
@include('admin.layouts.footer')
</body>
</html>