<footer class="footer">
    <p>Copyright &copy;2018 {{ config('app.domain') }}<span class="mobile-hide">, All Rights Reserved</span></p>
    <p>{{ config('app.icp') }}</p>
</footer>
<script src="{{ asset('common/js/jquery.cookie.js') }}"></script>
<script src="{{ asset('common/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('cms/js/main.js') }}"></script>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</body>
</html>