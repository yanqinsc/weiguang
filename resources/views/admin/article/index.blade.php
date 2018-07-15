<!doctype html>
<html lang="en">
@include('admin.layouts.header')
<body>
<div class="box box-info list">
    <div class="box-body">
        <div class="button-bar">
            <a id="create-article" class="btn btn-app bg-olive" href="{{ route('article.create') }}">
                <i class="fa fa-plus"></i>添加文章
            </a>
        </div>
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-bordered table-striped dataTable" role="grid"
                           aria-describedby="abilities">
                        <thead>
                        <tr role="row">
                            <th>ID</th>
                            <th>标题</th>
                            <th>作者</th>
                            <th>发布者</th>
                            <th>分类</th>
                            <th>评论</th>
                            <th>阅读</th>
                            <th>发布时间</th>
                            <th>管理</th>
                        </thead>
                        <tbody>
                        @foreach($articles as $key => $article)
                            <tr role="row" class="{{ $key % 2 != 0 ? "odd" : "even"}}">
                                <td class="sorting_1">{{ $article->id }}</td>
                                <td>{{ $article->title }}</td>
                                <td>{{ $article->author }}</td>
                                <td>{{ $article->publisher }}</td>
                                <td>{{ $article->category }}</td>
                                <td>{{ $article->comment_count }}</td>
                                <td>{{ $article->view_count }}</td>
                                <td>{{ $article->created_at }}</td>

                                <td>
                                    <a href="{{ route('article.edit', ['id' => $article->id]) }}" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('article.destroy', ['id' => $article->id]) }}"
                                       title="删除" class="a-remove">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                    <a href="{{ route('article', ['id' => $article->id]) }}" title="查看" target="_blank">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
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