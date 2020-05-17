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
    <meta charset="UTF-8">
    <meta name="google" value="notranslate"><!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE=edge：保持使用最高级别模式显示内容-->
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="stylesheet" href="../../../../static/cockpit/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../static/cockpit/css/logo.css">
    <link rel="stylesheet" href="../../../../static/cockpit/css/index.css">
    <link rel="stylesheet" href="../../../../static/cockpit/css/common.css">
    <link rel="stylesheet" href="../../../../static/layui/css/layui.css">
    <link rel="icon" href="../../../../static/images/favicon.ico" type="image/x-icon"/>
    <style>
        .my_div span{
            width: 100%;
            height: 20%;
        }

        /*去除高德地图左下角logo*/
        .amap-logo{
            opacity:0;
        }
        .amap-copyright{
            opacity:0;
        }
    </style>
</head>
<body>

<!--首页头部 sta -->
<div class="jimu-main-header" id="Header-Panel"
     style="left: 10px; top: 30px; width: 313px;z-index: 9999; height: 36px; right: auto; bottom: auto;">
    <div class="jimu-head">
        <div class="jimu-head-content" id="jimu-head-content" style="line-height: 33px;">
            <div class="jimu-head-leftTopBg" id="leftTopBg"></div>
            <%--<div class="jimu-head-logo"><img id="logoNode" src="../../../../static/cockpit/img/logo-left.png"></div>--%>
            <div class="jimu-head-title jimu-head-title-light" id="titleNode">路驰分公司综合管理平台</div>

            <i class="jimu-head-masked"></i>
            <div class="jimu-head-rightBottomBg" id="rightBottomBg"></div>
        </div>
    </div>
</div>

<div id="model-top" class="model-top">

</div>
<!--首页头部 end -->
<div class="model-content">
    <!--首页左侧 sta -->
    <div class="comtab">
        <div class="modelpub">
            <div class="common-tit">路驰拌合机信息</div>
            <span class="tilt"></span>
            <div class="layui-carousel" id="basicMessage" >
                <div carousel-item>
                    <div class="td-avg-time">
                        <div style="display: block;width: 100%;margin-top: 13px;">
                            <div class="staff-name">1#机组</div>
                            <div class="avg-time-label" style="margin-top: 13px;" >|&nbsp;&nbsp;设备型号:</div>
                            <div class="avg-time-value" style="margin-top: 13px;"  >NBD400</div>
                        </div>
                        <div style="display: block;width: 100%" >
                            <div class="staff-cust-time">
                                <span style="font-size:15px;">生产能力</span>
                                <br>
                                <span style="color:#00A8FE;font-size:18px;font-weight:600;">400吨/小时</span>
                            </div>
                            <div class="staff-order-count">
                                <span style="font-size:15px;">冷料仓</span>
                                <br>
                                <span style="color:#00A8FE;font-size:18px;font-weight:600;">11个</span>
                            </div>
                            <div class="staff-alarm">
                                <span style="font-size:15px;">热料仓</span>
                                <br>
                                <span style="color:#00A8FE;font-size:18px;font-weight:600;">6个</span>
                            </div>
                        </div>
                    </div>
                    <div class="td-avg-time">
                        <div style="display: block;width: 100%;margin-top: 13px;">
                            <div class="staff-name">2#机组</div>
                            <div class="avg-time-label" style="margin-top: 13px;" >|&nbsp;&nbsp;设备型号:</div>
                            <div class="avg-time-value" style="margin-top: 13px;"  >NBD400</div>
                        </div>
                        <div style="display: block;width: 100%" >
                            <div class="staff-cust-time">
                                <span style="font-size:15px;">生产能力</span>
                                <br>
                                <span style="color:#00A8FE;font-size:18px;font-weight:600;">400吨/小时</span>
                            </div>
                            <div class="staff-order-count">
                                <span style="font-size:15px;">冷料仓</span>
                                <br>
                                <span style="color:#00A8FE;font-size:18px;font-weight:600;">11个</span>
                            </div>
                            <div class="staff-alarm">
                                <span style="font-size:15px;">热料仓</span>
                                <br>
                                <span style="color:#00A8FE;font-size:18px;font-weight:600;">6个</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">机组本月生产信息</div>
            <span class="tilt"></span>
            <div class="echart_con bar_l_echart" style="height: 170px;" id="xctj">

            </div>
        </div>
        <div class="modelpub">
            <div class="common-tit">本月产品类别</div>
            <span class="tilt"></span>
            <div class="echart_con" style="height: 170px;" id="sssjtj">

            </div>
        </div>
    </div>

    <!--首页左侧 end -->
    <!--首页居中 sta -->
    <div class="model-mid">
        <div class="mid-top" id="echart3">
            <!--<div class="echart_con" >-->

            <!--</div>-->
        </div>
        <!--中底 sta -->
        <div class="mid-foot">
            <div class="parkingbox">
                <div class="commombox-top"><span class="prakbg"></span>
                    <div class="boxnum" id="yield">

                    </div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">本年产量</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="placebg"></span>
                    <div class="boxnum" id="usageAmount">

                    </div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">RAP总用量</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="freebg"></span>
                    <div class="boxnum" id="thisMonthCount">

                    </div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">本月总产量</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="matchbg"></span>
                    <div class="boxnum" id="thisUsageAmount">

                    </div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">RAP本月用量</div>
            </div>
        </div>
        <!--中底 end -->
    </div>
    <!--首页居中 end -->
    <!--首页右侧 sta -->
    <div class="comtab">
        <div class="modelpub">
            <div class="common-tit">本年供料工程</div>
            <span class="tilt"></span>
            <div class="echart_con" id="right_one" style="height: 83%;margin: 1% 0;">
                <div class="list_lh" >
                    <ul id="yearProduct">

                    </ul>
                </div>
            </div>
        </div>

        <div class="modelpub" style="margin-top: 10px;height: -webkit-calc((100%/1.5));">
            <div class="common-tit">厂区安全</div>
            <span class="tilt"></span>
            <div id="myPlayer" style="height: calc((100% - 30px));"></div>
            <img src="../../../../static/cockpit/img/inp_del.png" style="position: absolute;top: 10%;left: 90%;z-index: 999999;" id="closeMonitor" onclick="closeMonitor()">

            <div class="echart_con bar_c_echart" style="height: -webkit-calc((100% - 30px));" id="container">
                <%--<img style="width: 100%;height: 100%" src="../../../../static/new/images/monitor.png">--%>
            </div>
        </div>
    </div>
    <!--首页右侧 end -->
</div>
<input type="hidden" id="nickname" value="${nickname}">

<div class="clearfix"></div>
<!--首页底部 sta -->
<div id="model-foot" class="model-foot">

</div>
<input id="path" value="${path}" type="hidden">
<!--首页底部 end-->
<script type="text/javascript" src="../../../../static/cockpit/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="../../../../static/js/echarts/echarts.js"></script>
<script type="text/javascript" src="../../../../static/layui/layui.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-3d.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/header-footer.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/scroll.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/pagejs/map.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/pagejs/index.js?c=2.9"></script>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=5ae1365fcf3e53e6a218d9d88cd50249"></script>
<script type="text/javascript" src="../../../../static/new/js/gdmap.js"></script>
<script type="text/javascript" src="../../../../static/EZUIKit/ezuikit.js"></script>
</body>
</html>
