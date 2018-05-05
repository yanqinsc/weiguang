<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('ability.create') }}">
                <i class="fa fa-plus"></i>权限管理
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
                                aria-label="Browser: activate to sort column ascending" style="width: 242px;">排序
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Browser: activate to sort column ascending" style="width: 242px;">名称
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Platform(s): activate to sort column ascending" style="width: 216px;">标识
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending" style="width: 169px;">路由
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending" style="width: 169px;">管理
                            </th>
                        </thead>
                        <tbody>
                        @foreach($abilities as $ability)
                            <tr role="row" class="{{ $ability->id % 2 != 0 ? "odd" : "even"}}">
                                <td class="sorting_1">{{ $ability->id }}</td>
                                <td>{{ $ability->order }}</td>
                                <td><i class="sub-menu fa fa-plus-square-o"></i> {{ $ability->title }}</td>
                                <td>{{ $ability->name }}</td>
                                <td>{{ $ability->route_name }}</td>
                                <td>
                                    <a href="{{ route('ability.create', ['id' => $ability->id]) }}" title="添加下级权限"><i
                                                class="fa fa-plus"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="{{ route('ability.edit', ['id' => $ability->id]) }}" title="编辑"><i
                                                class="fa fa-edit"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:void(0) " data-url="{{ route('ability.destroy', ['id' => $ability->id]) }}"
                                       title="删除" class="a-remove"><i class="fa fa-trash"></i></a>
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
            执行该操作后该条记录将被永久删除，确定删除？
        </div>
        <br>
        <div class="timeline-footer">
            <button type="submit" class="btn btn-danger">确定</button>
            <button id="comfirm-cancel" type="button" class="btn btn-success">取消</button>
        </div>
    </div>
</form>
@include('admin.layouts.footer')
<script>
    $(function () {
        $(".sub-menu").click(function () {
            if ($(this).hasClass('fa-plus-square-o')) {
                $(this).removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
            } else {
                $(this).removeClass('fa-minus-square-o').addClass('fa-plus-square-o');
            }

            // $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });
            // let url = '/home/ability/sub?id=1';
            // $.get(url,function (result) {
            //     alert(result);
            // });
        });
    });
</script>
</body>
</html>