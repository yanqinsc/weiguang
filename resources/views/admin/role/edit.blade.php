@extends('admin.layouts.base')

@section('content')
    <form class="box box-info create" method="post" action="{{ route('ability.update', ['id' => $id]) }}">
        <div class="box-header with-border">
            <h3 class="box-title">更新权限</h3>
        </div>
        @if($errorMsg)
            <p class="color-red show-error">@if($errors->any()) {{ $errors->first() }} @endif</p>
        @else
            <input type="hidden" name="_method" value="put">
            {{ csrf_field() }}
            <div class="box-body">
                <div class="input-group">
                    <span class="input-group-addon">名称</span>
                    <input name="name" type="text" class="form-control" placeholder="只能是英文、数字或下划线的组合"
                           value="{{ $info->name }}">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon">注释</span>
                    <input name="title" type="text" class="form-control" value="{{ $info->title }}">
                </div>
            </div>
            <p class="color-red show-error">@if($errors->any()) {{ $errors->first() }} @endif</p>
            <div class="box-footer">
                <button type="submit" class="btn btn-primary">更新</button>
            </div>
        @endif
    </form>
@endsection