@extends('admin.layouts.base')

@section('content')
    <form method="post" action="{{ route('article.store') }}">
        {{ csrf_field() }}
        <div class="box-header with-border">
            <h3 class="box-title">添加文章</h3>
        </div>
        <div class="box-body">
            <input class="form-control input-lg" type="text" placeholder="在此处填写文章标题">
            <br>
            <input class="form-control input-lg" type="text" placeholder="关键词">
        </div>
        <!-- 加载编辑器的容器 -->
        <script id="container" name="content" type="text/plain">

        </script>

        <!-- 实例化编辑器 -->
        <script type="text/javascript">
            var ue = UE.getEditor('container');
            ue.ready(function() {
                //此处为支持laravel5 csrf ,根据实际情况修改,目的就是设置 _token 值.
                ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
            });
        </script>

        <div class="box-footer">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
@endsection