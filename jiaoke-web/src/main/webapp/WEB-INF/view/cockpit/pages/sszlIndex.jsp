<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>路驰分公司综合管理平台</title>
    <meta charset="UTF-8">
    <meta name="google" value="notranslate"><!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE=edge：保持使用最高级别模式显示内容-->
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link rel="stylesheet" href="../../../../static/cockpit/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../static/cockpit/css/index1.css">
    <link rel="stylesheet" href="../../../../static/cockpit/css/common.css">
    <link rel="icon" href="../../../../static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../../static/cockpit/css/logo.css">
</head>
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
            <li class="jimu-list-ul-li-select">质量管控</li>
            <li><a href="/experimentCockpitPage.do"><span class="">实验管理</span></a></li>
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
<div id="afoot-Panel" class="jimu-main-absolute" style="width: 380px; height: 30px; left: 39%; right: auto; top: auto; bottom: 0.1px;"><div class="jimu-foot-content" id="jimu-foot-content">
    <div class="jimu-foot-bg"><div class="jimu-foot-name"></div></div>
</div></div>

<!--4个角-->
<div class="i-common-top i-top-left"></div>
<div class="i-common-top i-top-right"></div>
<div class="i-common-bottom i-left-bottom"></div>
<div class="i-common-bottom i-right-bottom"></div>

<!--首页头部 end -->
<div class="container-bgcolor">
<div class="model-content">
    <!--首页左侧 sta -->
    <div class="comtab">
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con" id="radar_echart"  style="height: 150px">

            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con bar_l_echart" id="xctj" style="height: 160px">

            </div>
        </div>
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con" id="sssjtj" style="height: 160px">

            </div>
        </div>
    </div>

    <!--首页左侧 end -->
    <!--首页居中 sta -->
    <div class="model-mid">
        <div class="mid-top" id="map_c_echart">
            <!--<div class="echart_con" >-->

            <!--</div>-->
        </div>
        <!--中底 sta -->
        <!--<div class="mid-foot">-->
            <!--<div class="parkingbox">-->
                <!--<div class="commombox-top"><span class="prakbg"></span>-->
                    <!--<div  class="boxnum"><span id="parknum">13027公里</span></div>-->
                    <!--<div class="commonbox-foot"></div>-->
                <!--</div>-->
                <!--<div class="commonbox-tit">道路</div>-->
            <!--</div>-->
            <!--<div class="parkingbox marginl15">-->
                <!--<div class="commombox-top"><span class="placebg"></span>-->
                    <!--<div  class="boxnum"><span id="parkplace">12座</span></div>-->
                    <!--<div class="commonbox-foot"></div>-->
                <!--</div>-->
                <!--<div class="commonbox-tit">桥梁</div>-->
            <!--</div>-->
            <!--<div class="parkingbox marginl15">-->
                <!--<div class="commombox-top"><span class="freebg"></span>-->
                    <!--<div  class="boxnum"><span id="freenum">13810个</span></div>-->
                    <!--<div class="commonbox-foot"></div>-->
                <!--</div>-->
                <!--<div class="commonbox-tit">设施</div>-->
            <!--</div>-->
            <!--<div class="parkingbox marginl15">-->
                <!--<div class="commombox-top"><span class="matchbg"></span>-->
                    <!--<div  class="boxnum"><span id="matchnum">113027平方米</span></div>-->
                    <!--<div class="commonbox-foot"></div>-->
                <!--</div>-->
                <!--<div class="commonbox-tit">绿化</div>-->
            <!--</div>-->
        <!--</div>-->
        <!--中底 end -->
    </div>
    <!--首页居中 end -->
    <!--首页右侧 sta -->
    <div class="comtab">
        
        
        
        <div class="modelpub  ">
            <div class="common-tit">标题</div>
            
            <div class="echart_con bar_c_echart"  id="ldwhl" style="height: 160px">

            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con"  id="ldgdzt">
                <!--<div id="container-speed" style="width:49%;height: 100%;display: inline-block; "></div>
                <div id="container-rpm" style=" width:49%;height: 100%;display: inline-block;"></div>-->
            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con line_r_echart" id="ldlxtj">

            </div>
        </div>
    </div>
    <!--首页右侧 end -->
</div>
</div>
<div class="clearfix"></div>
<!--首页底部 sta -->
<!--<div id="model-foot" class="model-foot">

</div>-->
<!--首页底部 end-->
<script type="text/javascript" src="../../../../static/cockpit/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/lib/echarts.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-3d.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/header-footer.js"></script>
<script src="../../../../static/cockpit/js/common/unit.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/pagejs/indexSSHZ.js?c=2.9"></script>
</body>
</html>
