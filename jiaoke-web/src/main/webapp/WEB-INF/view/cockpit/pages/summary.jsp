<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>

<head>
    <title>路驰公司企业综合管理平台</title>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <meta charset="UTF-8">
    <meta name="google" value="notranslate"><!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE=edge：保持使用最高级别模式显示内容-->
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link type="text/css" href="../../../../static/cockpit/css/public.css" rel="stylesheet">
    <link type="text/css" href="../../../../static/cockpit/css/summary.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../../static/cockpit/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../static/cockpit/css/common.css">
    <link rel="icon" href="../../../../static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../../static/cockpit/css/logo.css">
    <link rel="stylesheet" href="../../../../static/layui/css/layui.css">
    <script type="text/javascript" src="../../../../static/js/echarts/echarts.js"></script>

<script type="text/javascript">
        document.documentElement.style.fontSize = document.documentElement.clientWidth /768*100 + 'px';
</script>
</head>
<style>
.abc{ 

}
</style>

<body>

<!--首页头部 sta -->
<!--<div id="model-top" class="model-top"></div>-->
<div class="jimu-main-header" id="Header-Panel" style="left: 10px; top: 10px; width: 313px; height: 36px; right: auto; bottom: auto;"><div class="jimu-head">
    <div class="jimu-head-content" id="jimu-head-content" style="line-height: 33px;">
        <div class="jimu-head-leftTopBg" id="leftTopBg"></div>
        <%--<div class="jimu-head-logo"><img id="logoNode" src="../../../../static/cockpit/img/logo-left.png"></div>--%>
        <div class="jimu-head-title jimu-head-title-light" id="titleNode">路驰分公司综合管理平台</div>
        <i class="jimu-head-masked"></i>
        <div class="jimu-head-rightBottomBg" id="rightBottomBg"></div>
    </div>
</div></div>
<div id="ToolBar-Panel" >
    <div class="jimu-toolbar" id="jimu-toolbar-content">
        <div class="jimu-toolbar-left"></div>
        <div class="jimu-list jimu-toolbar-middle" id="jimu-list">
            <ul id="jimu-list-ul" class="jimu-list-ul">
                <li><a href="/cockpitPage.do"><span class="">首页</span></a></li>
                <li class=""><a href="/qualityCockpitPage.do"><span>质量管控</span></a></li>
                <li><a href="/summaryCockpitPage.do"><span class="jimu-list-ul-li-select">汇总分析</span></a></li>
                <li><a href="/logout"><span class="">退出</span></a></li>
            </ul>
        </div>
        <div class="jimu-toolbar-right"></div>
    </div></div>

<div id="Clock-Panel" class="jimu-main-absolute" style="width: 160px; height: 60px; left: auto; right: 170px; top: 15px; bottom: auto;"><div class="jimu-clock">
    <div class="jimu-clock-content" id="jimu-clock-content">
        <ul>
            <li><div id="head-time" class="jimu-clock-day"></div></li>
            <li><div id="head-date" class="jimu-clock-week"></div></li>
        </ul>
    </div>
</div></div>
<div id="afoot-Panel" class="jimu-main-absolute" style="width: 380px; height: 40px; left: 39%; right: auto; top: auto; bottom: 0.1px;"><div class="jimu-foot-content" id="jimu-foot-content">
    <div class="jimu-foot-bg"><div class="jimu-foot-name" style="background-size: 160px;"></div></div>
</div></div>

<!--4个角-->
<div class="i-common-top i-top-left"></div>
<div class="i-common-top i-top-right"></div>
<div class="i-common-bottom i-left-bottom"></div>
<div class="i-common-bottom i-right-bottom"></div>

