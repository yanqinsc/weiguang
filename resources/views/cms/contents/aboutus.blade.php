@extends('cms.layouts.base')

@section('content')
    <link rel="stylesheet" href="{{ asset('cms/css/article.css') }}">
    <style>
        .article-title {
            height: 3.8em;
        }
        p {
            text-indent: 2em;
        }

        .date {
            width: 150px;
        }

        tr {
            height: 50px;
            margin-bottom: 20px;
            border-bottom: 1px solid #666;
        }

        .article-body {
            padding-right: 2em;
        }
    </style>
    <div id="article">
        <div class="article-title">
            <a id="comment-number"></a>
            <div id="title-text">
                <h1 id="article-title" title="">微光的故事
                </h1>
            </div>
        </div>
        <div class="article-body">
            <p>内容建设中……</p>
        </div>

        <div class="article-title">
            <a id="comment-number"></a>
            <div id="title-text">
                <h1 id="article-title" title="">微光简介
                </h1>
            </div>
        </div>
        <div class="article-body">
            <p>
                “微光语文”平台由语文老师盼盼与文学爱好者小石共同发起创办，
                旨在为喜欢文学热爱写作的年轻朋友们提供一个语文学习与交流的地方,
                一起用文字和热情留住缤纷年少时光!
            </p>
        </div>

        <div class="article-title">
            <a id="comment-number"></a>
            <div id="title-text">
                <h1 id="article-title" title="">微光大事记
                </h1>
            </div>
        </div>
        <div class="article-body">
            <table>
                <tbody>
                <tr>
                    <td class="date" valign="top">2018年2月21日</td>
                    <td>与盼盼老师在一次聊天中知道了“微光的故事”,我们因此萌生了创建一个用于记录同学们优秀习作的平台的创意。</td>
                </tr>
                <tr>
                    <td  class="date">2018年3月15日</td>
                    <td>提交第一个开发版本。</td>
                </tr>
                <tr>
                    <td class="date">2018年3月25日</td>
                    <td >盼盼老师为平台命名——“微光”。</td>
                </tr>
                <tr>
                    <td class="date">2018年8月01日</td>
                    <td>完成微光系统1.0版本并正式上线。</td>
                </tr>
                <tr>
                    <td colspan="2">未来期待你的参与🙂……</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
@endsection