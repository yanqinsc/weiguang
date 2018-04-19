@extends('admin.layouts.base')

@section('content')
    <form class="box box-info create" method="post" action="{{ route('ability.store') }}">
        {{ csrf_field() }}
        <div class="box-header with-border">
            <h3 class="box-title">添加权限</h3>
        </div>
        <div class="box-body">
            <div class="input-group">
                <span class="input-group-addon">标识</span>
                <input name="name" type="text" class="form-control">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">注释</span>
                <input name="title" type="text" class="form-control">
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-primary">添加</button>
        </div>
    </form>
@endsection