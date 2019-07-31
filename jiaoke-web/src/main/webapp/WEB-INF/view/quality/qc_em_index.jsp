<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html style="padding-bottom: 54px;">

<head>
    <meta charset="utf-8">
    <link href="/static/css/qc/emIndex.css" rel="stylesheet" media="all">
</head>

<body>
<div id="theGrid" class="main">
    <section class="grid">
        <shiro:hasPermission name="experimentItemInterior">
        <a class="grid__item" href="javacript:void(0);" onclick="sample_management()">
            <h2 class="title title--preview">取样管理</h2>
            <div class="loader"></div>
            <span class="category">取样通知相关</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i> </span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="javacript:void(0);" onclick="experimental_management()">
            <h2 class="title title--preview">实验管理</h2>
            <div class="loader"></div>
            <span class="category">实验相关流程</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i> </span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="javacript:void(0);" onclick="unfinished_experimental()">
            <h2 class="title title--preview">未完实验</h2>
            <div class="loader"></div>
            <span class="category">填写实验数据、输入计算表格</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i></span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="#">
            <h2 class="title title--preview">取样单 &amp; 任务单 </h2>
            <div class="loader"></div>
            <span class="category">取样台账、取样单、委托单、任务单展示</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i></span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="#">
            <h2 class="title title--preview">报告 &amp; 台账</h2>
            <div class="loader"></div>
            <span class="category">实验报告与与实验台账展示</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i> </span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        </shiro:hasPermission>

        <a class="grid__item" href="#">
            <h2 class="title title--preview">取样管理</h2>
            <div class="loader"></div>
            <span class="category">取样通知相关</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i> </span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="#">
            <h2 class="title title--preview">实验管理</h2>
            <div class="loader"></div>
            <span class="category">实验相关流程</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i> </span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="#">
            <h2 class="title title--preview">未完实验</h2>
            <div class="loader"></div>
            <span class="category">填写实验数据、输入计算表格</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i></span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="#">
            <h2 class="title title--preview">取样单 &amp; 任务单 </h2>
            <div class="loader"></div>
            <span class="category">取样台账、取样单、委托单、任务单展示</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i></span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
        <a class="grid__item" href="#">
            <h2 class="title title--preview">报告 &amp; 台账</h2>
            <div class="loader"></div>
            <span class="category">实验报告与与实验台账展示</span>
            <div class="meta meta--preview">

                <span class="meta__date"><i class="fa fa-calendar-o"></i> </span>
                <span class="meta__reading-time"><i class="fa fa-clock-o"></i></span>
            </div>
        </a>
    </section>
</div>
<%--js获取路径--%>
<input id="path" type="hidden" value="${path}"/>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/qc_experimental.js"></script>
</html>