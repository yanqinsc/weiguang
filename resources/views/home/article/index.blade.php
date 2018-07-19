<!doctype html>
<html lang="en">
@include('home.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th>序号</th>
                            <th>标题</th>
                            <th>作者</th>
                            <th>编辑</th>
                            <th>分类</th>
                            <th>评论</th>
                            <th>阅读</th>
                            <th>发布时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        @if($articles->count())
                            @foreach($articles as $key => $article)
                                <tr role="row">
                                    <td class="sorting_1">{{ $key }}</td>
                                    <td>{{ $article->title }}</td>
                                    <td>{{ $article->author }}</td>
                                    <td>{{ $article->publisher }}</td>
                                    <td>{{ $article->category }}</td>
                                    <td>{{ $article->comment_count }}</td>
                                    <td>{{ $article->view_count }}</td>
                                    <td>{{ $article->created_at }}</td>
                                    <td>
                                        <a href="{{ route('article', ['id' => $article->id]) }}" title="查看" target="_blank">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr role="row">
                                <td colspan="10" class="no-records"> 暂无文章，欢迎投稿至 post@litlight.cn</td>
                            </tr>
                        @endif
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@include('home.layouts.footer')
</body>
</html>