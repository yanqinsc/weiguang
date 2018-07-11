<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<style>
    .edit-input {
        display: none;
        width: 100%!important;
    }

    .fa-pencil {
        font-size: 12px;
    }
</style>
<div class="box box-info list" style="width: 50%; margin-top: 50px;">
    <div class="box-body">
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <tbody>
                            <tr role="row" class="odd">
                                <td width="80"><b>账号</b></td>
                                <td colspan="2">{{ $info->name }}</td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>Email</b></td>
                                <td colspan="2">{{ $info->email }}</td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>昵称</b></td>
                                <td>
                                    <span>
                                        {{ $info->nickname }}
                                        <a href="javascript:void(0)">
                                            <i data-name="nickname" class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                    <input id="nickname" type="text" name="nickname" class="edit-input" autofocus>
                                </td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>姓名</b></td>
                                <td>
                                    <span>
                                        {{ $info->real_name }}
                                        <a href="javascript:void(0)"><i data-name="real_name" class="fa fa-pencil"></i></a>
                                    </span>
                                    <input id="real_name" type="text" name="real_name" class="edit-input" autofocus>
                                </td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>头像</b></td>
                                <td>
                                    <span>
                                        <img width="20" height="20" src="{{ $info->avatar }}" alt="头像">
                                        <a href="javascript:void(0)"><i data-name="avatar" class="fa fa-pencil"></i></a>
                                    </span>
                                    <form id="avatar" enctype="multipart/form-data" method="post" class="edit-input" >
                                        <input name="avatar" type="file" multiple>
                                        {{ csrf_field() }}
                                    </form>
                                </td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>电话</b></td>
                                <td>
                                    <span>
                                        {{ $info->phone }}
                                        <a href="javascript:void(0)"><i data-name="phone" class="fa fa-pencil"></i></a>
                                    </span>
                                    <input id="phone" type="text" name="phone" class=" edit-input" autofocus>
                                </td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>QQ</b></td>
                                <td>
                                    <span>{{ $info->qq }}<a href="javascript:void(0)"><i data-name="qq" class="fa fa-pencil"></i></a></span>
                                    <input id="qq" type="text" name="qq" class="edit-input" autofocus>
                                </td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>格言</b></td>
                                <td>
                                    <span>
                                        {{ $info->motto }}
                                        <a href="javascript:void(0)"><i data-name="motto" class="fa fa-pencil"></i></a>
                                    </span>
                                    <input id="motto" type="text" name="motto" class="edit-input" autofocus>
                                </td>
                            </tr>
                            <tr role="row" class="odd">
                                <td><b>地址</b></td>
                                <td>
                                    <span>
                                        {{ $info->address }}
                                        <a href="javascript:void(0)"><i data-name="address" class="fa fa-pencil"></i></a></span>
                                    <input id="address" type="text" name="address" class="edit-input" autofocus>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@include('admin.layouts.footer')
<script>
    $(function () {
        $(".fa-pencil").click(function () {
            let input = $("#" + $(this).attr('data-name'));
            if (input.css('display') === 'none') {
                input.show().prev('span').hide();
            }
        });

        $("input[type=text]").blur(function () {
            $(this).hide().prev('span').text($(this).val()).show();
        });






    });
</script>
</body>
</html>