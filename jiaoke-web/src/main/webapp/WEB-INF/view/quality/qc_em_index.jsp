<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html style="padding-bottom: 54px;">

<head>
    <meta charset="utf-8">
    <link href="/static/css/qc/emIndex.css" rel="stylesheet" >
</head>

<body>
    <div style="height:130px;"></div>
    <!-- 可删除 -->
    <div class="Service-box">
        <shiro:hasPermission name="experiment:inner">
        <div class="Service-content clearfix">
            <a  href="javacript:void(0);"  class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag001.png" alt="">
                </div>
                <h3 class="item-title">取样管理</h3>
                <div class="item-text">取样通知相关</div>
                <span class="item-link" onclick="sample_management()">查看相关</span>
            </a>
            <a href="javacript:void(0);" class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag002.png" alt="">
                </div>
                <h3 class="item-title">试验管理</h3>
                <div class="item-text">实验相关流程</div>
                <span class="item-link" onclick="experimental_management()" >查看相关</span>
            </a>
            <a href="javacript:void(0);"  class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag003.png" alt="">
                </div>
                <h3 class="item-title">未完试验</h3>
                <div class="item-text">填写实验数据、输入计算表格</div>
                <span class="item-link" onclick="unfinished_experimental()">查看相关</span>
            </a>
            <a href="javacript:void(0);" class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag004.png" alt="">
                </div>
                <h3 class="item-title">台账管理</h3>
                <div class="item-text">各类台账展示</div>
                <span class="item-link" onclick="standing_book()">查看相关</span>
            </a>
            <a href="javacript:void(0);" class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag005.png" alt="">
                </div>
                <h3 class="item-title">试验设置</h3>
                <div class="item-text">材料规格、生产厂家设置</div>
                <span class="item-link" onclick="experiment_setting()">查看相关</span>
            </a>
        </div>
        </shiro:hasPermission>

        <shiro:hasPermission name="experiment:outer">
        <div class="Service-content clearfix">
            <a href="javacript:void(0);"  class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag001.png" alt="">
                </div>
                <h3 class="item-title">每日取样</h3>
                <div class="item-text">取样通知相关</div>
                <span class="item-link" onclick="sample_management_foreign()">取样相关</span>
            </a>
            <a href="javacript:void(0);" class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag002.png" alt="">
                </div>
                <h3 class="item-title">每日通知单</h3>
                <div class="item-text">通知单相关流程</div>
                <span class="item-link" onclick="experimental_management_foreign()">通知单相关</span>
            </a>
            <a href="javacript:void(0);"  class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag003.png" alt="">
                </div>
                <h3 class="item-title">试验填写</h3>
                <div class="item-text">填写实验数据、输入计算表格</div>
                <span class="item-link" onclick="unfinished_experimental_foreign()">填写试验</span>
            </a>
            <a  href="javacript:void(0);"class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag004.png" alt="">
                </div>
                <h3 class="item-title">试验台账</h3>
                <div class="item-text">各类台账展示</div>
                <span class="item-link" onclick="standing_book_foreign()" >查看台账</span>
            </a>
            <a href="javacript:void(0);" class="Service-item">
                <div class="item-image">
                    <img src="/static/images/icon/icon-tag005.png" alt="">
                </div>
                <h3 class="item-title">参数设置</h3>
                <div class="item-text">材料规格、生产厂家设置</div>
                <span class="item-link" onclick="experiment_setting_foreign()">设置参数</span>
            </a>
        </div>
        </shiro:hasPermission>
    </div>
<%--js获取路径--%>
<input id="path" type="hidden" value="${path}"/>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/qc_experimental.js"></script>
</html>