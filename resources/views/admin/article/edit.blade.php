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

    form {
        position: relative !important;
    }
</style>
    <div class="top-box">
        <form id="create-article" method="post" action="{{ route('article.update', ['id' => $article->id]) }}" class="box box-info article-edit">
            {{ csrf_field() }}
            {{ method_field('PUT') }}
            <div class="box-header with-border">
                <h3 class="box-title">编辑文章</h3>
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
                <div class="row">
                    <div class="col-md-2">
                        <input name="author" class="form-control" type="text" placeholder="{{ $article->author }}">
                    </div>
                    <div class="col-md-3">
                        <input name="from" class="form-control" type="text" placeholder="{{ $article->from }}">
                    </div>
                    <div class="col-md-3">
                        <input name="author_id" class="form-control" type="text" placeholder="{{ $article->author_id }}">
                    </div>
                </div>
                <br>
                <input name="key_words" class="form-control" type="text" placeholder="{{ $article->key_words }}">
                <br>
                <input name="thumb" class="form-control" type="text" placeholder="{{ $article->thumb }}">
                <br>
                <textarea name="excerpt" class="form-control" rows="3" placeholder="{{ $article->excerpt }}"></textarea>
                <br>
                <label for="" class="right-15">
                    <input type="checkbox" id="top" name="top" @if($article->is_top === '') checked @endif><span class="top-2">置顶</span>
                </label>
                <label for="">
                    <input type="checkbox" id="hot" name="hot" @if($article->is_hot === '') checked @endif><span  class="top-2">热点</span>
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
                            // 本地保存内容
                            /*
                            setTimeout(function () {
                                ue.execCommand('drafts');
                            }, 500);
                            */
                        </script>
                    </div>
                </div>
                <br>
                <p class="color-red show-error left">@if($errors->any()) {{ $errors->first() }} @endif</p>
                <div class="box-footer">
                    <button type="submit" class="btn btn-danger">发布</button>
                </div>
            </div>
        </form>
    </div>
    @include('admin.layouts.footer')
</body>
</html>