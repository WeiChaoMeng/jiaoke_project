<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();

    String basePath = request.getScheme()+ "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    request.setAttribute("path",basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>路驰办公系统</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link rel="icon" href="/static/images/favicon.ico" type="image/ico"/>
    <style>
        html {
            overflow: hidden;
        }
    </style>
</head>
<body style="background:url(../../static/images/line.gif) repeat-y 0 0;">


<div id="flag"></div>
<!--弹窗背景变暗-->
<!--<div id="window_background_color"></div>-->

<!-- 未选中时弹窗-->
<!--<div id="log_window" class="log_popup">
    <div class="window_head log_popup_width">
        <div class="log_popup_window_head">
            <span>查看明细日志</span>
            <i class="iconfont cursor_hand window_closing" id="unselected_windows_close">&#xe68d;</i></div>
        <div class="log_window_son">
            <iframe src="process_log/index.jsp" id="" name="right" width="100%" height="100%" frameborder="0"
                    scrolling="auto"></iframe>
        </div>
        <div class="window_foot">
            <span>
                <a id="unselected_windows_confirm" class="cursor_hand window_confirmation">确定</a>
            </span>
        </div>
    </div>
</div>-->

<div class="header">
    <div class="headtop">
        <span class="logo" id="logo"><img src="/static/images/logo-2.png"></span>
        <ul class="nav">
            <li>
                <a href="#" class="manu" id="index"  >首页</a>
            </li>
            <li>
                <a href="#" class="manu" id="OA">OA系统</a>
            </li>
            <li>
                <a href="#" class="manu" id="quality_control">质量管控</a>
            </li>
            <li>
                <a href="#" class="manu" id="HR">人事管理</a>
            </li>

            <li>
                <a href="#" class="manu" id="DJ">党建工作</a>
            </li>
            <li>
                <a href="#" class="manu" id="JY">经营管理</a>
            </li>

            <li>
                <a href="#" class="manu" id="HB">环保监控</a>
            </li>
            <li>
                <a href="#" class="manu" id="AQ">厂区安全</a>
            </li>
        </ul>

        <div class="topright">
            <div class="user">
                <span><a href="#"><i class="userico iconfont">&#xe6cb;</i>Admin<i class="userdown iconfont">&#xe920;</i></a></span>
                <ul class="userlist">
                    <li><a href="#"><i class="userxl iconfont">&#xe666;</i>用户信息</a></li>
                    <li><a href="#" id="about"><i class="userxl iconfont">&#xe7e9;</i>修改密码</a></li>
                    <li><a href="login.html"><i class="userxl iconfont">&#xeae2;</i>退出</a></li>
                </ul>
            </div>

            <div class="skin">
                <a href="#">设置</a>
                <ul class="skinlist">
                    <li><a href="#" data-value="green" class="targetElem green"></a></li>
                    <li><a href="#" data-value="darkblue" class="targetElem darkblue"></a></li>
                    <li><a href="#" data-value="orange" class="targetElem orange"></a></li>
                    <li><a href="#" data-value="lightgreen" class="targetElem lightgreen"></a></li>
                    <li><a href="#" data-value="black" class="targetElem black"></a></li>
                    <li><a href="#" data-value="darkgrey" class="targetElem darkgrey"></a></li>
                    <li><a href="#" data-value="lightblue" class="targetElem lightblue"></a></li>
                    <li><a href="#" data-value="red" class="targetElem red"></a></li>
                </ul>
            </div>

        </div>
    </div>

</div>

<div class="rightdown">
    <iframe src="default.do" id="iframe" name="right" width="100%" height="100%" frameborder="0"
            scrolling="auto" ></iframe>
</div>

<div class="footer">
    <span class="fleft">信息管理系统v1.0</span>
    <span class="fright">路驰版权所有<i class="infoicon iconfont">&#xe620;</i></span>
</div>

</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script>

    ;!function () {
//关于
        $('#about').on('click', function () {
            layer.alert('你确定要修改吗？', {icon: 0});
        });

        $('#logo').on('click', function () {
            layer.tips('官方网站：http://www.bmrb.com.cn', '#logo', {tips: 3});
        });

    }();
    $(function () {
        //关于

        //$("#index").attr("class","selected");

        $('.manu').first().attr("class", "selected");
        $('#about').on('click', function () {
            layer.alert('你确定要修改吗？', {icon: 0});
        });

        $('#logo').on('click', function () {
            layer.tips('http://www.bmrb.com.cn', '#logo', {tips: 3});

        });

        $('.manu').click(function () {

            $('.selected').attr('class', 'manu');
            $(this).attr('class', 'selected');

            switch ($(this).attr('id')) {

                case 'index':

                    $("#iframe").attr("src", "default.do");
                    break;

                case 'OA':

                    $("#iframe").attr("src", "oaIndex.do");
                    break;

                case 'quality_control':

                    $("#iframe").attr("src", "qualityIndex.do");
                    break;

                case 'HR':

                    break;

                case 'DQ':

                    break;

                case 'JY':

                    break;

                case 'HB':

                    break;

                case 'AQ':

                    break;

            }

        })
    });
    //选中主页状态下点击效果
    $('#index').click(function () {
        $('.selected').attr('class', 'manu');
        $(this).attr('class', 'selected');
        $('#iframe').attr('src', 'default.do');

    });
</script>
</html>
