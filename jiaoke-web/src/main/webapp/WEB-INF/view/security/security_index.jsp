<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>监控</title>
    <link href="../../../static/css/security/security_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="popup-window" class="popup-window">
    <!--弹窗背景-->
    <div class="backdrop"></div>
    <!--弹窗内容-->
    <div id="video" style="display: none" class="video"></div>
    <div id="videos" style="display: none" class="videos"></div>
</div>

<div class="nav">
    <ul class="nav-ul">
        <li class="nav-item nav-item-style">
            <img src="../../../static/images/security/bg.png">
            <span>办公区监控</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/security/cr.png">
            <span>出入口监控</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/security/sc.png">
            <span>生产区监控</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/security/mj.png">
            <span>厂区门禁管理</span>
        </li>

        <%--第一版菜单样式--%>
        <%--<li class="nav-item">
            <a>
                <img src="../../../static/images/security/factory.png">
                <span>生产区(东)</span>
            </a>
            <ul>
                <li><a onclick="popupBackdrop('eastProductionLine1')"><span>(东)线路一</span></a></li>
                <li><a onclick="popupBackdrop('eastProductionLine2')"><span>(东)线路二</span></a></li>
                <li><a><span>线路三</span></a></li>
                <li><a><span>线路四</span></a></li>
            </ul>
        </li>--%>
    </ul>
</div>

<div class="right_page">
    <img src="../../../static/images/security/vertical_view.jpg">

    <div id="office" class="office-region">
        <img class="sign-office-1" onclick="office()" src="../../../static/images/security/dian.png">
        <img class="sign-office-2" onclick="guard()" src="../../../static/images/security/dian.png">
    </div>

    <div id="guard" class="guard-region">
        <img class="sign" onclick="guard()" src="../../../static/images/security/dian.png">
    </div>

    <div class="signal-region">
        <div>
            <span class="signal-region-name">厂区安全监控分布图</span>
        </div>

        <div class="legend-region">
            <span class="legend-region-name">图例</span>

            <div class="legend-region-content">
                <span class="boundary-legend-img"></span>
                <span class="boundary-legend-name">厂区边界</span>
            </div>

            <div class="legend-region-content">
                <span class="scope-legend-img"></span>
                <span class="scope-legend-name">监控范围</span>
            </div>

            <div class="legend-region-content">
                <img class="scope-location-img" src="../../../static/images/security/sxt.png">
                <span class="scope-location-name">监控位置</span>
            </div>
        </div>
    </div>
    <%--<div class="map-tagging">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle west-door"--%>
    <%--onclick="popupBackdrop('westDoor')">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle south-door"--%>
    <%--onclick="popupBackdrop('southDoor')">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle office-area-line1"--%>
    <%--onclick="popupBackdrop('officeAreaLine1')">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle office-area-line2"--%>
    <%--onclick="popupBackdrop('officeAreaLine2')">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle east-production-line1"--%>
    <%--onclick="popupBackdrop('eastProductionLine1')">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle east-production-line2"--%>
    <%--onclick="popupBackdrop('eastProductionLine2')">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle west-production-line1"--%>
    <%--onclick="popupBackdrop('westProductionLine1')">--%>
    <%--<img src="../../../static/images/security/monitor.png" class="twinkle west-production-line2"--%>
    <%--onclick="popupBackdrop('westProductionLine2')">--%>
    <%--</div>--%>
</div>

</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/security/security_common.js"></script>

<script>

    $('.nav-ul li').on('click', function () {
        $('.nav-ul li').removeClass('nav-item-style');
        $(this).addClass('nav-item-style');
    });

    function guard() {
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video1.mp4">' +
            '<embed src="../../../static/images/security/video3.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
        $('.videos').hide();
        $('.video').show();
    }

    function office() {
        $('#videos').append('<div id="video1"\n' +
            '         style="height: 49%;width: 37%;border: 1px solid #00e7ff;position: absolute;z-index: 9999;top: 1%;right: 50%;">\n' +
            '        <video width="100%" height="100%" autoplay="autoplay" loop="loop">\n' +
            '            <source type="video/mp4" src="../../../static/images/security/video3.mp4">\n' +
            '            <embed src="../../../static/images/security/video4.mp4" width="100%" height="100%">\n' +
            '        </video>\n' +
            '    </div>\n' +
            '    <div id="video2"\n' +
            '         style="height:49%;width: 37%;border: 1px solid #00e7ff;position: absolute;z-index: 9999;top: 1%;left: 50%;">\n' +
            '        <video width="100%" height="100%" autoplay="autoplay" loop="loop">\n' +
            '            <source type="video/mp4" src="../../../static/images/security/video4.mp4">\n' +
            '            <embed src="../../../static/images/security/video4.mp4" width="100%" height="100%">\n' +
            '        </video>\n' +
            '    </div>\n' +
            '    <div id="video3"\n' +
            '         style="height:49%;width: 37%;border:1px solid #00e7ff;position:absolute;z-index:9999;top:50%;right: 50%;">\n' +
            '        <video width="100%" height="100%" autoplay="autoplay" loop="loop">\n' +
            '            <source type="video/mp4" src="../../../static/images/security/video5.mp4">\n' +
            '            <embed src="../../../static/images/security/video4.mp4" width="100%" height="100%">\n' +
            '        </video>\n' +
            '    </div>\n' +
            '    <div id="video4"\n' +
            '         style="height: 49%;width: 37%;border: 1px solid #00e7ff;position: absolute;z-index: 9999;top: 50%;left: 50%;">\n' +
            '        <video width="100%" height="100%" autoplay="autoplay" loop="loop">\n' +
            '            <source type="video/mp4" src="../../../static/images/security/video6.mp4">\n' +
            '            <embed src="../../../static/images/security/video4.mp4" width="100%" height="100%">\n' +
            '        </video>\n' +
            '    </div>');
        $('.popup-window').show();
        $('.videos').show();
        $('.video').hide();
    }
</script>
</html>
