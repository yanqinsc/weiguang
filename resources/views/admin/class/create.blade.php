<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-info create" method="post" action="{{ route('class.store') }}">
    {{ csrf_field() }}
    <div class="box-header with-border">
        <h3 class="box-title">{{ $title }}</h3>
    </div>
    <div class="box-body">
        <div class="form-group">
            <select name="school" class="form-control">
                <option value=""><i>选择学校</i></option>
                @foreach($schools as $school)
                <option value="{{ $school->id }}">{{ $school->short_name }}</option>
                @endforeach
            </select>
        </div>
        <div class="input-group">
            <span class="input-group-addon">届</span>
            <input name="grade" type="number" class="form-control" placeholder="毕业年份 2000-{{ config('app.grade_max') }}" min="2000" max="{{ config('app.grade_max') }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">班级</span>
            <input name="class" type="number" class="form-control" placeholder="1-50" min="1" max="50">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">类型</span>
            <input name="type" type="number" class="form-control" placeholder="1|初中 2|高中" min="1" max="2">
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