<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>日志明细</title>
    <link type="text/css" rel="stylesheet" href="../../css/process_log/tabs.css"/>
</head>
<body>
<div class="log_window_head">
    <div>
        <div id="div" class="left log_window_head_left">
            <ul>
                <li><a class="" id="processing_detail">处理明细</a></li>
                <li class="current" id="process_log"><a>流程日志</a></li>
                <li><a id="nalysis_chart">分析图表</a></li>
            </ul>
        </div>

        <div class="log_window_head_right">
            <span class="iconfont">&#xe8a2;</span>
            <a style="margin-right: 10px">导出Excel</a>

            <span class="iconfont">&#xea0e;</span>
            <a>打印</a>
        </div>
    </div>
</div>

<div id="page" class="log_window_body">
    <iframe src="process_log.jsp" id="iframe" name="right" width="100%" height="100%" frameborder="0"
            scrolling="auto"></iframe>
</div>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/process_log/tabs.js"></script>
</html>
