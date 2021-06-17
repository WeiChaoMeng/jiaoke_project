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

</head>
<body>
<div class="wrap-container welcome-container">
    <div class="row">
        <div class="welcome-left-container col-lg-9">
            <div class="data-show">
                <ul class="clearfix">
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a href="javascript:;" class="clearfix">
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
                        <a href="javascript:;" class="clearfix">
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
                        <a href="javascript:;" class="clearfix">
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
                        <a href="javascript:;" class="clearfix">
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
        <div style="padding-top: 15px;">
            <c:choose>
                <c:when test="${!empty rationList}">
                    <c:forEach items="${rationList}" var="keys" varStatus="status">

                        <li class="card-item active">
                            <div class="card">
                                <div class="card-title title-even">
                                    <div class="content">
                                        <div class="zq-product-img">
                                            <i class="zq-icon icon40x40 crad-area-icon1"></i>
                                        </div>
                                        <c:choose>
                                            <C:when test="${empty material}">

                                                <c:forEach items="${ratioMap}" var="rationMess" >
                                                    <c:if test="${rationMess.crew1_modele_id == keys || rationMess.crew2_modele_id == keys}">
                                                        <h2>一星期内${rationMess.pro_name}产品油石比走势图</h2>
                                                        <c:set var="rationName" value="${rationMess.pro_name}"></c:set>
                                                    </c:if>
                                                </c:forEach>

                                            </C:when>
                                            <c:otherwise>
                                                <c:forEach items="${ratioMap}" var="rationMess" >
                                                    <c:if test="${rationMess.crew1_modele_id == keys || rationMess.crew2_modele_id == keys}">
                                                        <h2>一星期内${rationMess.pro_name}产品${material}走势图</h2>
                                                        <c:set var="rationName" value="${rationMess.pro_name}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                                <div class="card-content content-first bg-e8e8e8">
                                    <!-- <ul class="content-first-list">
                                    <li>分天查看油石比</li>
                                    </ul> -->
                                </div>
                                <div class="card-content content-second">

                                    <div class="main-info">
                                        <div id="chart${status.index + 100}" class="charts1"></div>

                                        <script type="text/javascript">
                                            var myChart${status.index + 100} = echarts.init(document.getElementById('chart${status.index + 100}'));
                                            // 指定图表的配置项和数据
                                            var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                            function getxAxis(total) {
                                                var categoryData = [];
                                                var month= total;
                                                var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                                for(var j = 1; j <= month; j++) {
                                                    categoryData.push(j);
                                                };
                                                return categoryData;
                                            }

                                            var option${status.index + 100} = {

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
                                                    },
                                                    {
                                                        type: 'inside'
                                                    }],
                                                grid: {
                                                    left: '7%',
                                                    right: '7%',
                                                    bottom: '15%',
                                                    top:'15%'
                                                    // containLabel: true
                                                },
                                                toolbox: {
                                                    feature: {
                                                        saveAsImage: {}
                                                    }
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
                                                    max: function (value) {
                                                        return (value.max + 0.25).toFixed(2);
                                                    },
                                                    min:function (value) {
                                                        return (value.min - 0.25) < 0? 0:(value.min - 0.25).toFixed(2);
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
                                                        lineStyle:{normal:{color:'#333333',width:2}},
                                                        smooth:true,  //这句就是让曲线变平滑的
                                                        symbol:'circle',
                                                        //     symbol:"image://",
                                                        symbolSize: 7,

                                                        data:
                                                        <c:forEach items="${allItem}" var="materialsRation">
                                                        <c:if test="${materialsRation.key == keys}" >
                                                        ${materialsRation.value},
                                                        </c:if>
                                                        </c:forEach>
                                                        markLine:{
                                                            silent: true,
                                                            data: [
                                                                <c:choose>
                                                                <c:when test="${material == '油石比' || material == '石粉' ||empty material}">
                                                                { yAxis: '${moudelRatio[keys] + 0.2}', xAxis: '${fn:length(allItem[keys])}'},
                                                                { yAxis: '${moudelRatio[keys] - 0.2}', xAxis: '${fn:length(allItem[keys])}'}
                                                                </c:when>
                                                                <c:otherwise>
                                                                { yAxis: '${moudelRatio[keys] + 3}', xAxis: '${fn:length(allItem[keys])}'},
                                                                { yAxis: '${moudelRatio[keys] - 3}', xAxis: '${fn:length(allItem[keys])}'}
                                                                </c:otherwise>
                                                                </c:choose>
                                                            ]
                                                        }

                                                    },

                                                ]
                                            };
                                            myChart${status.index + 100}.setOption(option${status.index + 100});
                                            window.addEventListener("resize", function () {
                                                myChart${status.index + 100}.resize();
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>
                        </li>


                        <li class="card-item active">
                            <div class="card">
                                <div class="card-title title-even">
                                    <div class="content">
                                        <div class="zq-product-img">
                                            <i class="zq-icon icon40x40 crad-area-icon1"></i>
                                        </div>

                                        <c:choose>
                                            <C:when test="${empty material}">
                                                <h2>一星期内${rationName}产品油石比极差走势图</h2>
                                            </C:when>
                                            <c:otherwise>
                                                <h2>一星期内${rationName}产品${material}极差走势图</h2>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="card-content content-first bg-e8e8e8">
                                    <ul class="content-first-list">
                                        <li></li>
                                    </ul>
                                </div>
                                <div class="card-content content-second">

                                    <div class="main-info">
                                        <div id="chart${status.index + 200}" class="charts1"></div>

                                        <script type="text/javascript">

                                            var myChart${status.index + 200} = echarts.init(document.getElementById('chart${status.index + 200}'));
                                            // 指定图表的配置项和数据
                                            var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                            function getxAxis(total) {
                                                var categoryData = [];
                                                var month= total;
                                                var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                                for(var j = 1; j <= month; j++) {
                                                    categoryData.push(j);
                                                };
                                                return categoryData;
                                            }
                                            var option${status.index + 200} = {
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
                                                        res = "<div style='border-top:5px solid #0066cc;background:#010204;padding:0 30px 10px 20px;font-weight:700;font-size:14;'><p>次数："
                                                            + times+ "</p><p>含量："
                                                            + value+ "</p></div>";
                                                        return res;
                                                    }
                                                },
                                                dataZoom: [
                                                    {
                                                        start:0,
                                                        end:100,
                                                    },
                                                    {
                                                        type: 'inside'
                                                    }],
                                                toolbox: {
                                                    feature: {
                                                        saveAsImage: {}
                                                    }
                                                },
                                                grid: {
                                                    left: '7%',
                                                    right: '7%',
                                                    bottom: '15%',
                                                    top:'15%'
                                                },
                                                xAxis: {
                                                    type: 'category',
                                                    name: '',
                                                    // splitLine: linecolor,
                                                    axisTick:{show:false},
                                                    axisLine:linecolor,
                                                    // axisLabel:{color:'#fff'},
                                                    //  boundaryGap:false,
                                                    data: getxAxis(${fn:length(maxMin[keys])})
                                                },
                                                yAxis: {
                                                    type: 'value',
                                                    name: '',
                                                    axisTick:{show:false},
                                                    axisLine:linecolor,
                                                    // splitLine: linecolor,
                                                    // axisLabel:{color:'#fff'},
                                                    axisLabel: {
                                                        formatter: '{value} %'
                                                    },
                                                    max: function (value) {
                                                        return (value.max + 0.25).toFixed(2);
                                                    },
                                                    min:function (value) {
                                                        return (value.min - 0.25) < 0? 0:(value.min - 0.25).toFixed(2);
                                                    },
                                                },
                                                series: [
                                                    {
                                                        name: '3的指数',
                                                        type: 'line',
                                                        lineStyle:{normal:{color:'#333333',width:2}},

                                                        smooth:true,  //这句就是让曲线变平滑的
                                                        symbol:'circle',
                                                        //     symbol:"image://",
                                                        symbolSize: 7,

                                                        data:
                                                        <c:forEach items="${maxMin}" var="maxMinRation">
                                                        <c:if test="${maxMinRation.key == keys}" >
                                                        //极差是偏差值*2
                                                        ${maxMinRation.value},
                                                        </c:if>
                                                        </c:forEach>
                                                    },
                                                    {
                                                        name: '5的指数',
                                                        type: 'line',
                                                        lineStyle:{normal:{color:'#333333',width:2}},
                                                        step: 'start',
                                                        symbol:'none',  //这句就是去掉点的
                                                        smooth:false,  //这句就是让曲线变平滑的
                                                        itemStyle:{
                                                            normal:{
                                                                lineStyle:{
                                                                    width:2,
                                                                    type:'dotted'  //'dotted'虚线 'solid'实线
                                                                }
                                                            }
                                                        },
                                                        <%--markLine:{--%>
                                                        <%--silent: true,--%>
                                                        <%--data: [--%>
                                                        <%--<c:choose>--%>
                                                        <%--<c:when test="${material == '油石比' || material == '石粉' ||empty material}">--%>
                                                        <%--{ yAxis: '${(moudelRatio[keys] + 0.2)/2}', xAxis: '${fn:length(allItem[keys])}'},--%>
                                                        <%--{ yAxis: '${(moudelRatio[keys] - 0.2)/2}', xAxis: '${fn:length(allItem[keys])}'}--%>
                                                        <%--</c:when>--%>
                                                        <%--<c:otherwise>--%>
                                                        <%--{ yAxis: '${(moudelRatio[keys] + 3)/2}', xAxis: '${fn:length(allItem[keys])}'},--%>
                                                        <%--{ yAxis: '${(moudelRatio[keys] - 3)/2}', xAxis: '${fn:length(allItem[keys])}'}--%>
                                                        <%--</c:otherwise>--%>
                                                        <%--</c:choose>--%>
                                                        <%--]--%>
                                                        <%--},--%>
                                                        data:[
                                                            //极差是偏差值*2
                                                            <c:forEach items="${maxMinUp[keys]}" var="maxMinUpRation" varStatus="statusMaxMin">
                                                            ${maxMinUpRation}, ${maxMinUpRation}, ${maxMinUpRation}, ${maxMinUpRation}, ${maxMinUpRation},
                                                            </c:forEach>
                                                        ]},

                                                ]
                                            };
                                            myChart${status.index + 200}.setOption(option${status.index + 200});
                                            window.addEventListener("resize", function () {
                                                myChart${status.index + 200}.resize();
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>
                        </li>


                        <li class="card-item active">
                            <div class="card">
                                <div class="card-title title-even">
                                    <div class="content">
                                        <div class="zq-product-img">
                                            <i class="zq-icon icon40x40 crad-area-icon3"></i>
                                        </div>

                                        <c:choose>
                                            <C:when test="${empty material}">
                                                <h2>一星期内${rationName}产品平均油石比走势图</h2>
                                            </C:when>
                                            <c:otherwise>
                                                <h2>一星期内${rationName}产品平均${material}走势图</h2>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="card-content content-first bg-e8e8e8">
                                    <ul class="content-first-list">
                                        <li></li>
                                    </ul>
                                </div>
                                <div class="card-content content-second">

                                    <div class="main-info">
                                        <div id="chart${status.index + 300}" class="charts1"></div>

                                        <script type="text/javascript">
                                            var myChart${status.index + 300} = echarts.init(document.getElementById('chart${status.index + 300}'));
                                            // 指定图表的配置项和数据
                                            var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                            function getxAxis(total) {
                                                var categoryData = [];
                                                var month= total;
                                                var linecolor ={show:true,lineStyle:{color:'#17334e'}};
                                                for(var j = 1; j <= month; j++) {
                                                    categoryData.push(j);
                                                };
                                                return categoryData;
                                            }
                                            var option${status.index + 300} = {
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
                                                        var times = params[0].name;
                                                        //  var times = "2017-11-23 11:00:18";
                                                        res = "<div style='border-top:5px solid #0066cc;background:#010204;padding:0 30px 10px 20px;font-weight:700;font-size:14;'><p>序号："
                                                            + times+ "</p><p>含量："
                                                            + value+ "</p></div>";
                                                        return res;
                                                    }
                                                },
                                                toolbox: {
                                                    feature: {
                                                        saveAsImage: {}
                                                    }
                                                },
                                                grid: {
                                                    left: '7%',
                                                    right: '7%',
                                                    bottom: '15%',
                                                    top:'15%'
                                                },
                                                dataZoom: [
                                                    {
                                                        start:0,
                                                        end:100,
                                                    },
                                                    {
                                                        type: 'inside'
                                                    }],
                                                xAxis: {
                                                    type: 'category',
                                                    name: '',
                                                    // splitLine: linecolor,
                                                    axisTick:{show:false},
                                                    axisLine:linecolor,
                                                    // axisLabel:{color:'#fff'},
                                                    //  boundaryGap:false,
                                                    data: getxAxis(${fn:length(svg3[keys])})
                                                },
                                                yAxis: {
                                                    type: 'value',
                                                    name: '',
                                                    axisTick:{show:false},
                                                    axisLine:linecolor,
                                                    // splitLine: linecolor,
                                                    // axisLabel:{color:'#fff'},
                                                    axisLabel: {
                                                        formatter: '{value} %'
                                                    },
                                                    Interval:0.5,
                                                    max: function (value) {
                                                        return (value.max + 0.25).toFixed(2);
                                                    },
                                                    min:function (value) {
                                                        return (value.min - 0.25) < 0? 0:(value.min - 0.25).toFixed(2);
                                                    },
                                                    // max: function (v) {
                                                    //     return (v.max + 0.5).toFixed(1)
                                                    // },
                                                    // min: function (v) {
                                                    //     return v.min - 0.5 < 0? 0:(v.min - 5).toFixed(1);
                                                    // },
                                                },
                                                series: [

                                                    {
                                                        name: '3的指数',
                                                        type: 'line',
                                                        lineStyle:{normal:{color:'#333333',width:2}},
                                                        smooth:true,  //这句就是让曲线变平滑的
                                                        symbol:'circle',
                                                        //     symbol:"image://",
                                                        symbolSize: 7,

                                                        data:

                                                        <c:forEach items="${svg3}" var="svg3Ration">
                                                        <c:if test="${svg3Ration.key == keys}" >
                                                        ${svg3Ration.value},
                                                        </c:if>
                                                        </c:forEach>
                                                    },
                                                    {
                                                        name: '上限',
                                                        type: 'line',
                                                        lineStyle:{normal:{color:'#333333',width:2}},
                                                        step: 'start',
                                                        symbol:'none',  //这句就是去掉点的
                                                        smooth:false,  //这句就是让曲线变平滑的
                                                        itemStyle:{
                                                            normal:{
                                                                lineStyle:{
                                                                    width:2,
                                                                    type:'dotted'  //'dotted'虚线 'solid'实线
                                                                }
                                                            }
                                                        },
                                                        data:[
                                                            <c:forEach items="${svg5up[keys]}" var="svg5upRation">
                                                            ${svg5upRation}, ${svg5upRation}, ${svg5upRation}, ${svg5upRation}, ${svg5upRation},
                                                            </c:forEach>
                                                        ]},
                                                    {
                                                        name: '下限',
                                                        type: 'line',
                                                        lineStyle:{normal:{color:'#333333',width:2}},
                                                        step: 'start',
                                                        symbol:'none',  //这句就是去掉点的
                                                        smooth:false,  //这句就是让曲线变平滑的
                                                        itemStyle:{
                                                            normal:{
                                                                lineStyle:{
                                                                    width:2,
                                                                    type:'dotted'  //'dotted'虚线 'solid'实线
                                                                }
                                                            }
                                                        },
                                                        markLine:{
                                                            silent: true,
                                                            data: [
                                                                <c:choose>
                                                                <c:when test="${material == '油石比' || material == '石粉' ||empty material}">
                                                                { yAxis: '${moudelRatio[keys] + 0.2}', xAxis: '${fn:length(allItem[keys])}'},
                                                                { yAxis: '${moudelRatio[keys] - 0.2}', xAxis: '${fn:length(allItem[keys])}'}
                                                                </c:when>
                                                                <c:otherwise>
                                                                { yAxis: '${moudelRatio[keys] + 3}', xAxis: '${fn:length(allItem[keys])}'},
                                                                { yAxis: '${moudelRatio[keys] - 3}', xAxis: '${fn:length(allItem[keys])}'}
                                                                </c:otherwise>
                                                                </c:choose>
                                                            ]
                                                        },
                                                        data:[
                                                            <c:forEach items="${svg5down[keys]}" var="svg5downRation">
                                                            ${svg5downRation}, ${svg5downRation}, ${svg5downRation}, ${svg5downRation}, ${svg5downRation},
                                                            </c:forEach>
                                                        ]},
                                                ]
                                            };
                                            myChart${status.index + 300}.setOption(option${status.index + 300});
                                            window.addEventListener("resize", function () {
                                                myChart${status.index + 300}.resize();
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p id="pro_message" style="width: 100%; padding-left: 45%;padding-top: 5%;font-size: 14px;">一星期内无生产</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <%--js获取路径--%>
    <input id="path" type="hidden" value="${path}"/>
</div>

<script type="text/javascript">
    var basePath ;
    $(function () {
        basePath  = $("#path").val();
        //柱状图
        getLastYearEverMonthTotalToEchart();
        //预警相关
        getLastTenWarning();
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
                        layer.alert("未查询到生产信息")
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
                            layer.alert("今日暂无预警信息")
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
                        return "八月";
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
                    title : {text: monthArray[i] + '月两台机组产量'},
                    series : [
                        {data: crew1[intex]},
                        {data:  crew2[intex]},
                        {data: [
                                {name: '机组一', value: crew1[intex + 'sum']},
                                {name: '机组二', value: crew2[intex + 'sum']}
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
                    playInterval: 2000,
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
                                        color:'#91cc75'
                                    }
                                }
                                },
                    {name: '机组二', type: 'bar',                       itemStyle:{
                            normal:{
                                color:'#31acfa'
                            }
                        }},
                    {
                        name: '各机组生产',
                        type: 'pie',
                        center: ['75%', '35%'],
                        radius: '28%',
                        color:["#91cc75","#31acfa"],
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

    Array.prototype.push2 =function(){
        for(var i=0; i<arguments.length; i++){
            var ele = arguments[i];
            if(this.indexOf(ele) == -1){
                this.push(ele);
            }
        }
    };
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