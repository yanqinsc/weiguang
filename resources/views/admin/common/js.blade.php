<script src="{{asset('admin/adminlte/bower_components/jquery/dist/jquery.min.js')}}"></script>
<script src="{{asset('admin/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js')}}"></script>
<script src="{{asset('admin/adminlte/dist/js/adminlte.min.js')}}"></script>
<script src="{{asset('admin/adminlte/plugins/iCheck/icheck.min.js')}}"></script>
<script>
    //iframe和表格自适应高度
    function iframeHeight() {
        let windowHeight = $(window).height();
        $("#sub_page").height(windowHeight + 'px');
        $(".list").height(windowHeight -150 + 'px');
    }

    iframeHeight();
    $(window).resize(function () {
        iframeHeight()
    });
</script>


