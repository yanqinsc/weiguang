@component('mail::message')
{{-- Greeting --}}
@if (! empty($greeting))
# {{ $greeting }}
@else
@if ($level == 'error')
# Whoops!
@else
# 亲爱的用户，您好!
@endif
@endif

{{-- Intro Lines --}}
我们收到您的重置密码请求，请点击下面的按钮完成重置：
{{-- Action Button --}}
@isset($actionText)
<?php
    switch ($level) {
        case 'success':
            $color = 'green';
            break;
        case 'error':
            $color = 'red';
            break;
        default:
            $color = 'blue';
    }
?>
@component('mail::button', ['url' => $actionUrl, 'color' => $color])
重置密码
@endcomponent
@endisset

{{-- Outro Lines --}}
如果您没有发起重置密码请求，请忽略此邮件。
{{-- Subcopy --}}
@isset($actionText)
@component('mail::subcopy')
如果重置密码遇到问题请复制以下链接粘贴到浏览器地址栏打开： [{{ $actionUrl }}]({{ $actionUrl }})
@endcomponent
@endisset
@endcomponent
