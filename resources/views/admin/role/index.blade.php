<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('role.create') }}">
                <i class="fa fa-plus"></i> 添加
            </a>
        </div>
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending"
                                style="width: 197px;">ID
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Browser: activate to sort column ascending" style="width: 242px;">标识
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Platform(s): activate to sort column ascending" style="width: 216px;">名称
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending" style="width: 169px;">管理
                            </th>
                        </thead>
                        <tbody>
                        @foreach($roles as $role)
                            <tr role="row" class="{{ $role->id % 2 != 0 ? "odd" : "even"}}">
                                <td class="sorting_1">{{ $role->id }}</td>
                                <td>{{ $role->name }}</td>
                                <td>{{ $role->title }}</td>
                                <td>
                                    <a href="{{ route('role.edit', ['id' => $role->id]) }}" title="编辑"><i
                                                class="fa fa-edit"></i></a>
                                    <a href="javascript:void(0) " data-url="{{ route('role.destroy', ['id' => $role->id]) }}"
                                       title="删除" class="a-remove"><i class="fa fa-trash"></i></a>
                                    <a href="{{ route('role.permissions', ['name' => $role->name]) }}" title="配置权限"><i
                                                class="fa fa-cogs"></i></a>
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
            执行该操作后,该角色将被永久删除，所有归属于该角色的用户都将受到影响，确定删除？
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