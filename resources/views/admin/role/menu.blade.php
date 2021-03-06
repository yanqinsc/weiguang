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
                            <th class="mobile-hide">图标</th>
                            <th>路由</th>
                        </thead>
                        <tbody>
                        @if($menu)
                            @foreach($menu as $key => $item)
                                <tr role="row" class="success">
                                    <td><input id="menu-{{ $item['id'] }}" type="checkbox" value="{{ $item['id'] }}"
                                               @if($item['checked']) checked @endif></td>
                                    <td>{{ $item['title'] }}</td>
                                    <td class="mobile-hide"><i class="fa {{ $item['icon'] }}"></i></td>
                                    <td>{{ $item['route_name'] }}</td>
                                </tr>
                                @if(!empty($item['sub_menu']))
                                    @foreach($item['sub_menu'] as $key => $val)
                                        <tr role="row" class="{{ $key % 2 != 0 ? "odd" : "even"}}">
                                            <td><input id="menu-{{ $val['id'] }}" type="checkbox" value="{{ $val['id'] }}"
                                                       @if($val['checked']) checked @endif></td>
                                            <td>{{ $val['title'] }}</td>
                                            <td class="mobile-hide"><i class="fa {{ $val['icon'] }}"></i></td>
                                            <td>{{ $val['route_name'] }}</td>
                                        </tr>
                                    @endforeach
                                @endif
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
@include('admin.layouts.footer')
<script type="text/javascript">
    $(':checkbox').change(function () {
        let url = '{{ route('role.setMenu') }}';
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