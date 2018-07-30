<!doctype html>
<html lang="en">
@include('admin.layouts.header')
@include('UEditor::head')
<body>
<style>
    form {
        position: relative !important;
    }

    #thumb-upload-text {
        display: none;
    }
</style>
    <div class="top-box">
        <form id="create-article" method="post" action="{{ route('home.article.update', ['id' => $article->id]) }}" class="box box-info article-edit">
            {{ csrf_field() }}
            {{ method_field('PUT') }}
            <div class="box-header with-border">
                <h3 class="box-title">{{ $title }}</h3>
            </div>
            <div class="box-body">
                <input name="title" class="form-control" type="text" placeholder="{{ $article->title }}">
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <select name="category_id" class="form-control">
                            <option value="">选择分类（必选）</option>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}" @if($article->category_id == $category->id) selected @endif>{{ $category->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <br>
                <div class="thumb" id="change-thumb" data-target="#changeModal" data-toggle="modal">
                    <p id="thumb-upload-text">上传缩略图</p>
                    <img id="uploaded-image"
                     @if($article->thumb)
                         src="{{ $article->thumb . '?t=' . rand(1000, 9999) }}"
                        @else
                         src=""
                    @endif alt="缩略图">
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <input name="author" class="form-control" type="text" placeholder="{{ $article->author }}">
                    </div>
                    <div class="col-md-3">
                        <input name="from" class="form-control" type="text" placeholder="{{ $article->from }}">
                    </div>
                </div>
                <br>
                <input name="key_words" class="form-control" type="text" value="{{ $article->key_words }}">
                <br>
                <textarea name="excerpt" class="form-control" rows="3">{{ $article->excerpt }}</textarea>
                <br>
                <label for="license">
                    <input type="checkbox" id="original" name="article_license" checked> <span class="color-red"> 本人保证稿件为原创文章并授权litlight.cn公开发布</span>
                </label>
                <br>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <!-- 加载编辑器的容器 -->
                        <script id="container" name="article_content" type="text/plain">{!! $article->content !!}</script>

                        <!-- 实例化编辑器 -->
                        <script type="text/javascript">
                            var ue = UE.getEditor('container');
                            ue.ready(function() {
                                //此处为支持laravel5 csrf ,根据实际情况修改,目的就是设置 _token 值.
                                ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
                            });
                        </script>
                    </div>
                    <div class="col-md-12 color-red">上传图片大小不超过500k,如果上传图片错误请检查图片大小！</div>
                </div>
                <br>
                <p class="color-red show-error left">@if($errors->any()) {{ $errors->first() }} @endif</p>
                <div class="box-footer">
                    <button type="submit" class="btn btn-danger">提交</button>
                </div>
            </div>
        </form>
    </div>
{{--缩略图上传地址--}}
<input type="hidden" id="post-url" value="{{ route('home.article.postThumb', ['type' => 'edit']) }}">
{{--缩略图对应对象ID--}}
<input type="hidden" id="post-id" value="{{ $article->id }}">
<script> let aspectRatio = 4/3; </script>
@include('admin.layouts.footer')
@include('include.cropper')
<script>
    $(function () {
        if ($("#uploaded-image").attr('src') === '') {
            $("#uploaded-image").hide();
            $("#thumb-upload-text").show();
        }

        if (isMobile()) {
            $("#change-thumb").hide();
        }

        $("#change-thumb").click(function () {
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
        });
    });
</script>
</body>
</html>