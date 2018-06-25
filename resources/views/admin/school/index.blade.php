<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a class="btn btn-app bg-olive" href="{{ route('school.create') }}">
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
                            <th>名称</th>
                            <th>简称</th>
                            <th>地址</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending" style="width: 169px;">管理
                            </th>
                        </thead>
                        <tbody>
                        @foreach($schools as $school)
                            <tr role="row" class="{{ $school->id % 2 != 0 ? "odd" : "even"}}">
                                <td>{{ $school->name }}</td>
                                <td>{{ $school->short_name }}</td>
                                <td>{{ $school->address }}</td>
                                <td>
                                    <a href="{{ route('school.edit', ['id' => $school->id]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{ $schools->links() }}
                </div>
            </div>
        </div>
    </div>
</div>
@include('admin.layouts.footer')
</body>
</html>