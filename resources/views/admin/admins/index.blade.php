<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('admins.create') }}">
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
                            <th>账号</th>
                            <th class="mobile-hide">昵称</th>
                            <th>真实姓名</th>
                            <th class="mobile-hide">Email</th>
                            <th class="mobile-hide">地址</th>
                            <th class="mobile-hide">电话</th>
                            <th class="mobile-hide">座右铭</th>
                            <th>角色</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending" style="width: 169px;">管理
                            </th>
                        </thead>
                        <tbody>
                        @if($users->count())
                            @foreach($users as $user)
                            <tr role="row" class="{{ $user->id % 2 != 0 ? "odd" : "even"}}">
                                <td>{{ $user->name }}</td>
                                <td class="mobile-hide">{{ $user->nickname }}</td>
                                <td>{{ $user->real_name }}</td>
                                <td class="mobile-hide">{{ $user->email }}</td>
                                <td class="mobile-hide">{{ $user->address }}</td>
                                <td class="mobile-hide">{{ $user->phone }}</td>
                                <td class="mobile-hide">{{ $user->motto }}</td>
                                <td>{{ $user->role }}</td>
                                <td>
                                    <a href="{{ route('admins.edit', ['id' => $user->id]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('admins.destroy', ['id' => $user->id]) }}"
                                       title="删除" class="a-remove">
                                        <i class="fa fa-ban"></i>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                        @else
                            <tr role="row"><td colspan="10">暂无记录</td></tr>
                        @endif
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
            执行该操作后，该账户将被禁用，确定？
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