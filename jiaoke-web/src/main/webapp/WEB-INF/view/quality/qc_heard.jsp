<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title>路驰公司企业综合管理平台</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <style>
        html {
            overflow: hidden;
        }
    </style>
</head>

<body style="background:url(../../images/line.gif) repeat-y 0px 0;">
<!--header start-->

<!--header end-->
<!--main start-->

<div style="height: 10%">
    <ul class="menu">

        <shiro:hasPermission name="realTimeMonitor">
            <li>
                <a href="#" id="real_time_monitor" onclick="real_time_monitor()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe656;</i>实时监测</a>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="historicalData">
            <li>
                <a href="#" id="historical_data" onclick="historical_data()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe8bc;</i>历史数据</a>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="matchingManager">
            <li>
                <a href="#" id="matching_manager" onclick="matching_model()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe636;</i>配比管理</a>
            </li>
        </shiro:hasPermission>

            <li>
                <a href="#" id="grading_manager" onclick="grading_manager()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe636;</i>级配管理</a>
            </li>
        <shiro:hasPermission name="dynamicManagement">
            <li>
                <a href="#" id="dynamic_management" class="menu_selected" onclick="dynamic_management()">
                    <i class="menuico iconfont1">&#xe813;</i>动态管理</a>
            </li>
        </shiro:hasPermission>

    </ul>


    <ul class="menu">

        <shiro:hasPermission name="realTimeProtection">
            <li>
                <a href="#" id="real_time_protection" class="menu_selected" onclick="real_time_protection()"><i
                        class="menuico iconfont1">&#xeba7;</i>实时监控</a>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="qualityWarning">
            <li>
                <a href="#" id="quality_warning" onclick="quality_warning()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe6a8;</i>质量预警</a>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="dataManager">
            <li>
                <a href="#" id="data_manager" onclick="data_manager()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe843;</i>数据管理</a>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="auxiliaryAnalysis">
            <li>
                <a href="#" id="auxiliary_analysis" onclick="auxiliary_analysis()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe68c;</i>辅助分析</a>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="dataSummary">
            <li>
                <a href="#" id="data_summary" onclick="data_summary()" class="menu_selected">
                    <i class="menuico iconfont1">&#xe94d;</i>数据汇总</a>
            </li>
        </shiro:hasPermission>
        <%--<li>--%>
        <%--<a href="#" id="prodoct_list" onclick="prodoct_list()" class="menu_selected">--%>
        <%--<i class="menuico iconfont1">&#xebdc;</i>产品报表</a>--%>
        <%--</li>--%>
        <li>
            <a href="#" id="experimental_management" class="menu_selected" onclick="experimental_management()">
                <i class="menuico iconfont1">&#xe689;</i>实验管理</a>
        </li>
    </ul>

    <ul class="menu">

    </ul>
</div>


<iframe src="qc_index.do" id="iframe" name="right" width="100%" height="90%" frameborder="0" scrolling="auto"></iframe>


<!--right end-->


</div>
<!--main end-->

<!--footer start-->
<!--footer end-->
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript">
    $(function () {

    });

    function real_time_protection() {

        $('iframe').attr("src", "qc_real_time_monitoring.do");

    }

    function matching_model() {
        $('iframe').attr("src", "qc_matching_model.do");
    }

    //实时监测
    function real_time_monitor() {
        $('iframe').attr("src", "qc_real_time_surveillance.do");
    }

    //历史数据
    function historical_data() {
        $('iframe').attr("src", "qc_historical_data.do");
    }

    function data_manager() {
        $('iframe').attr("src", "qc_data_manager.do");
    }

    function quality_warning() {
        $('iframe').attr("src", "qc_quality_warning.do");
    }

    function auxiliary_analysis() {
        $('iframe').attr("src", "qc_auxiliary_analysis.do");
    }

    function prodoct_list() {
        $('iframe').attr("src", "qc_prodoct_list.do");
    }

    function testing() {
        $('iframe').attr("src", "qc_test_detection.do");
    }

    function real_data() {
        $('iframe').attr("src", "qc_real_data.do");
    }

    function dynamic_management() {
        $('iframe').attr("src", "qc_dynamic_management.do");
    }
    function grading_manager(){
        $('iframe').attr("src", "qc_grading_manager.do");
    }

    function data_summary() {
        $('iframe').attr("src", "qc_data_summary.do");
    }
    function experimental_management(){
        $('iframe').attr("src", "experimental_management.do");

    }

    //二级菜单选中时添加背景色
    $('.menu_selected').click(function () {

        if ($(this).attr("style") == "background:#c4c4c4;") {
            return false;
        }

        $('.menu_selected').removeAttr("style");
        $(this).attr("style", "background:#c4c4c4;");
    })
</script>

</body>

</html>
