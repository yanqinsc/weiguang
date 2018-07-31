@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="{{ route('login') }}">登录</a> | 注册</div>

                <div class="panel-body">
                    <form class="form-horizontal" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }} row">
                            <label for="name" class="col-md-4 control-label form-font">用户名</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label form-font">E-Mail</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label form-font">密码</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label form-font">确认密码</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="register-code" class="col-md-4 control-label form-font">注册码</label>

                            <div class="col-md-4">
                                <input id="code" type="text" class="form-control" name="code" required>

                                @if ($errors->has('code'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('code') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="col-md-2">
                                <button id="get-code" type="button" class="btn btn-success">获取注册码</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4" id="msg" style="color: #ff0000;"></div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    注册
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        let url = '{{ route('getRegisterCode') }}';
        let msg = $("#msg");
        if ((new Date()).getTime() - $.cookie('register_sent_at') < 60000) {
            $("#get-code").removeClass('btn-success').html('60s后重试').attr('disabled', true);
        }

        $("#get-code").click(function () {

            let email = $("#email").val();
            if (email.indexOf('@') === -1) {
                msg.html('请正确填写Email地址。');
            } else {
                msg.html('');
            }

            let data = {
                _token:'{{ csrf_token() }}',
                email: email
            };

            $.ajax({
                type: 'post',
                url: url,
                data: data,
                dataType: 'json',
                success: function (data) {
                    msg.html('注册码已发送到您的邮箱');
                    $("#get-code").removeClass('btn-success').html('60s后重试').attr('disabled', true);
                    $.cookie('register_sent_at', (new Date()).getTime());
                    setTimeout(function () {
                        $("#get-code").addClass('btn-success').html('获取注册码').attr('disabled', false);
                    }, 60000);
                },
                error: function (xhr) {
                    msg.html($.parseJSON(xhr.responseText).errors.email[0]);
                    console.log();
                }

            });
        });
    });
</script>
@endsection
