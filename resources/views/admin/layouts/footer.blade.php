<input type="hidden" id="title" value="{{ $title }}">
@include('admin.common.js')
<script src="{{ asset('admin/js/custom.js') }}"></script>
<script src="{{ asset('common/js/jquery.cookie.js') }}"></script>
<script src="{{ asset('common/js/custom/jump.js') }}"></script>
<script>
    // 为ajax设置CSRF_TOKEN
    $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});
</script>


