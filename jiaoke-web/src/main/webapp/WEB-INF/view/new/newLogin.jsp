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
    <link rel="stylesheet" href="../../../static/css/login/login.css">
    <script type="text/javascript" src="../../../static/new/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../../static/js/login/login.js"></script>
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body style="overflow:hidden">

<div class="login layui-anim layui-anim-up">
    <div class="pagewrap">
        <div class="main">
            <div class="header"></div>
            <div class="content">
                <div class="con_left">
                    <img data-v-b16e4358="" src="../../../static/images/login/aaa.png" class="dl-img">
                </div>
                <div data-v-b16e4358="" class="title-container"><h3 data-v-b16e4358="" class="title-lg">路驰沥青生产管理平台</h3></div>
                <div class="con_right">
                    <div class="con_r_top"><a href="javascript:;" class="left"
                                              style="color: rgb(153, 153, 153); border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(222, 222, 222);">关注我们</a>
                        <a href="javascript:;" class="right"
                           style="color: rgb(51, 51, 51); border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(46, 85, 142);">登录管理</a>
                    </div>
                    <ul>
                        <li class="con_r_left" style="display: none;">
                            <div class="erweima">
                                <div class="qrcode">
                                    <div id="output" style="width: 100%; position: relative">
                                        <img src="../../../static/images/login/2weima.png" style="width: 174px; height: 174px">
                                    </div>
                                </div>
                            </div>
                            <div style="height: 70px">
                                <p>移动应用 扫描下载</p>
                            </div>
                        </li>

                        <li class="con_r_right" style="display: block;">
                            <form method="post" class="layui-form">
                                <div class="user">
                                    <div style="    border-bottom: 1.5px solid #d4dde4;margin: 0px 0px 30px 0px;width: 88%;">
                                        <span class="user-icon"></span>
                                        <input type="text" id="userid" name="username" lay-verify="required" placeholder="　输入账号" value="" autocomplete="off">
                                    </div>

                                    <div style="    border-bottom: 1.5px solid #d4dde4;margin: 0px 0px 30px 0px;width: 88%;"><span class="mima-icon"></span>
                                        <input type="password" id="pwd" name="password" lay-verify="required" placeholder="　输入密码" value="" autocomplete="off">
                                    </div>
                                    <div style="margin: 0px 0px 10px 0px;">
                                        <div class="check1"></div><i style="margin-left: 20px;color: #a69191;">记住我</i>
                                        <!--   这里是验证码的相关路径，各位站长自行更换   -->
                                    </div>
                                </div><br>
                                <button id="btn_Login" lay-submit lay-filter="login"  type="submit">登 录</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
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