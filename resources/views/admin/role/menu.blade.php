<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th>选择</th>
                            <th>名称</th>
                            <th>图标</th>
                            <th>路由</th>
                        </thead>
                        <tbody>
                        @foreach($menu as $key => $item)
                            <tr role="row" class="success">
                                <td><input id="menu-{{ $item['id'] }}" type="checkbox" value="{{ $item['id'] }}"
                                           @if(!empty($item['checked'])) checked @endif></td>
                                <td>{{ $item['title'] }}</td>
                                <td><i class="fa {{ $item['icon'] }}"></i></td>
                                <td>{{ $item['route_name'] }}</td>
                            </tr>
                            @if(!empty($item['sub_menu']))
                                @foreach($item['sub_menu'] as $key => $val)
                                    <tr role="row" class="{{ $key % 2 != 0 ? "odd" : "even"}}">
                                        <td><input id="menu-{{ $val['id'] }}" type="checkbox" value="{{ $val['id'] }}"
                                                   @if(!empty($item['checked'])) checked @endif></td>
                                        <td>{{ $val['title'] }}</td>
                                        <td><i class="fa {{ $val['icon'] }}"></i></td>
                                        <td>{{ $val['route_name'] }}</td>
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
<script type="text/javascript">
    $(':checkbox').change(function () {
        let url = '{{ route('role.set_menu') }}';
        let data = {
            _token: '{{ csrf_token() }}',
            role_id: '{{ $role_id }}',
            menu_id: $(this).val(),
            allow: !!$(this).is(':checked')
        };
        $.post(url, data);
    });
</script>
</body>
</html>