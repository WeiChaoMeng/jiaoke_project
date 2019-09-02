<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/11/7
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>监控</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/nav.css">
    <link href="../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
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
    <div class="nav-top">
        <div id="mini" class="mini">
            <img class="menu-img" src="../../../static/images/security/menu.png">
        </div>
    </div>

    <ul>
        <li class="nav-item">
            <a>
                <img src="../../../static/images/security/workspace.png">
                <span>办公区</span>
            </a>
            <ul>
                <li><a onclick="office()" id="persional_attendance"><span>一层</span></a></li>
                <li><a onclick="office()" id="persiona2_attendance"><span>二层</span></a></li>
                <%--<li><a onclick="popupBackdrop('officeAreaLine2')" id="persional_salary"><span>线路二</span></a></li>--%>
                <%--<li><a id="wage_statistics"><span>线路三</span></a></li>--%>
                <%--<li><a id="schedule_planning"><span>线路四</span></a></li>--%>
            </ul>
        </li>

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
        </li>
        <li class="nav-item">
            <a>
                <img src="../../../static/images/security/factory1.png">
                <span>生产区(西)</span>
            </a>
            <ul>
                <li><a onclick="popupBackdrop('westProductionLine1')"><span>(西)线路一</span></a></li>
                <li><a onclick="popupBackdrop('westProductionLine2')"><span>(西)线路二</span></a></li>
                <li><a><span>线路三</span></a></li>
                <li><a><span>线路四</span></a></li>
            </ul>
        </li>--%>
        <li class="nav-item">
            <a>
                <img src="../../../static/images/security/door.png">
                <span>出入口</span>
            </a>
            <ul>
                <li>
                    <a onclick="guard()" id="waiting_document">
                        <span>南门</span>
                    </a>
                </li>
                <%--<li>
                    <a onclick="popupBackdrop('westDoor')" id="document_signing">
                        <span>西门</span>
                    </a>
                </li>--%>
            </ul>
        </li>
    </ul>
</div>

<div class="right_page">
    <img src="../../../static/images/security/panorama2.jpg">

    <div onclick="office()" id="office"
         style="position: absolute;left: 35%;top: 49%;font-size: 20px;background: #ffe500;width: 80px;height: 108px;opacity: .5;"></div>
    <div onclick="guard()" id="guard"
         style="position: absolute;left: 8%;top: 59%;font-size: 20px;background: #ffe500;width: 33px;height: 29px;opacity: .7;border-radius: 0 0 0 100px;"></div>

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

    function guard(){
        $('#video').append('<video width="100%" height="100%" autoplay="autoplay" loop="loop">' +
            '<source type="video/mp4" src="../../../static/images/security/video1.mp4">' +
            '<embed src="../../../static/images/security/video3.mp4" width="100%" height="100%">' +
            '</video>');
        $('.popup-window').show();
        $('.videos').hide();
        $('.video').show();
    }

    function office(){
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
