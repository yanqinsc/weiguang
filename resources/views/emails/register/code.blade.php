@component('mail::message')

亲爱的用户，<br>
感谢您注册 {{ config('app.name') }} 账号，<br>
这是您的注册码，有效时间60分钟，请不要将注册码告诉他人。<br>
如果您没有进行注册操作，请忽略此邮件。

@component('mail::panel')
<p style="color: #ff0000; width: 120px; font-size: 35px;">{{ $code }}</p>
@endcomponent

{{ config('app.name') }}
@endcomponent
