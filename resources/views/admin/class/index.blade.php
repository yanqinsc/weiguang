<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('class.create') }}">
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
                            <th>学校</th>
                            <th>年级</th>
                            <th>班级</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending" style="width: 169px;">管理
                            </th>
                        </thead>
                        <tbody>
                        @foreach($classes as $class)
                            <tr role="row" class="{{ $class->id % 2 != 0 ? "odd" : "even"}}">
                                <td>{{ $class->short_name }}</td>
                                <td>{{ $getGradeName($class->grade, $class->type) }}</td>
                                <td>{{ $class->class }}</td>
                                <td>
                                    <a href="{{ route('class.edit', ['id' => $class->id]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{ $classes->links() }}
                </div>
            </div>
        </div>
    </div>
</div>
@include('admin.layouts.footer')
</body>
</html>