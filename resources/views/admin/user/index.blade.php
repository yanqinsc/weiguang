<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        @if(Auth::user()->can('user-create'))
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('user.create') }}">
                <i class="fa fa-plus"></i>添加
            </a>
        </div>
        @endif
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th>账号</th>
                            <th>昵称</th>
                            <th class="mobile-hide">姓名</th>
                            <th class="mobile-hide">Email</th>
                            <th class="mobile-hide">地址</th>
                            <th class="mobile-hide">格言</th>
                            <th class="mobile-hide">头像</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending" style="width: 169px;">管理
                            </th>
                        </thead>
                        <tbody>
                        @if($users->count())
                            @foreach($users as $user)
                            <tr role="row">
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->nickname }}</td>
                                <td class="mobile-hide">{{ $user->real_name }}</td>
                                <td class="mobile-hide">{{ $user->email }}</td>
                                <td class="mobile-hide">{{ mb_substr($user->address, 0, 8) }} @if(mb_strlen($user->address) > 8) ... @endif</td>
                                <td class="mobile-hide">{{ mb_substr($user->motto, 0, 8) }} @if(mb_strlen($user->motto) > 8) ... @endif</td>
                                <td class="mobile-hide"><img width="25" height="23" src="{{ $user->avatar }}" alt=""></td>
                                <td>
                                    @if(Auth::user()->can('user-edit'))
                                    <a href="{{ route('user.edit', ['id' => $user->id]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    @endif
                                    @if(Auth::user()->can('user-forbiden'))
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('user.destroy', ['id' => $user->id]) }}"
                                       title="删除" class="a-remove">
                                        <i class="fa fa-ban"></i>
                                    </a>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        @else
                            <tr role="row"><td colspan="10">暂无记录</td></tr>
                        @endif
                        </tbody>
                    </table>
                    {{ $users->links() }}
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