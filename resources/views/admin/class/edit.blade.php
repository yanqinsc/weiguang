<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('class.update', ['id' => $id]) }}">
    {{ csrf_field() }}
    {{ method_field('PUT') }}
    <div class="box-header with-border">
        <h3 class="box-title">{{ $title }}</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">学校</span>
            <input type="text" class="form-control" placeholder="{{ $class->short_name }}" disabled>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">届</span>
            <input name="grade" type="number" class="form-control" placeholder="{{ $class->grade }}" min="2000" max="{{ config('app.grade_max') }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">班级</span>
            <input name="class" type="number" class="form-control" placeholder="{{ $class->class }}" min="1" max="50">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">类型</span>
            <input name="type" type="number" class="form-control" placeholder="{{ $class->type }}" min="1" max="2">
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