<!--首页头部 end -->
<!--首页头部 end -->
<div class="container-bgcolor" id="dowebok" style="background-color:rgba(3,23,43,1);" >
    <div id="main"  style="width: 100%;height: 100%;">
        <div class="section" id="page1" style="width: 100%;height: 100%;margin-bottom: 100px;display: block;">
            <div class="bg">
                <div class="leftMain">
                    <div class="leftMain_middle">
                        <div class="leftMain_middle_left">
                            <div class="leftMain_middle_leftIn">
                                <%--<h3>这里是标题</h3>--%>
                                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                                <div class="biaoge" style="width:100%; height:30vh;" id="chartmain"></div>

                                <span class="border_bg_leftTop"></span>
                                <span class="border_bg_rightTop"></span>
                                <span class="border_bg_leftBottom"></span>
                                <span class="border_bg_rightBottom"></span>
                            </div>
                        </div>
                        <div class="leftMain_middle_right">
                            <div class="leftMain_middle_rightIn">
                                <div class="biaoge biaoge_pai" style="width:100%; height:30vh">
                                    <div class="biaoge_paiIn">
                                        <ul id="list_ul">

                                        </ul>
                                    </div>
                                </div>
                                <span class="border_bg_leftTop"></span>
                                <span class="border_bg_rightTop"></span>
                                <span class="border_bg_leftBottom"></span>
                                <span class="border_bg_rightBottom"></span>
                            </div>
                        </div>
                    </div>
                    <div class="leftMain_middle">
                        <div class="leftMain_middle_left">
                            <div class="leftMain_middle_leftIn">
                                <div class="biaoge" style="width:100%; height:30.5vh" id="chartmain_zhe"></div>

                                <span class="border_bg_leftTop"></span>
                                <span class="border_bg_rightTop"></span>
                                <span class="border_bg_leftBottom"></span>
                                <span class="border_bg_rightBottom"></span>
                            </div>
                        </div>
                        <div class="leftMain_middle_right">
                            <div class="leftMain_middle_rightIn">
                                <div class="biaoge biaoge_bi" style="width:100%; height:30.5vh">
                                    <ul>
                                        <li>
                                            <div class="liIn">
                                                <p class="shu shu1" id="pro_date" style="font-size: 21px;padding-bottom: 20px;" >23</p>
                                                <p class="zi">日期</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="liIn">
                                                <p class="shu shu6" style="font-size: 14px;padding-bottom: 25px;margin-top: 5px;" id="pro_name" >AC-20C 34% 1：3</p>
                                                <p class="zi">产品名称</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="liIn">
                                                <p class="shu shu2" id="pro_total" style="font-size: 21px;padding-bottom: 20px;" >107</p>
                                                <p class="zi">生产总量</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="liIn">
                                                <p class="shu shu3" id="asphalt_proportion" >107</p>
                                                <p class="zi">沥青平均含量</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="liIn">
                                                <p class="shu shu4" id="additive_proportion" >23</p>
                                                <p class="zi">添加剂平均含量</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="liIn">
                                                <p class="shu shu5" id="warehouse_1" >23</p>
                                                <p class="zi">1仓平均温度</p>
                                            </div>
                                        </li>

                                    </ul>

                                </div>
                                <span class="border_bg_leftTop"></span>
                                <span class="border_bg_rightTop"></span>
                                <span class="border_bg_leftBottom"></span>
                                <span class="border_bg_rightBottom"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="rightMain">
                    <div class="rightMain_top">
                        <div class="rightMain_topIn"  style="height: 72.5vh;">
                            <div data-type="2"  style="height: 15%;margin-top: 10%;">
                                <div class="selectDiv" >
                                    <input type="text" class="layui-input" autocomplete="off" placeholder = "开始日期" id="startDate">
                                    <input type="text" class="layui-input" autocomplete="off" placeholder = "结束日期" id="endDate">
                                </div>
                            </div>
                            <div class="biaoge" style="width:100%;height: 85%;" id="chartmain_bing"></div>

                            <%--<span class="border_bg_leftTop"></span>--%>
                            <%--<span class="border_bg_rightTop"></span>--%>
                            <%--<span class="border_bg_leftBottom"></span>--%>
                            <%--<span class="border_bg_rightBottom"></span>--%>
                        </div>
                    </div>

                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>
<!--首页底部 sta -->
<input id="path" value="${path}" type="hidden">
<!--数字增长累加动画-->
<script type="text/javascript" src="../../../../static/cockpit/js/lib/jquery.min.js"></script>
<script src="../../../../static/cockpit/js/scroll.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/header-footer.js"></script>
<script src="../../../../static/layui/layui.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/summary.js"></script>

<script type="text/javascript">

</script>

</body>
</html>
