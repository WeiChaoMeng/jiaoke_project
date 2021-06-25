<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>我的桌面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>
    <link rel="icon" href="../../../static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../static/new/css/font.css">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../../static/new/css/index.css">
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../static/new/js/jquery-3.4.1.min.js"></script>
    <script src="../../../static/js/echarts/echarts.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>
    <script type="text/javascript" src="../../../static/js/jquery.js"></script>
</head>
<body>
<div class="wrap-container welcome-container">
    <div class="row">
        <div class="welcome-left-container col-lg-9">
            <div class="data-show">
                <ul class="clearfix">
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a  href="javascript:;" class="clearfix" onclick="parent.xadmin.add_tab('实时监控','qc_real_time_monitoring.do',true)" >
                            <div class="icon-bg bg-org f-l">
                                <span class="iconfont">&#xe70e;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">实时监控</p>
                                <%--<p><span class="color-org">89</span>数据<span class="iconfont">&#xe628;</span></p>--%>
                            </div>
                        </a>
                    </li>
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a href="javascript:;" class="clearfix" onclick="parent.xadmin.add_tab('数据管理','qc_data_manager.do',true)">
                            <div class="icon-bg bg-blue f-l">
                                <span class="iconfont">&#xe705;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">当日数据</p>
                                <%--<p><span class="color-blue">189</span>数据<span class="iconfont">&#xe628;</span></p>--%>
                            </div>
                        </a>
                    </li>
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a href="javascript:;" class="clearfix" onclick="parent.xadmin.add_tab('辅助分析','qc_auxiliary_analysis.do',true)" >
                            <div class="icon-bg bg-green f-l">
                                <span class="iconfont">&#xe713;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">警报查询</p>
                                <%--<p><span class="color-green">221</span>数据<span class="iconfont">&#xe60f;</span></p>--%>
                            </div>
                        </a>
                    </li>
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a href="javascript:;" class="clearfix"  onclick="parent.xadmin.add_tab('汇总分析','qc_pooled_analysis.do',true)">
                            <div class="icon-bg bg-green f-l">
                                <span class="iconfont">&#xe74c;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">生产分析</p>
                                <%--<p><span class="color-green">221</span>数据<span class="iconfont">&#xe60f;</span></p>--%>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <!--图表-->
            <div class="chart-panel panel panel-default">
                <div class="panel-body" id="chart" style="height: 510px;">
                </div>
            </div>
        </div>
        <div class="welcome-edge col-lg-3">
            <!--最新留言-->
            <div class="panel panel-default comment-panel" style="height: 98%;overflow: hidden;">
                <div class="panel-header">实时预警</div>
                <div class="panel-body">
                    <div class="commentbox" style="overflow: hidden">
                        <ul class="commentList" id="warningUl">
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header"  style="background-color: rgba(255,73,50,0.31);color: #ffffff" >
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header"  style="background-color: rgba(255,73,50,0.31);color: #ffffff" >
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author" href="#">机组一</a>    AC-31C
                                            <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20:00</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">骨料一</a> 超限3% 达到三级预警</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="pagesbox" style="text-align: center;padding-top: 5px;">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="width: 100%;">
        <div class="my_chars" style="margin-bottom: 25px;">
        <c:choose>
            <c:when test="${!empty ratioMap}">
                <c:forEach items="${rationList}" var="keys" begin="0" end="0" varStatus="status">
                    <div class="card">
                        <div style="    width: 100%;height: 45px;">
                            <div class="content">
                                <div style="width: 50%;    float: left;">
                                    <c:forEach items="${ratioMap}" var="rationMess" >
                                        <c:if test="${rationMess.crew1_modele_id == keys || rationMess.crew2_modele_id == keys}">
                                            <c:set var="rationName" value="${rationMess.pro_name}"></c:set>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${rationName != null}">
                                        <p class="box_title_p" >${rationMess.pro_name}产品油石比走势图</p>
                                    </c:if>
                                    <c:if test="${rationName == null}">
                                        <p class="box_title_p">七日内${keys}号产品油石比走势图</p>
                                    </c:if>
                                </div>
                                <div style="width: 50%;float: left">
                                    <div style="margin-left: 30%;">
                                        <label class="jelabel">机组选择：</label>
                                        <div class="dy_select_div"   >
                                            <select id="crew_num" class="dy_select"  onchange="getProduceRatioByCrew();" >
                                                <option value="data1">机组一</option>
                                                <option value="data2">机组二</option>
                                            </select>
                                        </div>

                                        <label class="jelabel">模板选择：</label>
                                        <div class="dy_select_div" >
                                            <select  id="ratio_id" class="dy_select" onchange="updateChar5()">
                                                <c:forEach items="${ratioMap}" var="rationMess" >
                                                    <option value="${rationMess.crew1_modele_id}">${rationMess.pro_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card-content content-second">
                            <div class="main-info">
                                <div id="chart5" class="charts1"></div>

                                <script type="text/javascript">
                                    var myChart5= echarts.init(document.getElementById('chart5'));
                                    // 指定图表的配置项和数据
                                    var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                    // function getxAxis(total) {
                                    //     var categoryData = [];
                                    //     var month= total;
                                    //     var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                    //     for(var j = 1; j <= month; j++) {
                                    //         categoryData.push(j);
                                    //     };
                                    //     return categoryData;
                                    // }

                                    var option5 = {

                                        tooltip:{
                                            trigger: 'axis',
                                            backgroundColor:'transparent',
                                            showDelay: 0,
                                            hideDelay: 0,
                                            enterable: true,
                                            transitionDuration: 0,
                                            extraCssText: 'z-index:100',
                                            formatter: function(params) {
                                                //  console.log(params.Array.value);
                                                var res = "";
                                                var value = params[0].value;
                                                var times = params[0].name
                                                //  var times = "2017-11-23 11:00:18";
                                                res = "<div style='border-top:5px solid #0066cc;background:#010204;padding:0 30px 10px 20px;font-weight:700;font-size:14;'><p>盘号："
                                                    + times+ "</p><p>含量："
                                                    + value+ "</p></div>";
                                                return res;
                                            }
                                        },
                                        dataZoom: [
                                            {
                                                start:0,
                                                end:100,
                                                bottom:"5%",
                                            },
                                            {
                                                type: 'inside'
                                            }],
                                        grid: {
                                            left: '5%',
                                            right: '5%',
                                            bottom: '15%',
                                            top:'20%'
                                            // containLabel: true
                                        },
                                        xAxis: {
                                            type: 'category',
                                            name: '',
                                            // splitLine: linecolor,
                                            axisTick:{show:false},
                                            axisLine:linecolor,
                                            // axisLabel:{color:'#fff'},
                                            //  boundaryGap:false,
                                            data:
                                            <c:forEach items="${discNumMap}" var="discNum">
                                            <c:if test="${discNum.key == keys}">
                                            ${discNum.value},
                                            </c:if>
                                            </c:forEach>
                                        },
                                        yAxis: {
                                            type: 'value',
                                            name: '含量',
                                            axisTick:{show:false},
                                            axisLine:linecolor,
                                            axisLabel: {
                                                formatter: '{value} %'
                                            },
                                            splitLine: {
                                                show: false
                                            },
                                            max: function (value) {
                                                return (${moudelRatio[keys] + 1}).toFixed(2);
                                            },
                                            min:function (value) {
                                                return (${moudelRatio[keys] - 1}) < 0? 0:(${moudelRatio[keys] - 1}).toFixed(2);
                                            },
                                            // max: function (v) {
                                            //     return (v.max + v.min)/2
                                            // },
                                            // min: function (v) {
                                            //     return v.min - 5 < 0? 0:(v.min - 5).toFixed(1);
                                            // },

                                        },
                                        series: [
                                            {
                                                name: '3的指数',
                                                type: 'line',
                                                lineStyle:{normal:{color:'#010204',width:2}},
                                                smooth:true,  //这句就是让曲线变平滑的
                                                symbol:'circle',
                                                symbolSize: 7,
                                                data:
                                                <c:forEach items="${allItem}" var="materialsRation">
                                                <c:if test="${materialsRation.key == keys}" >
                                                ${materialsRation.value},
                                                </c:if>
                                                </c:forEach>
                                                <%--markLine:{--%>
                                                <%--silent: true,--%>
                                                <%--data: [--%>
                                                <%--<c:choose>--%>
                                                <%--<c:when test="${material == '油石比' || material == '石粉' ||empty material}">--%>
                                                <%--{ yAxis: '${moudelRatio[keys] + 0.2}', xAxis: '${fn:length(allItem[keys])}'},--%>
                                                <%--{ yAxis: '${moudelRatio[keys] - 0.2}', xAxis: '${fn:length(allItem[keys])}'}--%>
                                                <%--</c:when>--%>
                                                <%--<c:otherwise>--%>
                                                <%--{ yAxis: '${moudelRatio[keys] + 3}', xAxis: '${fn:length(allItem[keys])}'},--%>
                                                <%--{ yAxis: '${moudelRatio[keys] - 3}', xAxis: '${fn:length(allItem[keys])}'}--%>
                                                <%--</c:otherwise>--%>
                                                <%--</c:choose>--%>
                                                <%--]--%>
                                                <%--},--%>
                                                markArea: {
                                                    data: [
                                                        [{

                                                            yAxis: ${moudelRatio[keys] - 1},
                                                            itemStyle:{
                                                                normal:{color:'rgba(30, 144, 255, 1)', opacity:0.7},
                                                            },
                                                        },
                                                            {
                                                                yAxis: ${moudelRatio[keys] - 0.2},
                                                                itemStyle:{
                                                                    normal:{color:'rgba(30, 144, 255, 1)', opacity:0.7},
                                                                },
                                                            }],
                                                        [{

                                                            yAxis: ${moudelRatio[keys] - 0.2},
                                                            itemStyle:{
                                                                normal:{color:'#00e7bc', opacity:0.7},
                                                            },
                                                        },
                                                            {
                                                                yAxis: ${moudelRatio[keys] + 0.2},
                                                                itemStyle:{
                                                                    normal:{color:'#00e7bc', opacity:0.7},
                                                                },
                                                            }],
                                                        [{
                                                            yAxis: ${moudelRatio[keys] + 0.2},
                                                            itemStyle:{
                                                                normal:{color:'rgba(30, 144, 255, 1)', opacity:0.7},
                                                            },
                                                        },
                                                            {
                                                                yAxis: ${moudelRatio[keys] + 1},
                                                                itemStyle:{
                                                                    normal:{color:'rgba(30, 144, 255, 1)', opacity:0.7},
                                                                },
                                                            }]
                                                    ]
                                                }
                                            }

                                        ]
                                    };
                                    myChart5.setOption(option5);
                                    window.addEventListener("resize", function () {
                                        myChart5.resize();
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p id="pro_message" style="width: 100%; padding-left: 45%;padding-top: 5%;font-size: 14px;">七日内无生产</p>
            </c:otherwise>
        </c:choose>
    </div>
        <div class="my_chars">
                        <div class="card">
                            <div style="    width: 100%;height: 45px;">
                                <div class="content">
                                    <div style="width: 50%;    float: left;">
                                        <p class="box_title_p" style="margin-top: 15px;">七日内所有产品温度趋势图</p>
                                    </div>
                                </div>
                            </div>

                            <div class="card-content content-second">
                                <div class="main-info">
                                    <div id="chart7" class="charts1"></div>

                                    <script type="text/javascript">
                                        var myChart7= echarts.init(document.getElementById('chart7'));
                                        // 指定图表的配置项和数据
                                        var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                        // function getxAxis(total) {
                                        //     var categoryData = [];
                                        //     var month= total;
                                        //     var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                        //     for(var j = 1; j <= month; j++) {
                                        //         categoryData.push(j);
                                        //     };
                                        //     return categoryData;
                                        // }

                                        option7 = {
                                            tooltip: {
                                                trigger: 'axis'
                                            },
                                            legend: {
                                                data: ['骨料温度', '混合料温度', '沥青温度'],
                                                right:'30'
                                            },
                                            grid: {
                                                left: '3%',
                                                right: '4%',
                                                bottom: '1%',
                                                containLabel: true
                                            },
                                            xAxis: {
                                                type: 'category',
                                                boundaryGap: false,
                                                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                                            },
                                            yAxis: {
                                                type: 'value'
                                            },
                                            series: [
                                                {
                                                    name: '骨料温度',
                                                    type: 'line',
                                                    stack: '总量',
                                                    data: [120, 132, 101, 134, 90, 230, 210]
                                                },

                                                {
                                                    name: '沥青温度',
                                                    type: 'line',
                                                    stack: '总量',
                                                    data: [150, 232, 201, 154, 190, 330, 410]
                                                },
                                                {
                                                    name: '混合料温度',
                                                    type: 'line',
                                                    stack: '总量',
                                                    data: [220, 182, 191, 234, 290, 330, 310]
                                                }
                                            ]
                                        };
                                        myChart7.setOption(option7);
                                        window.addEventListener("resize", function () {
                                            myChart7.resize();
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
        </div>
    </div>

</div>


<%--js获取路径--%>
<input id="path" type="hidden" value="${path}"/>
<script type="text/javascript">
    var basePath ;
    $(function () {
        basePath  = $("#path").val();
        //柱状图
        getLastYearEverMonthTotalToEchart();
        //预警相关
        getLastTenWarning();
        //查询温度曲线
        getLastSevenDayTemperaturesDataToChart();
    })
    
    function getLastYearEverMonthTotalToEchart() {
        $.ajax({
            url:basePath + "/getLastYearEverMonthTotalToEchart.do",
            type:"get",
            dataType:"json",
            success:function (res) {
                if (res == null || res === ""){
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg("未查询到生产信息")
                    });

                    return
                }
                var crew1Array = res.crew1;
                var crew2Array = res.crew2;
                setEcharts(crew1Array,crew2Array)
            }

        })
    }
    
    function getLastTenWarning() {
        $.ajax({
            url:basePath + "/getAllCriticalWarning.do",
            type:"get",
            dataType:"json",
            success:function (res) {
                if (res.length === 0){
                    if (res.length == 0){
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg("今日暂无预警信息")
                        });
                        return
                    }
                }
                var tmpHtml = "";
                for (var i = 0 ; i < res.length;i++){
                    var maxWraName = "";
                    var maxwraNum = "";
                    var maxWraLeve = "";
                    if (res[i]['沥青温度'] > 1){
                        maxWraName = "沥青温度";
                        maxwraNum = res[i]['沥青温度deviation'];
                        maxWraLeve = res[i]['沥青温度'];
                    }
                    if (res[i]['矿粉2'] > 1){
                        maxWraName = "矿粉2";
                        maxwraNum = res[i]['矿粉2deviation'];
                        maxWraLeve = res[i]['矿粉2'];
                    }
                    if (res[i]['骨料温度'] > 1){
                        maxWraName = "骨料温度";
                        maxwraNum = res[i]['骨料温度deviation'];
                        maxWraLeve = res[i]['骨料温度'];
                    }
                    if (res[i]['一仓温度'] > 1){
                        maxWraName = "一仓温度";
                        maxwraNum = res[i]['一仓温度deviation'];
                        maxWraLeve = res[i]['一仓温度'];
                    }
                    if (res[i]['沥青'] > 1){
                        maxWraName = "沥青";
                        maxwraNum = res[i]['沥青deviation'];
                        maxWraLeve = res[i]['沥青'];
                    }
                    if (res[i]['骨料1'] > 1){
                        maxWraName = "骨料1";
                        maxwraNum = res[i]['骨料1deviation'];
                        maxWraLeve = res[i]['骨料1'];
                    }
                    var colorByLeve = '<header class="comment-header">';
                    if (maxWraLeve > 3){
                        colorByLeve = '<header class="comment-header" style="background-color: rgba(255,73,50,0.31);color: #ffffff" >'
                    }

                    tmpHtml += '<li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="../../../static/images/baojing.png"></i></a>'
                        +'<div class="comment-main">'
                         +   '<header class="comment-header">'
                          +  '<div class="comment-meta"><a class="comment-author" href="#">'+ (res[i].produce_crewNum === 1? '机组1':'机组2')  +'</a> '
                           + '<time title="'+ res[i].produce_date + "  " + res[i].produce_time +  ' " datetime="'+ res[i].produce_date + " " + res[i].produce_time +  '">'+ res[i].produce_date + "  " + res[i].produce_time +  '</time>'
                        + '</div>'
                        + '</header>'
                        + '<div class="comment-body">'
                         +   '<p><a href="#">'+ maxWraName +'</a> 最大超限'+  maxwraNum + "%" +' 达到'+ maxWraLeve +'级预警</p>'
                        + '</div>'
                        + '</div>'
                        + '</li>';
                }
                $("#warningUl").empty().append(tmpHtml);
            }

        })
    }
    
    function setEcharts(crew1,crew2) {
        //--- 折柱 ---
        //图表
        var myChart;
        myChart = echarts.init(document.getElementById('chart'));
        var dataMap = {};
        function dataFormatter(obj) {
            var pList = ['一','二','三','四','五','六','七','八', '九','十','十一','十二','十三','十四','十五','十六', '十七','十八','十九','二十','二十一','二十二','二十三','二十四', '二十五','二十六','二十七','二十八','二十九','三十','三十一'];
            var temp;
            for (var year = 1; year <= 12; year++) {
                var max = 0;
                var sum = 0;
                temp = obj[year];
                for (var i = 0, l = temp.length; i < l; i++) {
                    max = Math.max(max, Number(temp[i]));
                    sum += Number(temp[i]);
                    obj[year][i] = {
                        name: pList[i],
                        value: Number(temp[i])
                    };
                }
                obj[year + 'max'] = Math.floor(max / 100) * 100;
                obj[year + 'sum'] = sum;
            }

            return obj;
        }

        function getMonthNum(obj,arry){
            for (var i = 1;i <= 12;i++) {
                if (obj[i+'sum'] > 0){
                    arry.push2(i)
                }
            }
        }

        function monthCase(arry){
            var strArry = [];
            for (var i= 0; i < arry.length;i++ ){
                switch (arry[i]) {
                    case 1:
                        strArry.push2("一月");
                        break;
                    case 2:
                        strArry.push2("二月");
                        break;
                    case 3:
                        strArry.push2("三月");
                        break;
                    case 4:
                        strArry.push2("四月");
                        break;
                    case 5:
                        strArry.push2("五月");
                        break;
                    case 6:
                        strArry.push2("六月");
                        break;
                    case 7:
                        strArry.push2("七月");
                        break;
                    case 8:
                        strArry.push2("八月");
                        break;
                    case 9:
                        strArry.push2("九月");
                        break;
                    case 10:
                        strArry.push2("十月");
                        break;
                    case 11:
                        strArry.push2("十一月");
                        break;
                    case 12:
                        strArry.push2("十二月");
                        break;
                }
            }
            return strArry
        }

        function creatOptionArray(array,crew1,crew2,monthArray){
            var option = [];
            for (var i = 0;i < array.length;i++){
                var intex = array[i];
                option.push({
                    title : {text: monthArray[i] + '两台机组产量'},
                    series : [
                        {data: crew1[intex]},
                        {data:  crew2[intex]},
                        {data: [
                                {name: '机组一', value: crew1[intex + 'sum'].toFixed(1),label: {
                                        normal: {
                                            formatter: '{b}: {c}吨 ({d}%)',
                                            position: 'inside'
                                        }
                                    },},
                                {name: '机组二', value: crew2[intex + 'sum'].toFixed(1), label: {
                                        normal: {
                                            formatter: '{b}: {c}吨 ({d}%)',
                                            position: 'inside'
                                        }
                                    },}
                            ]}
                    ]
                })
            }
            return option;
        }
        dataMap.dataPI = dataFormatter(crew1);

        dataMap.dataSI = dataFormatter(crew2);

        //处理没有生产的月份
        var arry = [];

         getMonthNum(dataMap.dataPI,arry);
         getMonthNum(dataMap.dataSI,arry);
        var monthArray = monthCase(arry);
        //处理对应月份option
        var optionArry = creatOptionArray(arry,dataMap.dataPI,dataMap.dataSI,monthArray);

        myChart.setOption({
            baseOption: {
                timeline: {
                    axisType: 'category',
                    // realtime: false,
                    // loop: false,
                    autoPlay: true,
                    // currentIndex: 2,
                    playInterval: 4000,
                    // controlStyle: {
                    //     position: 'left'
                    // },
                    data:  monthArray
                },
                tooltip: {
                },
                legend: {
                    left: 'right',
                    data: ['机组一', '机组二']
                },
                calculable : true,
                grid: {
                    // top: 80,
                    // bottom: 100,
                    top:"70px",
                    left:"50px",
                    right:"50px",
                    bottom:"100px",
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow',
                            label: {
                                show: true,
                                formatter: function (params) {
                                    return params.value.replace('\n', '');
                                }
                            }
                        }
                    }
                },
                xAxis: [
                    {
                        'type':'category',
                        'axisLabel':{'interval':0},
                        'data':[
                            '一','\n二','三','\n四','五','\n六','七','\n八',
                            '九','\n十','十一','\n十二','十三','\n十四','十五','\n十六',
                            '十七','\n十八','十九','\n二十','二十一','\n二十二','二十三','\n二十四',
                            '二十五','\n二十六','二十七','\n二十八','二十九','\n三十','三十一'
                        ],
                        splitLine: {show: false}
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '产量（吨）'
                    }
                ],
                series: [
                    {name: '机组一',
                        type: 'bar',
                        itemStyle:{
                                    normal:{
                                        color:'#53d6bc'
                                    }
                                }
                                },
                    {name: '机组二', type: 'bar',
                        itemStyle:{
                            normal:{
                                color:'#62cdfa'
                            }
                        }},
                    {
                        name: '各机组生产',
                        type: 'pie',
                        center: ['90%', '25%'],
                        radius: '28%',
                        color:["#53d6bc","#62cdfa"],
                        z: 100
                    }
                ]
            },
            options: optionArry
        });
        $(window).resize(function(){
            myChart.resize();
        })
    }

    function updateChar5(){
        var crew = $("#crew_num option:selected").val();
        var ratioNum = $("#ratio_id option:selected").val();
        if (ratioNum == null || ratioNum == ""){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.msg("未获取配比，请重新选择");
            });
            return
        }else {
            $.ajax({
                url:basePath + "/getDataToIndexChars.do",
                type:"post",
                dataType:"json",
                data:{
                    "crew":crew,
                    "ratioNum":ratioNum
                },
                success:function (res) {
                    if (res.length === 0){
                        if (res === null || res.length === 0){
                            layui.use('layer', function(){
                                var layer = layui.layer;
                                layer.alert("查询错误")
                            });
                            return
                        }
                    }
                    var tem =Number(res['moudelRatio'][ratioNum]);
                    var markArea = {
                        silent:false,
                        data: [
                            [{

                                yAxis: tem - 1,
                                itemStyle:{
                                    normal:{color:'#6b6af7', opacity:0.3},
                                },
                            },
                                {
                                    yAxis: tem - 0.2,
                                    itemStyle:{
                                        normal:{color:'#6b6af7', opacity:0.3},
                                    },
                                }],
                            [{

                                yAxis: tem - 0.2,
                                itemStyle:{
                                    normal:{color:'#25d607', opacity:0.3},
                                },
                            },
                                {
                                    yAxis: tem  + 0.2,
                                    itemStyle:{
                                        normal:{color:'#25d607', opacity:0.3},
                                    },
                                }],
                            [{
                                yAxis: tem + 0.2,
                                itemStyle:{
                                    normal:{color:'#6b6af7', opacity:0.3},
                                },
                            },
                                {
                                    yAxis: tem  + 1,
                                    itemStyle:{
                                        normal:{color:'#bule', opacity:0.3},
                                    },
                                }]
                        ]

                    };
                    option5.yAxis.max = (tem + 1).toFixed(1);
                    option5.yAxis.min = (tem - 1).toFixed(1);
                    option5.xAxis.data = res['discNumMap'][ratioNum];
                    option5.series[0].data = res['allItem'][ratioNum];
                    //option5.series[0].markLine.data = [{yAxis:tem + 0.2,xAxis:  res['allItem'][ratioNum]},{yAxis:tem - 0.2,xAxis:  res['allItem'][ratioNum]}];
                    option5.series[0].markArea = markArea;
                    myChart5.setOption(option5);
                    window.addEventListener("resize", function () {
                        myChart5.resize();
                    });
                }

            })
            getTemperaturesDataByConditions(crew,ratioNum);
        }

    }

    //选择日期与机组后查询日期内生产的模板
    function  getProduceRatioByCrew() {

        var crew = $("#crew_num option:selected").val();
        var proDate = "";
        var day1 = new Date();
        day1.setDate(day1.getDate() - 7);
        var s1 = day1.format("yyyy-MM-dd");
        var endDate = s1 + " " + "00:00:00";
        var startDate = new Date().format("yyyy-MM-dd hh:mm:ss");
        proDate = endDate + "to" + startDate ;
        if (crew == null || crew == ""){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.alert("请先选择机组")
            });
        }else {
            debugger
            $.ajax({
                url: basePath + "/getRatioListByDate.do",
                type: "post",
                dataType:"json",
                data:{"proData":proDate,"crew":crew},
                success:function (res) {
                    if (res.length <= 0){
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.alert("该日期并无生产");
                        });
                        $("#pro_message").text("该日期并无生产");
                    }else {
                        $("#ratio_id").empty();
                        for (var i = 0; i < res.length;i++){
                            $("#ratio_id").append("<option value=" + res[i].modele_id + ">" + res[i].pro_name + "</option>");
                        }
                    }
                }
            })
        }
    }

    function getLastSevenDayTemperaturesDataToChart(){
        $.ajax({
            url: basePath + "/getLastSevenDayTemperaturesDataToChart.do",
            type: "get",
            dataType:"json",
            success:function (res) {
                if (res.length <= 0){
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg("日期内无温度信息");
                    });
                }else {
                    var proTimeArry = [];
                    var discNumArry = [];
                    var aggregateArry = [];
                    var asphaltArry = [];
                    var mixtureArry = [];
                    for (var i = 0; i < res.length;i++){
                        proTimeArry.push(res[i].proTime);
                        discNumArry.push(res[i].produce_disc_num);
                        aggregateArry.push(res[i].temperature_aggregate);
                        asphaltArry.push(res[i].temperature_asphalt);
                        mixtureArry.push(res[i].temperature_mixture);
                    }

                    option7.xAxis.data = discNumArry;
                    option7.series[0].data = aggregateArry;
                    option7.series[1].data = asphaltArry;
                    option7.series[2].data = mixtureArry;
                    myChart7.setOption(option7);
                    window.addEventListener("resize", function () {
                        myChart7.resize();
                    });
                }
            }
        })
    }

    function getTemperaturesDataByConditions(crew,ratioNum){
        $.ajax({
            url:basePath + "/getTemperaturesDataByConditions.do",
            type:"post",
            dataType:"json",
            data:{
                "crew":crew,
                "ratioNum":ratioNum
            },
            success:function (res) {
                if (res.length === 0){
                    if (res === null || res.length === 0){
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.alert("查询错误")
                        });
                        return
                    }
                }
                var proTimeArry = [];
                var discNumArry = [];
                var aggregateArry = [];
                var asphaltArry = [];
                var mixtureArry = [];
                for (var i = 0; i < res.length;i++){
                    proTimeArry.push(res[i].proTime);
                    discNumArry.push(res[i].produce_disc_num);
                    aggregateArry.push(res[i].temperature_aggregate);
                    asphaltArry.push(res[i].temperature_asphalt);
                    mixtureArry.push(res[i].temperature_mixture);
                }

                option7.xAxis.data = discNumArry;
                option7.series[0].data = aggregateArry;
                option7.series[1].data = asphaltArry;
                option7.series[2].data = mixtureArry;
                myChart7.setOption(option7);
                window.addEventListener("resize", function () {
                    myChart7.resize();
                });
            }

        })
    }

    Array.prototype.push2 =function(){
        for(var i=0; i<arguments.length; i++){
            var ele = arguments[i];
            if(this.indexOf(ele) == -1){
                this.push(ele);
            }
        }
    };


    /**
     *对Date的扩展，将 Date 转化为指定格式的String
     *月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
     *年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
     *例子：
     *(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
     *(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
     */
    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script>

    $(function () {
        setInterval('autoScroll(".commentbox")',20);
    })
    function autoScroll(obj){
        $(obj).find("ul").animate({
            marginTop : "-600px"
        },30000,function(){
            $(this).css({marginTop : "0px"}).find("li:first").appendTo(this);
        })
    }
</script>
</html>