<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>微光-重置密码</title>
    <style>
        table {
            width: 80%;
            margin-top: 50px;
            margin-left: 10%;
        }

        #app-name {
            width: 100%;
            height: 70px;
            background-color: #f8f8f8;
        }

        #app-name h2 {
            width: 100%;
            height: 30px;
            color: #666;
            margin-left: 45%;
            padding-top: 16px;
            margin-bottom: 60px;
        }

        #app-name p {
            text-indent: 2em;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <td>
                <div id="app-name">
                    <h2>{{ config('app.name') }}</h2>
                    <h4>您好！</h4>
                    <p>
                        我们收到你重置密码的请求，请点击此处<a href="">重置密码</a>。如果不是您本人发起重置密码的请求，请忽略此邮件。
                    </p>
                    <p>
                        如果点击链接遇到问题请复制一下网址到浏览器地址栏打开：<br><br>
                        {{ $actionUrl }}
                    </p>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>