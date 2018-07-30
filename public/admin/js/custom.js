$(function () {
    $('#show-number').change(function () {
        $('#show-number-form').submit();
    });

    $('option[value=' + $('[name=paginate_number]').val() + ']').attr('selected', true);

    $('.a-remove').click(function () {
        $('#form-destroy').attr('action', $(this).attr('data-url')).show();
    });

    $('#comfirm-cancel').click(function () {
        $('#form-destroy').hide();
    })

    $('#current-title', window.parent.document).html($('#title').val());
    $('#current-title-right', window.parent.document).html($('#title').val());

    let topHeight = function() {
        $('.top-box').css('height', $(window).height()*0.8  + 'px');
    };

    topHeight();
    $(window).resize(function () {
        topHeight();
    });
});

function isWechat() {
    let userAgentInfo = navigator.userAgent.toLowerCase();
    return userAgentInfo.indexOf('micromessenger') !== -1;
}

function isAndroid() {
    let userAgentInfo = navigator.userAgent.toLowerCase();
    return userAgentInfo.indexOf('android') !== -1;
}

function isIos() {

    let userAgentInfo = navigator.userAgent.toLowerCase();
    return (userAgentInfo.indexOf('iphone') !== -1) || (userAgentInfo.indexOf('ipad') !== -1);
}

function isMobile() {
    let userAgentInfo = navigator.userAgent;
    let mobileAgents = [ "Android", "iPhone", "Windows Phone", "iPad"];
    let mobileFlag = false;

    //根据userAgent判断是否是手机
    for (let v = 0; v < mobileAgents.length; v++) {
        if (userAgentInfo.indexOf(mobileAgents[v]) > 0) {
            mobileFlag = true;
            break;
        }
    }

    let screenWidth = window.screen.width;
    let screenHeight = window.screen.height;

    //根据屏幕分辨率判断是否是手机
    if(screenWidth < 500 && screenHeight < 800){
        mobileFlag = true;
    }

    if (isWechat()) {
        mobileFlag = true;
    }

    return mobileFlag;
}
