//菜单
$('.nav-item>a').on('click', function () {
    if (!$('.nav').hasClass('nav-mini')) {
        if ($(this).next().css('display') == "none") {
            //展开未展开
            $('.nav-item').children('ul').slideUp(300);
            $(this).next('ul').slideDown(300);
            $(this).parent('li').addClass('nav-show').siblings('li').removeClass('nav-show');
        } else {
            //收缩已展开
            $(this).next('ul').slideUp(300);
            $('.nav-item.nav-show').removeClass('nav-show');
        }
    }
});

//弹窗
function popupBackdrop(parameter) {
    if (parameter === "westDoor") {
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video3.mp4">' +
            '<embed src="../../../static/images/security/video3.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
    } else if (parameter === "southDoor") {
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video3.mp4">' +
            '<embed src="../../../static/images/security/video3.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
    }else if (parameter === "officeAreaLine1") {
        // $('#video').append('<video width="100%" height="100%" controls autoplay="autoplay" loop="loop">' +
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video1.mp4">' +
            '<embed src="../../../static/images/security/video1.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
    } else if (parameter === "officeAreaLine2") {
        // $('#video').append('<video width="100%" height="100%" controls autoplay="autoplay" loop="loop">' +
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video2.mp4">' +
            '<embed src="../../../static/images/security/video2.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
    } else if (parameter === "productionLine1") {
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video2.mp4">' +
            '<embed src="../../../static/images/security/video3.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
    } else if (parameter === "productionLine2") {
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video3.mp4">' +
            '<embed src="../../../static/images/security/video3.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
    }
}

//关闭弹窗
$(".backdrop").on("click", function () {
    $(".popup-window").hide();
    $('#video').empty();
});