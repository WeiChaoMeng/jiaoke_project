<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <link href="../../../static/css/default.css" rel="stylesheet" type="text/css">
    <link href="../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <style>
        body {
            font-family: '微软雅黑';
            margin: 0 auto;
            min-width: 980px;
        }

        .box404 p {
            color: #cec0ae;
            font-size: 35px;
            padding-top: 75px;
            padding-bottom: 10px;
        }

        .box404 i {
            font-size: 14px;
            color: #8d8d8d;
            font-style: normal;
            font-weight: 600;
        }

        .box404 {
            width: 354px;
            height: 255px;
            background: url(../../../static/images/permission.png) no-repeat left;
            margin: 0 auto;
            margin-top: 135px;
            padding-left: 286px;
        }
    </style>
</head>

<body>
<div class="box404">
    <p>Sorry！</p>
    <i class="info404">抱歉！当前你没有访问权限，请联系管理员。</i>
</div>
</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/skin.js"></script>
</html>
