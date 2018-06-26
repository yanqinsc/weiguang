<!doctype html>
<html lang="en">
@include('admin.layouts.header')
@include('UEditor::head')
<body>
    <form method="post" action="{{ route('article.store') }}" class="box box-info article-edit">
        {{ csrf_field() }}
        <div class="box-header with-border">
            <h3 class="box-title">添加文章</h3>
        </div>
        <div class="box-body">
            <input name="title" class="form-control" type="text" placeholder="在此处填写文章标题">
            <br>
            <input name="key_words" class="form-control" type="text" placeholder="关键词">
            <br>
            <textarea name="excerpt" class="form-control" rows="3" placeholder="内容摘要"></textarea>
            <br>
            <div class="row">
                <div class="col-md-3">
                    <select name="" id="" class="form-control">
                        <option value="">选择分类</option>
                        @foreach($categories as $category)
                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <select name="" id="schools" class="form-control">
                        <option value="">作者学校</option>
                        @foreach($schools as $school)
                            <option value="{{ $school->id }}">{{ $school->short_name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <select name="" id="classes" class="form-control">
                        <option value="">作者班级</option>

                    </select>
                </div>
                <div class="col-md-3">
                    <select name="" id="students" class="form-control">
                        <option value="">作者姓名</option>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <br>
            <!-- 加载编辑器的容器 -->
            <script id="container" name="content" type="text/plain"></script>

            <!-- 实例化编辑器 -->
            <script type="text/javascript">
                var ue = UE.getEditor('container');
                ue.ready(function() {
                    //此处为支持laravel5 csrf ,根据实际情况修改,目的就是设置 _token 值.
                    ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
                });
            </script>

            <div class="box-footer">
                <button type="submit" value="3" class="btn btn-primary right-gap">预览</button>
                <button type="submit" value="2" class="btn btn-success right-gap">存草稿</button>
                <button type="submit" value="1" class="btn btn-danger">发表文章</button>
            </div>
        </div>
    </form>
    @include('admin.layouts.footer')
    <script>
        $(function () {
            $("#schools").change(function () {
                if (!!$(this).val()) {
                    let url = '';
                    $.get();
                }
            });

        });
    </script>
</body>
</html>