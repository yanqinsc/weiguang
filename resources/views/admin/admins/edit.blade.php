<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="top-box">
    <form class="box box-info create" method="post" action="{{ route('admins.update', ['id' => $id]) }}">
        {{ csrf_field() }}
        {{ method_field('PUT') }}
        <div class="box-header with-border">
            <h3 class="box-title">{{ $title }}</h3>
        </div>
        <div class="box-body">
            <div class="input-group">
                <span class="input-group-addon">账号</span>
                <input name="name" type="text" class="form-control" value="{{ $user->name }}" readonly>
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">昵称</span>
                <input name="nickname" type="text" class="form-control" placeholder="{{ $user->nickname }}">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">姓名</span>
                <input name="real_name" type="text" class="form-control" placeholder="{{ $user->real_name }}">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">Email</span>
                <input name="email" type="email" class="form-control"  placeholder="{{ $user->email }}">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">电话</span>
                <input name="phone" type="text" class="form-control" placeholder="{{ $user->phone }}" >
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">地址</span>
                <input name="phone" type="text" class="form-control" placeholder="{{ $user->address }}" >
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">头像</span>
                <input name="avatar" type="text" class="form-control" placeholder="{{ $user->avatar }}" >
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">格言</span>
                <input name="motto" type="text" class="form-control" placeholder="{{ $user->motto }}" >
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">密码</span>
                <input name="password" type="password" class="form-control">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">角色</span>
                <select name="role" class="form-control" id="">
                    @foreach($roles as $role)
                    <option value="{{ $role->name }}" {{ $role->name == $user->role ? 'selected' : '' }}>{{ $role->title }}</option>
                    @endforeach
                </select>
                {{--<input name="role" type="text" class="form-control" placeholder="{{ $user->role }}" >--}}
            </div>
        </div>
        <p class="color-red show-error">@if($errors->any()) {{ $errors->first() }} @endif</p>
        <div class="box-footer">
            <button type="submit" class="btn btn-primary">更新</button>
        </div>
    </form>
</div>
@include('admin.layouts.footer')
</body>
</html>