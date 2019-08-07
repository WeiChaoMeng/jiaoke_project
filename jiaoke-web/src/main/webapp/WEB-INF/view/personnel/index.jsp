<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-6
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事管理</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link rel="stylesheet" type="text/css" href="../../../static/fonts/font_3/iconfont.css">
</head>
<body>
<%--菜单--%>
<div class="nav" id="nav">
    <ul>
        <li class="nav-item">
            <img src="../../../static/images/personnel/basic.png">
            <span>基本信息</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/personnel/archives.png">
            <span>员工档案</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/personnel/dynamic.png">
            <span>动态管理</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/personnel/contract.png">
            <span>员工合同</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/personnel/welfare.png">
            <span>员工福利</span>
        </li>
    </ul>
</div>

<div class="page">
    <iframe class="personnel" src="oaHomePage/toOaHomePage" id="personnel" name="personnel" frameborder="0"
            scrolling="auto"></iframe>
</div>
</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $('#nav').find('ul').find('li').eq(0).addClass('nav-item-style');

        $('#nav').find('ul').find('li').each(function () {

        })
    })
</script>
</html>
