<!doctype html>
<html lang="en">
@include('admin.layouts.header')
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
                            <th class="mobile-hide">ID</th>
                            <th class="mobile-hide">文章</th>
                            <th class="mobile-hide">用户</th>
                            <th>评论内容</th>
                            <th class="mobile-hide">时间</th>
                            <th class="mobile-hide">状态</th>
                            <th>管理</th>
                        </thead>
                        <tbody>
                        @if($comments->count())
                            @foreach($comments as $key => $comment)
                            <tr role="row" class="{{ $key % 2 != 0 ? "odd" : "even"}}">
                                <td class="mobile-hide">{{ $comment->id }}</td>
                                <td class="mobile-hide">{{ $comment->title }}</td>
                                <td class="mobile-hide">{{ $comment->name }}</td>
                                <td>{{ $comment->content }}</td>
                                <td class="mobile-hide">{{ $comment->created_at }}</td>
                                <td class="mobile-hide">{{ $comment->reviewed === null ? '待审核' : '已审核'  }}</td>
                                <td>
                                    @if($comment->reviewed !== null)
                                    <a href="{{ route('article', ['id' => $comment->aid])}}#comment-{{ $comment->id }}" target="_blank">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                    @endif
                                    @if($comment->reviewed === null)
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('comment.review', ['id' => $comment->id]) }}"
                                       title="审核" id="a-review">
                                        <i class="fa fa-check"></i>
                                    </a>
                                    @endif
                                    <a href="javascript:void(0) "
                                       data-url="{{ route('comment.destroy', ['id' => $comment->id]) }}"
                                       title="删除" class="a-remove">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                        @else
                            <tr role="row"><td colspan="10">暂无记录</td></tr>
                        @endif
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

@include('admin.layouts.footer')
<script>
    $(function () {
        $("#a-review").click(function () {
            $("#form-review").attr('action', $(this).attr('data-url')).show();
        });
    });
</script>
</body>
</html>