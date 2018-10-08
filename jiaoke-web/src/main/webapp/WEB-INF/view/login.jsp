﻿<%--
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
    <title>路驰公司企业综合管理平台</title>
    <link href="../../static/css/login.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="../../static/images/favicon.ico" type="image/x-icon"/>
</head>

<body>
<!--loginbox start-->

<div class="login-title" style="width: 100%;height: 80px;">
    <div class="login-title-content" style="height: 80px;width: 80%;margin: 0 auto">
        <div>
            <img src="../../static/images/login-logo.jpg" alt="" style="height: 60px;padding: 10px 0">
            <span style="height: 50px;font-size: 17px;line-height:  80px;position: absolute;margin-left: 20px">路驰管理后台</span>
        </div>
    </div>
</div>
<div class="bg-div">
    <div class="signin">
        <div class="dowebok">
            <div class="logo">
                <span>账号登录</span>
            </div>

            <div class="login-form">
                <form  method="post" action="login.do" >
                    <div class="login_input_content">
                        <div class="left-icon"><img src="../../static/images/username.png" alt=""></div>
                        <input type="text" placeholder="账号" name="username" class="right-input">
                    </div>
                    <div class="login_input_content">
                        <div class="left-icon"><img src="../../static/images/password.png" alt=""></div>
                        <input type="password" placeholder="密码" name="password" id="password" class="right-input">
                    </div>
                    <div class="login_input_content">
                        <button type="submit" class="login-but" id="submit">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="login-bottom">
        <div class="login-bottom-copyright">
            <span>Copyright © 2008-2018  北京市政路桥建材集团有限公司路驰分公司 版权所有</span>
        </div>
    </div>
</div>
<!--loginbox end-->

</body>
<script type="text/javascript" src="../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../static/js/common.js"></script>
<script type="text/javascript" src="../../static/js/skin.js"></script>
<script type="text/javascript">
    var height = $(window).height();
    $(".login").css("padding-top", height / 2 - $(".login").height() / 2);
    $(window).resize(function () {
        $(".login").css("padding-top", $(window).height() / 2 - $(".login").height() / 2);
    });


</script>
</html>
