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
                            <th>ID</th>
                            <th>文章</th>
                            <th>内容</th>
                            <th>时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        @foreach($comments as $key => $comment)
                            <tr role="row">
                                <td class="sorting_1">{{ $key }}</td>
                                <td>{{ $comment->title }}</td>
                                <td>{{ $comment->content }}</td>
                                <td>{{ $comment->created_at }}</td>
                                <td>{{ $comment->reviewed === null ? '审核中' : '成功' }}</td>
                                <td>
                                    @if($comment->reviewed !== null)
                                    <a href="{{ route('article', ['id' => $comment->aid])}}#comment-{{ $comment->id }}"  target="_blank">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{ $comments->links() }}
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
            执行该操作后，该评论将被删除，确定删除？
        </div>
        <br>
        <div class="timeline-footer">
            <button type="submit" class="btn btn-danger">确定</button>
            <button id="comfirm-cancel" type="button" class="btn btn-success">取消</button>
        </div>
    </div>
</form>

<form id="form-review" method="post">
    {{ csrf_field() }}
    <div>
        <div>
            通过审核？
        </div>
        <br>
        <div class="timeline-footer">
            <button type="submit" class="btn btn-danger">确定</button>
            <button id="comfirm-cancel" type="button" class="btn btn-success">取消</button>
        </div>
    </div>
</form>

@include('home.layouts.footer')
<script>
    $(function () {
        $("#a-review").click(function () {
            $("#form-review").attr('action', $(this).attr('data-url')).show();
        });
    });
</script>
</body>
</html>