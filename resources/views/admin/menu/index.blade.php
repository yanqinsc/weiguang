<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('menu.create') }}">
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
                            <th class="mobile-hide">ID</th>
                            <th class="mobile-hide">PID</th>
                            <th>名称</th>
                            <th class="mobile-hide">图标</th>
                            <th class="mobile-hide">路由</th>
                            <th>管理</th>
                        </thead>
                        <tbody>
                        @foreach($menu as $key => $item)
                            <tr role="row" class="success">
                                <td class="mobile-hide">{{ $item['id'] }}</td>
                                <td class="mobile-hide">{{ $item['pid'] }}</td>
                                <td>{{ $item['title'] }}</td>
                                <td class="mobile-hide"><i class="fa {{ $item['icon'] }}"></i></td>
                                <td class="mobile-hide">{{ $item['route_name'] }}</td>
                                <td>
                                    <a href="{{ route('menu.edit', ['id' => $item['id']]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('menu.destroy', ['id' => $item['id']]) }}"
                                       title="删除" class="a-remove">
                                        <i class="fa fa-ban"></i>
                                    </a>
                                </td>
                            </tr>
                            @if(!empty($item['sub_menu']))
                                @foreach($item['sub_menu'] as $key => $val)
                                    <tr role="row" class="{{ $key % 2 != 0 ? "odd" : "even"}}">
                                        <td class="mobile-hide">{{ $val['id'] }}</td>
                                        <td class="mobile-hide">{{ $val['pid'] }}</td>
                                        <td>{{ $val['title'] }}</td>
                                        <td class="mobile-hide"><i class="fa {{ $val['icon'] }}"></i></td>
                                        <td class="mobile-hide">{{ $val['route_name'] }}</td>
                                        <td>
                                            <a href="{{ route('menu.edit', ['id' => $val['id']]) }}" title="编辑">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="javascript:void(0) "
                                               data-url="{{ route('menu.destroy', ['id' => $val['id']]) }}"
                                               title="删除" class="a-remove">
                                                <i class="fa fa-ban"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
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