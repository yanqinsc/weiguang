<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<link rel="stylesheet" href="{{ asset('admin/css/permissions.css') }}">
<body>

<div class="box box-danger list">
    <div class="box-body">
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th style="width: 8px;">授权</th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Browser: activate to sort column ascending" style="width: 242px;">名称
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                aria-label="Platform(s): activate to sort column ascending" style="width: 216px;">标识
                            </th>
                        </thead>
                        <tbody>
                            @foreach($abilities as $ability)
                            <tr role="row">
                                <td>
                                    <input id="ability-{{ $ability->id }}" type="checkbox" value="{{ $ability->name }}"
                                           @if($ability->checked) checked @endif>
                                </td>
                                <td>{{ $ability->title }}</td>
                                <td>{{ $ability->name }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="roleName" value="{{ $roleName }}">
</div>
@include('admin.layouts.footer')
<script type="text/javascript">
    $(':checkbox').change(function () {
        let url = '{{ route('role.authorize') }}';
        let data = {
            _token: '{{ csrf_token() }}',
            role: $('[name=roleName]').val(),
            ability: $(this).val(),
            allow: !!$(this).is(':checked')
        };
        $.post(url, data);
    });
</script>
</body>
</html>