<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath); %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>路驰公司企业综合管理平台</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" href="../../../static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../static/new/css/font.css">
    <link rel="stylesheet" href="../../../static/new/css/login.css">
    <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
    <script type="text/javascript" src="../../../static/new/js/jquery-3.4.1.min.js"></script>
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message" style="padding: 18px 10px 18px 40px;font-size: 20px;">路驰公司企业综合管理平台</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form">
        <input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input"
               autocomplete="off">
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input"
               autocomplete="off">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">
    </form>
</div>

<script>
    $(function () {
        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            form.on('submit(login)', function (data) {
                // alert(888)
                console.log(data);
                console.log(data.field);
                console.log(JSON.stringify(data.field));
                $.ajax({
                    cache: true,
                    type: "POST",
                    dataType: 'json',
                    url: '${path}login/login.do',
                    data: JSON.stringify(data.field),
                    contentType: "application/json; charset=utf-8",
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (result) {
                        if (result.messages === "success") {
                            localStorage.setItem("userInfo", JSON.stringify(result.userInfo));
                            window.location.href = '${path}/loginJump.do';
                        } else {
                            layer.msg('您输入的账号密码不匹配', {
                                icon: 2
                            });
                        }
                    }
                });
                return false;
            });
        });
    });

    //Cookie失效后跳转的登录页
    if (top !== window)
        top.location.href = window.location.href;
</script>
</body>
</html>