<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        @if(Auth::user()->can('article-create'))
        <div class="button-bar">
            <a id="create-article" class="btn btn-app bg-olive" href="{{ route('article.create') }}">
                <i class="fa fa-plus"></i>添加文章
            </a>
        </div>
        @endif
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th class="mobile-hide">ID</th>
                            <th>标题</th>
                            <th class="mobile-hide">作者</th>
                            <th class="mobile-hide">发布者</th>
                            <th>分类</th>
                            <th class="mobile-hide">评论</th>
                            <th class="mobile-hide">阅读</th>
                            <th class="mobile-hide">状态</th>
                            <th class="mobile-hide">发布时间</th>
                            <th>管理</th>
                        </thead>
                        <tbody>
                        @if($articles->count())
                            @foreach($articles as $key => $article)
                            <tr role="row">
                                <td class="mobile-hide">{{ $article->id }}</td>
                                <td>{{ $article->title }}</td>
                                <td class="mobile-hide">{{ $article->author }}</td>
                                <td class="mobile-hide">{{ $article->publisher }}</td>
                                <td class="mobile-hide">{{ $article->category }}</td>
                                <td class="mobile-hide">{{ $article->comment_count }}</td>
                                <td class="mobile-hide">{{ $article->view_count }}</td>
                                <td class="mobile-hide">{{ $article->type == 1 ? '已发表' : '待审核' }}</td>
                                <td class="mobile-hide">{{ $article->created_at }}</td>

                                <td>
                                    @if(Auth::user()->can('article-edit'))
                                    <a href="{{ route('article.edit', ['id' => $article->id]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    @endif
                                    @if(Auth::user()->can('article-destroy'))
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('article.destroy', ['id' => $article->id]) }}"
                                       title="删除" class="a-remove">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                    @endif
                                    <a href="{{ route('article', ['id' => $article->id]) }}" title="查看" target="_blank">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                        @else
                            <tr role="row"><td colspan="10">暂无记录</td></tr>
                        @endif
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="form-destroy" method="post">
    {{ method_field('DELETE') }}
    {{ csrf_field() }}
    <div>
        <div>
            执行该操作后，该文章将被删除，确定删除？
        </div>
        <br>
        <div class="timeline-footer">
            <button type="submit" class="btn btn-danger">确定</button>
            <button id="comfirm-cancel" type="button" class="btn btn-success">取消</button>
        </div>
    </div>
</form>
@include('admin.layouts.footer')
<script>
    $(function () {
        //选择创建文章则设置cookie， 以便在创建文章前检查cookie清空以前本地保存的内容
        $("#create-article").click(function () {
            $.cookie('create_article', true);
        });
    });
</script>
</body>
</html>