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
    <div id="video" class="video"></div>
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
                <li><a onclick="popupBackdrop('officeAreaLine1')" id="persional_attendance"><span>线路一</span></a></li>
                <li><a onclick="popupBackdrop('officeAreaLine2')" id="persional_salary"><span>线路二</span></a></li>
                <li><a id="wage_statistics"><span>线路三</span></a></li>
                <li><a id="schedule_planning"><span>线路四</span></a></li>
            </ul>
        </li>

        <li class="nav-item">
            <a>
                <img src="../../../static/images/security/factory.png">
                <span>生产区</span>
            </a>
            <ul>
                <li><a onclick="popupBackdrop('productionLine1')" id="new_matter"><span>线路一</span></a></li>
                <li><a onclick="popupBackdrop('productionLine2')" id="waiting_matter"><span>线路二</span></a></li>
                <li><a id="already_issued_matter"><span>线路三</span></a></li>
                <li><a id="to_do_matter"><span>线路四</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a>
                <img src="../../../static/images/security/door.png">
                <span>出入口</span>
            </a>
            <ul>
                <li>
                    <a onclick="popupBackdrop('southDoor')" id="waiting_document"><span>南门</span></a></li>
                <li>
                    <a onclick="popupBackdrop('westDoor')" id="document_signing"><span>西门</span></a></li>
            </ul>
        </li>
    </ul>
</div>

<div class="right_page">
    <img src="../../../static/images/security/panorama.jpg">
    <div class="map-tagging">
        <img src="../../../static/images/security/monitor.png" title="厂区西门" class="twinkle west-door"
             onclick="popupBackdrop('westDoor')">
        <img src="../../../static/images/security/monitor.png" title="厂区南门" class="twinkle south-door"
             onclick="popupBackdrop('southDoor')">
        <img src="../../../static/images/security/monitor.png" title="办公区(线路一)" class="twinkle office-area-line1"
             onclick="popupBackdrop('officeAreaLine1')">
        <img src="../../../static/images/security/monitor.png" title="办公区(线路二)" class="twinkle office-area-line2"
             onclick="popupBackdrop('officeAreaLine2')">
        <img src="../../../static/images/security/monitor.png" title="生产区(线路一)" class="twinkle production-line1"
             onclick="popupBackdrop('productionLine1')">
        <img src="../../../static/images/security/monitor.png" title="生产区(线路二)" class="twinkle production-line2"
             onclick="popupBackdrop('productionLine2')">
    </div>
</div>

</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/security/security_common.js"></script>
</html>
