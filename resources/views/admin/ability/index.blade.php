<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('ability.create') }}">
                <i class="fa fa-plus"></i>添加
            </a>
        </div>
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th>ID</th>
                            <th>名称</th>
                            <th>标识</th>
                            <th>管理</th>
                        </thead>
                        <tbody>
                        @foreach($abilities as $ability)
                            <tr role="row" class="{{ $ability->id % 2 != 0 ? "odd" : "even"}}">
                                <td class="sorting_1">{{ $ability->id }}</td>
                                <td>{{ $ability->title }}</td>
                                <td>{{ $ability->name }}</td>
                                <td>
                                    <a href="{{ route('ability.edit', ['id' => $ability->id]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('ability.destroy', ['id' => $ability->id]) }}"
                                       title="删除" class="a-remove">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="form-destroy" method="post">
    {{ method_field('DELETE') }}
    {{ csrf_field() }}
    <div>
        <div>
            执行该操作后，该权限将被永久删除，所有拥有该权限的用户都将受到影响，确定删除？
        </div>
        <br>
        <div class="timeline-footer">
            <button type="submit" class="btn btn-danger">确定</button>
            <button id="comfirm-cancel" type="button" class="btn btn-success">取消</button>
        </div>
    </div>
</form>
@include('admin.layouts.footer')
</body>
</html>