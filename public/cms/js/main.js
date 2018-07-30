function isWechat() {
    let userAgentInfo = navigator.userAgent.toLowerCase();
    return userAgentInfo.indexOf('micromessenger') !== -1;
}

function getSubstr(str, n) {//字符串截取 包含对中文处理
    if (str.replace(/[\u4e00-\u9fa5]/g, "**").length <= n) {
        return str;
    } else {
        let len = 0;
        let tmpStr = "";
        for (let i = 0; i < str.length; i++) { //遍历字符串
            if (/[\u4e00-\u9fa5]/.test(str[i])) { //中文 长度为两字节
                len += 2;
            } else {
                len += 1;
            }

            if (len > n) {
                break;
            } else {
                tmpStr += str[i];
            }
        }
        return tmpStr + " ...";
    }
}


$(document).ready(function(){
    let categoryId = $("input[name=category]").val();
    $(".nav-link").removeClass("active");
    $("#" + categoryId).addClass("active");


    if ($("#article-title").length > 0) {
        let title = '';
        if ($(window).width() < 1200) {
            title = getSubstr($.trim($("#article-title").html()), 18);
        } else {
            title = getSubstr($.trim($("#article-title").html()), 36);
        }
        $("#article-title").html(title);
    }
});
