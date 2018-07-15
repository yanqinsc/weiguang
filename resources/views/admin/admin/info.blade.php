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

    #avatar {
        position: relative;
        width: 70px;
        height: 70px;
        border-radius: 35px;
        margin-bottom: 10px;
    }

    #change-avatar {
        text-align: center;
        padding-bottom: 5px;
        position: relative;
        display: block;
        width: 47px;
        height: 20px;
        border-radius: 10px;
        margin-top: -35px;
        margin-left: 9px;
        color: #d3d3d3;
        margin-bottom: 0;
        background-color: rgba(0, 0, 0, .3);
    }

</style>
<div class="box box-info list" style="width: 50%; margin-top: 50px;">
    <div class="box-body">
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <div id="avatar-box">
                        <img id="avatar" src="{{ $info->avatar . "?t=" . rand(0, 999) }}" alt="">
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
@include('admin.layouts.footer')

<div id="change-avatar-box">
    <link href="{{ asset('common/css/cropper.min.css') }}" rel="stylesheet">

    <style>
        /*更改头像*/
        #change-avatar-box {
            text-align: center;
        }

        #photo {
            max-width: 100%;
            max-height: 350px;
        }

        .img-preview-box {
            text-align: center;
            display: none;
        }

        .img-preview-box > div {
            display: inline-block;;
            margin-right: 10px;
        }

        .img-preview {
            overflow: hidden;
        }

        .img-preview-box .img-preview-lg {
            width: 150px;
            height: 150px;
        }

        .img-preview-box .img-preview-md {
            width: 100px;
            height: 100px;
        }

        .img-preview-box .img-preview-sm {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .user-photo-box img {
            border: 1px solid red;
            border-radius: 50px;
        }

        .btn-warning {
            margin-top: 6px;
        }

        /*end*/
    </style>

    <div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <p class="tip-info text-center">
                        未选择图片
                    </p>
                    <div class="img-container hidden">
                        <img src="" alt="" id="photo">
                    </div>
                    <div class="img-preview-box hidden">
                        <hr>
                        <span>150*150:</span>
                        <div class="img-preview img-preview-lg">
                        </div>
                        <span>100*100:</span>
                        <div class="img-preview img-preview-md">
                        </div>
                        <span>30*30:</span>
                        <div class="img-preview img-preview-sm">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <label class="btn btn-warning pull-left" for="photoInput">
                        <input type="file" class="sr-only" id="photoInput" accept="image/*">
                        <span>打开图片</span>
                    </label>
                    <button class="btn btn-primary disabled" disabled="true" onclick="sendPhoto();">提交</button>
                    <button class="btn btn-close" aria-hidden="true" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <script src="{{ asset('common/js/cropper.min.js') }}"></script>
    <script type="text/javascript">
        let initCropperInModal = function (img, input, modal) {
            let $image = img;
            let $inputImage = input;
            let $modal = modal;
            let options = {
                aspectRatio: 1, // 纵横比
                viewMode: 1, //待裁剪图片的显示方式 1-4
                preview: '.img-preview' // 预览图的class名
            };
            // 模态框隐藏后需要保存的数据对象
            let saveData = {};
            //let URL = window.URL || window.webkitURL;
            let blobURL;

            $modal.on('show.bs.modal', function () {
                // 如果打开模态框时没有选择文件就点击“打开图片”按钮
                if (!$inputImage.val()) {
                    $inputImage.click();
                }
            }).on('shown.bs.modal', function () {
                // 重新创建
                $image.cropper($.extend(options, {
                    ready: function () {
                        // 当剪切界面就绪后，恢复数据
                        if (saveData.canvasData) {
                            $image.cropper('setCanvasData', saveData.canvasData);
                            $image.cropper('setCropBoxData', saveData.cropBoxData);
                        }
                    }
                }));
            }).on('hidden.bs.modal', function () {
                // 保存相关数据
                saveData.cropBoxData = $image.cropper('getCropBoxData');
                saveData.canvasData = $image.cropper('getCanvasData');
                // 销毁并将图片保存在img标签
                $image.cropper('destroy').attr('src', blobURL);
            });

            if (URL) {
                $inputImage.change(function () {
                    let files = this.files;
                    let file;
                    if (!$image.data('cropper')) {
                        return;
                    }
                    if (files && files.length) {
                        file = files[0];
                        if (/^image\/\w+$/.test(file.type)) {

                            if (blobURL) {
                                URL.revokeObjectURL(blobURL);
                            }
                            blobURL = URL.createObjectURL(file);

                            // 重置cropper，将图像替换
                            $image.cropper('reset').cropper('replace', blobURL);

                            // 选择文件后，显示和隐藏相关内容
                            $('.img-container').removeClass('hidden');
                            $('.img-preview-box').removeClass('hidden');
                            $('#changeModal .disabled').removeAttr('disabled').removeClass('disabled');
                            $('#changeModal .tip-info').addClass('hidden');

                        } else {
                            window.alert('请选择一个图像文件！');
                        }
                    }
                });
            } else {
                $inputImage.prop('disabled', true).addClass('disabled');
            }
        };

        let sendPhoto = function () {
            // 得到PNG格式的dataURL
            let photo = $('#photo').cropper('getCroppedCanvas', {
                width: 300,
                height: 300
            }).toDataURL('image/png');

            $.ajax({
                url: '{{ route('admin.changeAvatar') }}', // 要上传的地址
                type: 'post',
                data: {
                    'imgData': photo
                },
                dataType: 'json',
                success: function (data) {
                    if (data.status === 200) {
                        // 为保证不载入缓存加个随机数
                        $('#avatar').attr('src', data.avatarUrl + '?t=' + Math.random());
                        $('#changeModal').modal('hide');
                    } else {
                        alert(data.message);
                    }
                }
            });
        };

        $(function () {
            initCropperInModal($('#photo'), $('#photoInput'), $('#changeModal'));
        });
    </script>
</div>

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
</script>
</body>
</html>