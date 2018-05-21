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
                    @foreach($abilities as $ability)
                        <ul class="top">
                            <li>
                                <label for="ability-{{ $ability->id }}">
                                    <input id="ability-{{ $ability->id }}" type="checkbox" value="{{ $ability->name }}"
                                           @if($ability->checked) checked @endif> {{ $ability->title }}
                                </label>
                            </li>
                            @if($ability->children)
                                <br>
                                <li>
                                    @foreach($ability->children as $son)
                                        <ul class="son">
                                            <li>
                                                <label for="ability-{{ $son->id }}">
                                                    <input id="ability-{{ $son->id }}" type="checkbox"
                                                           value="{{ $son->name }}"
                                                           @if($son->checked) checked @endif> {{ $son->title }}
                                                </label>
                                            </li>
                                            @if($son->children)
                                                <li>
                                                    <ul class="grandson">
                                                        <br>
                                                        @foreach($son->children as $grandson)
                                                            <li>
                                                                <label for="ability-{{ $grandson->id }}">
                                                                    <input id="ability-{{ $grandson->id }}"
                                                                           type="checkbox" value="{{ $grandson->name }}"
                                                                           @if($grandson->checked) checked @endif> {{ $grandson->title }}
                                                                </label>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </li>
                                            @endif
                                        </ul>
                                    @endforeach
                                </li>
                            @endif
                        </ul>
                    @endforeach
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