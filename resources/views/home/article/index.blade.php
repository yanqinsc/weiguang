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
                            <th class="mobile-hide">序号</th>
                            <th>标题</th>
                            <th class="mobile-hide">作者</th>
                            <th class="mobile-hide">编辑</th>
                            <th>分类</th>
                            <th class="mobile-hide">评论</th>
                            <th class="mobile-hide">阅读</th>
                            <th class="mobile-hide">发布时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        @if($articles->count())
                            @foreach($articles as $key => $article)
                                <tr role="row">
                                    <td class="mobile-hide">{{ $key }}</td>
                                    <td>{{ $article->title }}</td>
                                    <td class="mobile-hide">{{ $article->author }}</td>
                                    <td class="mobile-hide">{{ $article->publisher }}</td>
                                    <td>{{ $article->category }}</td>
                                    <td class="mobile-hide">{{ $article->comment_count }}</td>
                                    <td class="mobile-hide">{{ $article->view_count }}</td>
                                    <td class="mobile-hide">{{ $article->created_at }}</td>
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