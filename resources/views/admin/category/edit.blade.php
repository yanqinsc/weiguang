<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<form class="box box-warning create" method="post" action="{{ route('category.update', ['id' => $id]) }}">
    {{ csrf_field() }}
    {{ method_field('PUT') }}
    <div class="box-header with-border">
        <h3 class="box-title">编辑分类</h3>
    </div>
    <div class="box-body">
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input name="name" type="text" class="form-control"  maxlength="50" placeholder="{{ $category->name }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">标识</span>
            <input name="slug" type="text" class="form-control" max="99" placeholder="{{ $category->slug }}">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">上级分类</span>
            <select name="pid" class="form-control" id="">
                <option value="0">顶级分类</option>
                @foreach($tops as $top)
                    <option value="{{ $top->id }}" @if($category->pid == $top->id) selected @endif>{{ $top->name }}</option>
                @endforeach
            </select>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">导航栏展示</span>
            <select name="is_nav" class="form-control" id="">
                <option value="1">是</option>
                <option value="0" @if($category->is_nav === null) selected @endif>否</option>
            </select>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">允许投稿</span>
            <select name="allow_post" class="form-control" id="">
                <option value="0">否</option>
                <option value="1">是</option>
            </select>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">描述</span>
            <input name="desc" type="text" class="form-control" maxlength="50" placeholder="{{ $category->desc }}">
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