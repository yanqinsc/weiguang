<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('school.update', ['id' => $id]) }}">
    {{ csrf_field() }}
    {{ method_field('PUT') }}
    <div class="box-header with-border">
        <h3 class="box-title">{{ $title }}</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input name="name" type="text" class="form-control" placeholder="{{ $school->name }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">简称</span>
            <input name="short_name" type="text" class="form-control"  placeholder="{{ $school->short_name }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">地址</span>
            <input name="address" type="text" class="form-control" placeholder="{{ $school->address }}">
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