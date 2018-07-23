<!doctype html>
<html lang="en">
@include('admin.layouts.header')
@include('UEditor::head')
<body>
<style>
    .thumb img {
        display: none;
    }
</style>
    <div class="top-box">
        <form id="create-article" method="post" action="{{ route('home.article.post') }}" class="box box-info article-edit">
            {{ csrf_field() }}
            <div class="box-header with-border">
                <h3 class="box-title">稿件</h3>
            </div>
            <div class="box-body">
                <input name="title" class="form-control" type="text" placeholder="在此处填写文章标题（必填）">
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <select name="category_id" class="form-control">
                            <option value="">选择分类（必选）</option>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <br>
                <div class="thumb" id="change-thumb" data-target="#changeModal" data-toggle="modal">
                    <p id="thumb-upload-text">上传缩略图</p>
                    <img id="uploaded-image" src="" alt="缩略图">
                    <input id="file-name" name="thumb" type="hidden">
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <input name="author" class="form-control" type="text" placeholder="作者（必填）">
                    </div>
                    <div class="col-md-3">
                        <input name="from" class="form-control" type="text" placeholder="单位：XX中学X年级X班">
                    </div>
                </div>
                <br>
                <input name="key_words" class="form-control" type="text" placeholder="关键词(必填，以英文“,”分割)">
                <br>
                <textarea name="excerpt" class="form-control" rows="3" placeholder="内容摘要(必填)"></textarea>
                <br>
                <label for="license">
                    <input type="checkbox" id="original" name="article_license" checked> <span class="color-red"> 本人保证稿件为原创文章并授权litlight.cn公开发布</span>
                </label>
                <br>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <!-- 加载编辑器的容器 -->
                        <script id="container" name="article_content" type="text/plain"></script>

                        <!-- 实例化编辑器 -->
                        <script type="text/javascript">
                            var ue = UE.getEditor('container');
                            ue.ready(function() {
                                //此处为支持laravel5 csrf ,根据实际情况修改,目的就是设置 _token 值.
                                ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
                            });
                        </script>
                    </div>
                    <div class="col-md-12">
                        上传图片大小不超过500k,如果上传图片错误请检查图片大小！
                    </div>
                </div>
                <br>
                <p class="color-red show-error left">@if($errors->any()) {{ $errors->first() }} @endif</p>
                <div class="box-footer">
                    {{--<button type="submit" value="2" class="btn btn-success right-gap">存草稿</button>--}}
                    <button type="submit" value="1" class="btn btn-danger">发表文章</button>
                </div>
            </div>
        </form>
    </div>
    {{--缩略图上传地址--}}
    <input type="hidden" id="post-url" value="{{ route('home.article.postThumb', ['type' => 'create']) }}">
    {{--缩略图对应对象ID--}}
    <input type="hidden" id="post-id" value="0">
    <script> let aspectRatio = 4/3; </script>
    @include('admin.layouts.footer')
    @include('include.cropper')
<script>
    $(function () {
        // 本地保存内容
        if ($.cookie('create_post')) {
            //新创建文章清空以前本地保存的内容
            $.removeCookie('create_post');
            ue.execCommand('clearlocaldata');
        } else {
            setTimeout(function () {
                ue.execCommand('drafts');
            }, 500);
        }

        if (isMobile()) {
            $("#change-thumb").hide();
        } else {
            $("#change-thumb").click(function () {
                let id = setInterval(function () {
                    let image = $("#uploaded-image");
                    let text = $("#thumb-upload-text");
                    if (image.attr('src') === '') {
                        image.hide();
                        text.show();
                    } else {
                        text.hide();
                        image.show();
                        window.clearInterval(id);
                    }
                }, 2000);
            });
        }
    });
</script>
</body>
</html>