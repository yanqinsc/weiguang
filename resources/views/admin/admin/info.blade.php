<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<style>
    .edit-input {
        display: none;
        width: 100% !important;
    }

    .fa-pencil {
        font-size: 12px;
        margin-left: 10px;
    }

    #avatar-box {
        width: 15px;
        margin-bottom: 16px;
        margin-left: 45%;
    }

    #uploaded-image {
        position: relative;
        width: 70px;
        height: 70px;
        border-radius: 35px;
        margin-bottom: 10px;
    }
</style>
<div class="box box-info list-form">
    <div class="box-body">
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <div id="avatar-box">
                        <img id="uploaded-image" src="{{ $info->avatar ? $info->avatar . "?t=" . rand(0, 999) : asset('cms/images/avatar.png') }}" alt="">
                        <a href="javascript:void(0)" id="change-avatar" data-target="#changeModal" data-toggle="modal">更换</a>
                    </div>
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <tbody>
                        <tr role="row">
                            <td width="80"><b>账号</b></td>
                            <td colspan="2">{{ $info->name }}</td>
                        </tr>
                        <tr role="row">
                            <td><b>Email</b></td>
                            <td colspan="2">{{ $info->email }}</td>
                        </tr>
                        <tr role="row">
                            <td><b>昵称</b></td>
                            <td>
                                    <span>
                                        <span id="info-nickname">{{ $info->nickname }}</span>
                                        <a href="javascript:void(0)">
                                            <i data-name="nickname" class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                <input id="nickname" type="text" name="nickname" class="edit-input">
                            </td>
                        </tr>
                        <tr role="row">
                            <td><b>姓名</b></td>
                            <td>
                                    <span>
                                        <span id="info-real_name">{{ $info->real_name }}</span>
                                        <a href="javascript:void(0)"><i data-name="real_name" class="fa fa-pencil"></i></a>
                                    </span>
                                <input id="real_name" type="text" name="real_name" class="edit-input">
                            </td>
                        </tr>
                        <tr role="row">
                            <td><b>手机</b></td>
                            <td>
                                    <span>
                                        <span id="info-phone">{{ $info->phone }}</span>
                                        <a href="javascript:void(0)"><i data-name="phone" class="fa fa-pencil"></i></a>
                                    </span>
                                <input id="phone" type="text" name="phone" class="edit-input">
                            </td>
                        </tr>
                        <tr role="row">
                            <td><b>QQ</b></td>
                            <td>
                                    <span>
                                        <span id="info-qq">{{ $info->qq }}</span>
                                        <a href="javascript:void(0)"><i data-name="qq"
                                                                        class="fa fa-pencil"></i></a></span>
                                <input id="qq" type="text" name="qq" class="edit-input">
                            </td>
                        </tr>
                        <tr role="row">
                            <td><b>座右铭</b></td>
                            <td>
                                    <span>
                                        <span id="info-motto">{{ $info->motto }}</span>
                                        <a href="javascript:void(0)"><i data-name="motto" class="fa fa-pencil"></i></a></span>
                                <input id="motto" type="text" name="motto" class="edit-input">
                            </td>
                        </tr>
                        <tr role="row">
                            <td><b>地址</b></td>
                            <td>
                                    <span>
                                        <span id="info-address">{{ $info->address }}</span>
                                        <a href="javascript:void(0)"><i data-name="address"
                                                                        class="fa fa-pencil"></i></a></span>
                                <input id="address" type="text" name="address" class="edit-input">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <p class="show-error color-red"></p>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="post-url" value="{{ route('admin.changeAvatar') }}">
<input type="hidden" id="post-id" value="0">
<script> let aspectRatio = 1; </script>
@include('admin.layouts.footer')
@include('include.cropper')

<script>
    $(function () {
        $(".fa-pencil").click(function () {
            let input = $("#" + $(this).attr('data-name'));
            if (input.css('display') === 'none') {
                input.show().prev('span').hide();
                input.focus();
            }
        });

        $("input[type=text]").blur(function () {
            if ($(this).val()) {
                // 提交修改信息
                $.ajax({
                    url: '{{ route('admin.update') }}',
                    type: 'post',
                    data:
                        {
                            key: $(this).attr('name'),
                            value: $(this).val()
                        },
                    dataType: 'json',
                    success: function (data) {
                        if (data.status === 200) {
                            $("#info-" + data.name).html(data.val);
                        } else {
                            $(".show-error").html(data.message);
                        }
                    }
                });
                $(this).val('');
            }
            $(this).hide().prev('span').show();
        });
    });

    // 为ajax设置CSRF_TOKEN
    $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});

    if (isMobile()) {
        $("#change-avatar").hide();
    }
</script>
</body>
</html>