<%--
  Created by IntelliJ IDEA.
  User: Melone
  Date: 2019/8/6
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="/static/css/party_building/font-awesome.min.css" >
    <link rel="stylesheet" href="/static/css/party_building/style2.css" >
    <link rel="stylesheet" href="/static/css/party_building/jquery.orgchart.css" >
    <link rel="stylesheet" href="/static/css/party_building/style.css" >
    <style>
        .edge {
            display: none;
        }
    </style>
</head>

<body >

<ul id="tabs">
    <li><a href="#" title="tab1">学习强国</a></li>
    <li><a href="#" title="tab2">北京党员教育</a></li>
    <li><a href="#" title="tab3">组织架构</a></li>
</ul>
<div id="content">
    <div id="tab1">
        <iframe src="https://www.xuexi.cn/" frameborder="0" style="width: 100%;height: 13521px;min-height: 13520px" name="iframe_a"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
    </div>
    <div id="tab2">
        <iframe src="https://www.bjcc.gov.cn/index.html" frameborder="0" style="width: 100%;height: 3320px;min-height: 3320px" name="iframe_a"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
    </div>
    <div id="tab3">
        <div id="chart-container"></div>
    </div>
</div>

<%--js获取路径--%>
<input id="path" type="hidden" value="${path}"/>

<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/party_building/jquery.orgchart.js"></script>
<script type="text/javascript" src="/static/js/party_building/scripts.js"></script>
<script type="text/javascript" src="/static/js/party_building/party_member.js"></script>
</body>
</html>
