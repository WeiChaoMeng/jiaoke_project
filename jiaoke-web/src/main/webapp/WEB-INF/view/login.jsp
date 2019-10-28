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
    <title>路驰公司企业综合管理平台</title>
    <link href="/static/css/login.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="/static/images/favicon.ico" type="image/x-icon"/>
</head>

<body>
<div class="bg-div">
    <div class="signin">
        <div class="dowebok">
            <div class="logo">
                <img src="/static/images/login-logo.jpg" alt="" style="width: 15%;float: left;padding: 10px 0px;margin-left: 25px;">
                <span style="    height: 25px;width: 80%;font-size: 20px;display: block;padding-top: 6px;padding-left: 33px;">路驰公司企业综合管理平台</span>
            </div>

            <div class="login-form">
                <div class="login_input_content">
                    <div class="left-icon"><img src="/static/images/icon/username.png" alt=""></div>
                    <input type="text" placeholder="用户名" name="username" id="username" class="right-input" autocomplete="off" aria-placeholder="admin">
                </div>
                <div class="login_input_content">
                    <div class="left-icon"><img src="/static/images/icon/password.png" alt=""></div>
                    <input type="password" placeholder="密码" name="password" id="password" class="right-input" autocomplete="off" aria-placeholder="admin">
                </div>
                <div class="login_input_content">
                    <button type="submit" class="login-but" id="submit">登录</button>
                </div>
                <span style="text-align: center;color: rgba(0, 0, 0, 0.75);display: block;margin-top: 12px;" >欢迎登录路驰综合管理平台</span>
            </div>
        </div>
        <div class="login-bottom">
            <div class="login-bottom-copyright">
                <span>Copyright © 2008-2019  北京市政路桥建材集团有限公司路驰分公司 版权所有</span>
            </div>
        </div>
    </div>

</div>

</body>
<script type="text/javascript" src="../../static/js/jquery.js"></script>
<script src="../../static/js/oa/layer/layer.js"></script>
<script type="text/javascript">

    $('#submit').on('click', function () {
        var username = $('#username').val();
        var password = $('#password').val();

        if (username === "") {
            layer.msg('用户名不能为空',{
                icon:5
            });
        } else {
            if (password === "") {
                layer.msg('密码不能为空',{
                   icon:5
                });
            } else {
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: '${path}/login/login.do',
                    data: {"username": username, "password": password},
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (result) {
                        result = JSON.parse(result);
                        if (result.messages === "success") {
                            window.location.href = '${path}/login/homePage.do';
                        } else {
                            layer.msg('您输入的账号密码不匹配',{
                                icon:2
                            });
                        }
                    }
                });
            }
        }
    });

    //Cookie失效后跳转的登录页
    if (top != window)

        top.location.href = window.location.href;
</script>
</html>
