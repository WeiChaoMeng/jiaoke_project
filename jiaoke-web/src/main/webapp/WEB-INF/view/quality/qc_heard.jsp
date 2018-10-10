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

<div class="headdown">
    <ul class="menu">
        <li>
            <a href="#" id="matching_manager" onclick="matching_model()" class="menu_selected"><i
                    class="menuico iconfont1">&#xe636;</i>配比管理</a>
        </li>
        <li><a href="#" id="real_time_protection" class="menu_selected" onclick="real_time_protection()"><i
                class="menuico iconfont1">&#xeba7;</i>实时监控</a></li>
        <li><a href="#" id="data_manager" onclick="data_manager()" class="menu_selected"><i class="menuico iconfont1">&#xe843;</i>数据管理</a>
        </li>
        <li><a href="#" id="quality_warning" onclick="quality_warning()" class="menu_selected"><i
                class="menuico iconfont1">&#xe8fc;</i>质量预警</a>
    </ul>


    <ul class="menu">

        <li><a href="#" id="auxiliary_analysis" onclick="auxiliary_analysis()" class="menu_selected"><i class="menuico iconfont1">&#xe68c;</i>辅助分析</a>
        </li>


        <li><a href="#" id="prodoct_list" onclick="prodoct_list()" class="menu_selected"><i class="menuico iconfont1">&#xebdc;</i>产品报表</a></li>
        <li><a href="#" id="testing" onclick="testing()" class="menu_selected"><i class="menuico iconfont1">&#xeb9f;</i>实验检测</a></li>
        <li><a href="#" id="real_data" onclick="real_data()" class="menu_selected"><i class="menuico iconfont1">&#xe689;</i>真实数据</a></li>
    </ul>


    <span class="menuup"><a href="#"><i class="mright iconfont1">&#xe615;</i></a></span>
</div>


<iframe src="qc_index.do" id="iframe" name="right" width="100%" height="100%" frameborder="0" scrolling="auto" style="height: 650px;"></iframe>


<!--right end-->


</div>
<!--main end-->

<!--footer start-->
<!--footer end-->
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
//关于

//$("#index").attr("class","selected");

        $('.manu').first().attr("class", "selected");
        $('#about').on('click', function () {
            layer.alert('你确定要修改吗？', {icon: 0});
        });

        $('#logo').on('click', function () {
            layer.tips('官方网站：uimaker.com', '#logo', {tips: 3});

        });

       
    });

    function real_time_protection() {

        $('iframe').attr("src", "qc_real_time_monitoring.jsp");

    }

    function matching_model() {
        $('iframe').attr("src", "qc_matching_model.jsp");
    }

    function data_manager() {
        $('iframe').attr("src", "qc_data_manager.html");
    }

    function quality_warning() {
        $('iframe').attr("src", "qc_quality_warning.jsp");
    }

    function auxiliary_analysis() {
        $('iframe').attr("src", "qc_auxiliary_analysis.html");
    }
    function prodoct_list() {
        $('iframe').attr("src", "qc_prodoct_list.jsp");
    }
    function testing() {
        $('iframe').attr("src", "qc_test_detection.jsp");
    }    
    function real_data(){
        $('iframe').attr("src", "qc_real_data.jsp");
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
