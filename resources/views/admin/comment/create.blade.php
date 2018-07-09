<!doctype html>
<html lang="en">
@include('admin.layouts.header')
@include('UEditor::head')
<body>
<style>
    #hot, #top, .top-2 {
        float: left;
        display: block;
    }

    .top-2 {
        margin-top: -1px;
        margin-left: 2px;
    }
</style>
    <div class="top-box">
        <form id="create-article" method="post" action="{{ route('article.store') }}" class="box box-info article-edit">
            {{ csrf_field() }}
            <div class="box-header with-border">
                <h3 class="box-title">写文章</h3>
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
                <div class="row">
                    <div class="col-md-2">
                        <input name="author" class="form-control" type="text" placeholder="作者姓名（必填）">
                    </div>
                    <div class="col-md-3">
                        <input name="from" class="form-control" type="text" placeholder="作者单位：XX中学八年级3班">
                    </div>
                    <div class="col-md-3">
                        <input name="username" class="form-control" type="text" placeholder="用户账号">
                    </div>
                </div>
                <br>
                <input name="key_words" class="form-control" type="text" placeholder="关键词">
                <br>
                <input name="thumb" class="form-control" type="text" placeholder="缩略图">
                <br>
                <textarea name="excerpt" class="form-control" rows="3" placeholder="内容摘要"></textarea>
                <br>
                <label for="" class="right-15">
                    <input type="checkbox" id="top" name="top"> <span class="top-2">置顶</span>
                </label>
                <label for="">
                    <input type="checkbox" id="hot" name="hot"> <span  class="top-2">热点</span>
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
                </div>
                <br>
                <p class="color-red show-error left">@if($errors->any()) {{ $errors->first() }} @endif</p>
                <div class="box-footer">

                    <button type="submit" value="2" class="btn btn-success right-gap">存草稿</button>
                    <button type="submit" value="1" class="btn btn-danger">发表文章</button>
                </div>
            </div>
        </form>
    </div>
    @include('admin.layouts.footer')
<script>
    // 本地保存内容
    if ($.cookie('create_article')) {
        //新创建文章清空以前本地保存的内容
        $.removeCookie('create_article');
        ue.execCommand('clearlocaldata');
    } else {
        setTimeout(function () {
            ue.execCommand('drafts');
        }, 500);
    }
</script>
</body>
</html>