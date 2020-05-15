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
    <script type="text/javascript" src="../../../../static/js/echarts/echarts.js"></script>
</head>
    <style>
        .basic_div{
            width: 100%;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .basic_span{
            width: 100%;
            display: block;
            text-align:center;
            color: #8bb2dc;
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
        <div class="modelpub" style="height: 50%;">
            <div class="common-tit">机组一级配图</div>
            <span class="tilt"></span>
            <div class="echart_con" id="chart7" style="width: 75%;float: left;" >
                <script type="text/javascript">
                    var myChart7= echarts.init(document.getElementById('chart7'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option7= {
                        // title: {
                        //     text: '一号机组级配曲线图'
                        // },
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限'],
                            x:'right',
                            top:'7.5%',
                            left:'27.5%',
                            textStyle:{
                                color: '#96ceb4'
                            }
                        },
                        grid:{
                            left: '2%',
                            right: '3.5%',
                            bottom: '5%',
                            containLabel: true
                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        xAxis: {
                            type: 'value',
                            min:0,
                            max:7,

                            splitLine: {
                                show: false
                            },
                            axisLabel: { //轴标签
                                show: false//不显示
                                // rotate:90
                            },
                            axisTick: { //轴刻度
                                show: false //不显示
                            },
                            axisLine: { //轴线
                                lineStyle: { //样式
                                    color: '#96ceb4' //颜色
                                }
                            },
                            // axisLabel:{
                            //     interval: 0,
                            //     formatter: function (value) {
                            //         //x轴的文字改为竖版显示
                            //         var str = value.split("");
                            //         return str.join("\n");
                            //     }
                            // }
                        },
                        dataZoom:{
                            type:'inside'
                        },
                        yAxis: {
                            type: 'value',
                            name: '占比 %',
                            nameLocation: 'end',
                            nameGap: 10,
                            position: 'left',
                            offset: 3,
                            max:100,
                            min:0,
                            scale: true,
                            nameTextStyle: {
                                color: '#fff',
                                fontSize: 11
                            },
                            axisLine: {
                                onZero: false,
                                lineStyle: {
                                    color: '#96ceb4'
                                }
                            },
                            splitLine: {
                                show: true,
                                lineStyle: {
                                    color: '#96ceb4'
                                }
                            }
                        },
                        series: [
                            {
                                type: 'line',
                                markLine: {
                                    symbol: ['none', 'none'],
                                    silent: true,
                                    label: {
                                        rotate:90,
                                        normal: {
                                            position: "start"
                                        }
                                    },
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            width:0.6,
                                            color: '#96ceb4'
                                        }
                                    },
                                    data: []
                                }
                            },
                            {
                                id: 'a',
                                type: 'line',
                                name:'合成级配',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'b',
                                type: 'line',
                                name:'实际级配',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'c',
                                type: 'line',
                                name:'上限',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'd',
                                type: 'line',
                                name:'中值',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'e',
                                type: 'line',
                                name:'下限',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            }
                        ]
                    };
                </script>

            </div>
            <div style="width: 25%;height: 93%;float: left;">
                <div class="basic_div"><span class="basic_span" style="size: 21px;font-size: 19px;color: #c4c7c0;">基本信息</span></div>
                <div class="basic_div"><span class="basic_span" id="crew1_date"></span></div>
                <div class="basic_div"><span class="basic_span" id="crew1_time"></span></div>
                <div class="basic_div"><span class="basic_span" id="crew1_ratio_name"></span></div>
                <div class="basic_div"><span class="basic_span" id="crew1_stone" ></span></div>
                <div class="basic_div"><span class="basic_span" id="crew1_asphalt" ></span></div>
                <div class="basic_div"><span class="basic_span" id="crew1_regenerate" ></span></div>
                <div class="basic_div"><span class="basic_span" id="crew1_additive" ></span></div>
            </div>
        </div>
        <div class="modelpub margin10" style="height: 48%;">
            <div class="common-tit" id="aar1_title" ></div>
            <span class="tilt"></span>
            <div class="echart_con bar_l_echart" id="chart3">
                <script type="text/javascript">
                    var myChart3= echarts.init(document.getElementById('chart3'));
                    // 指定图表的配置项和数据
                    var option3 = {
                        tooltip: {
                            trigger: 'axis'
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                magicType: {type: ['line', 'bar']},
                                restore: {},
                                saveAsImage: {}
                            }
                        },

                        xAxis: [{
                            axisLine: { //轴线
                                lineStyle: { //样式
                                    color: '#96ceb4' //颜色
                                }
                            },
                            data: []
                        }],
                        yAxis: [{
                            type: 'value',
                            interval :0.2,
                            max:function (v) {
                                return (v.max + 0.7).toFixed(1);
                            },
                            min:function (v) {
                                return (v.min - 0.7) < 0? 0:(v.min - 0.7).toFixed(1)
                            },
                            axisLabel: {
                                formatter: '{value} %'
                            },
                            nameTextStyle: {
                                color: '#fff',
                                fontSize: 11
                            },
                            splitLine:{
                                lineStyle: {
                                    color: '#96ceb4'
                                },
                                show:false    //去掉网格线
                            },
                            axisLine:{
                                type : 'solid',
                                lineStyle:{
                                    color: '#96ceb4'
                                }
                            },
                            axisTick:{
                                show:true,
                                lineStyle:{
                                    color: '#96ceb4'
                                }
                            }
                        }],
                        grid:{
                            left: '2%',
                            right: '3.5%',
                            bottom: '5%',
                            containLabel: true
                        },
                        series: [{
                            type: 'line',
                            showSymbol: true,
                            data: [],
                            markLine: {
                                symbol: ['none', 'arrow'],
                                silent:false,
                                lineStyle: {
                                    type: 'solid',
                                    normal: {
                                        color: '#F8AC59'
                                    }
                                },
                                data: []
                            }
                        }]
                    };
                    myChart3.setOption(option3);
                </script>
            </div>
        </div>
    </div>

    <!--首页左侧 end -->

    <!--首页右侧 sta -->
    <div class="comtab">
        <div class="modelpub" style="height: 50%;" >
            <div class="common-tit">机组二级配图</div>
            <div class="echart_con bar_c_echart"  id="chart4" style="width: 75%;float: left;">
                <script type="text/javascript">
                    var myChart4 = echarts.init(document.getElementById('chart4'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option4= {
                        // title: {
                        //     text: '一号机组级配曲线图'
                        // },
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限'],
                            x:'right',
                            top:'7.5%',
                            left:'27.5%',
                            textStyle:{
                                color: '#96ceb4'
                            }
                        },
                        grid:{
                            left: '2%',
                            right: '3.5%',
                            bottom: '5%',
                            containLabel: true
                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        xAxis: {
                            type: 'value',
                            min:0,
                            max:7,

                            splitLine: {
                                show: false
                            },
                            axisLabel: { //轴标签
                                show: false//不显示
                                // rotate:90
                            },
                            axisTick: { //轴刻度
                                show: false //不显示
                            },
                            axisLine: { //轴线
                                lineStyle: { //样式
                                    color: '#96ceb4' //颜色
                                }
                            },
                            // axisLabel:{
                            //     interval: 0,
                            //     formatter: function (value) {
                            //         //x轴的文字改为竖版显示
                            //         var str = value.split("");
                            //         return str.join("\n");
                            //     }
                            // }
                        },
                        dataZoom:{
                            type:'inside'
                        },
                        yAxis: {
                            type: 'value',
                            name: '占比 %',
                            nameLocation: 'end',
                            nameGap: 10,
                            position: 'left',
                            offset: 3,
                            max:100,
                            min:0,
                            scale: true,
                            nameTextStyle: {
                                color: '#fff',
                                fontSize: 11
                            },
                            axisLine: {
                                onZero: false,
                                lineStyle: {
                                    color: '#96ceb4'
                                }
                            },
                            splitLine: {
                                show: true,
                                lineStyle: {
                                    color: '#96ceb4'
                                }
                            }
                        },
                        series: [
                            {
                                type: 'line',
                                markLine: {
                                    symbol: ['none', 'none'],
                                    silent: true,
                                    label: {
                                        rotate:90,
                                        normal: {
                                            position: "start"
                                        }
                                    },
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            width:0.6,
                                            color: '#96ceb4'
                                        }
                                    },
                                    data: []
                                }
                            },
                            {
                                id: 'a',
                                type: 'line',
                                name:'合成级配',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'b',
                                type: 'line',
                                name:'实际级配',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'c',
                                type: 'line',
                                name:'上限',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'd',
                                type: 'line',
                                name:'中值',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'e',
                                type: 'line',
                                name:'下限',
                                symbolSize:6,
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            }
                        ]
                    };

                </script>
            </div>
            <div style="width: 25%;height: 93%;float: left;">
                <div class="basic_div"><span class="basic_span" style="size: 21px;font-size: 19px;color: #c4c7c0;">基本信息</span></div>
                <div class="basic_div"><span class="basic_span" id="crew2_date"></span></div>
                <div class="basic_div"><span class="basic_span" id="crew2_time"></span></div>
                <div class="basic_div"><span class="basic_span" id="crew2_ratio_name"></span></div>
                <div class="basic_div"><span class="basic_span" id="crew2_stone" ></span></div>
                <div class="basic_div"><span class="basic_span" id="crew2_asphalt" ></span></div>
                <div class="basic_div"><span class="basic_span" id="crew2_regenerate" ></span></div>
                <div class="basic_div"><span class="basic_span" id="crew2_additive" ></span></div>
            </div>
        </div>
        <div class="modelpub margin10" style="height: 48%;">
            <div class="common-tit" id="aar2_title"></div>
            <span class="tilt"></span>
            <div class="echart_con"  id="chart6">
                <script type="text/javascript">
                    var myChart6 = echarts.init(document.getElementById('chart6'));
                    // 指定图表的配置项和数据
                    var option6 = {
                        tooltip: {
                            trigger: 'axis'
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                magicType: {type: ['line', 'bar']},
                                restore: {},
                                saveAsImage: {}
                            }
                        },
                        xAxis: [{
                            axisLine: { //轴线
                                lineStyle: { //样式
                                    color: '#96ceb4' //颜色
                                }
                            },
                            data: []
                        }],
                        yAxis: [{
                            type: 'value',
                            interval :0.2,
                            max:function (v) {
                                return (v.max + 0.7).toFixed(1);
                            },
                            min:function (v) {
                                return (v.min - 0.7) < 0? 0:(v.min - 0.7).toFixed(1)
                            },
                            axisLabel: {
                                formatter: '{value} %'
                            },
                            nameTextStyle: {
                                color: '#fff',
                                fontSize: 11
                            },
                            splitLine:{
                                lineStyle: {
                                    color: '#96ceb4'
                                },
                                show:false    //去掉网格线
                            },
                            axisLine:{
                                type : 'solid',
                                lineStyle:{
                                    color: '#96ceb4'
                                }
                            },
                            axisTick:{
                                show:true,
                                lineStyle:{
                                    color: '#96ceb4'
                                }
                            }
                        }],
                        grid:{
                            left: '2%',
                            right: '3.5%',
                            bottom: '5%',
                            containLabel: true
                        },
                        series: [{
                            type: 'line',
                            showSymbol: true,
                            data: [],
                            markLine: {
                                symbol: ['none', 'arrow'],
                                silent: true,
                                lineStyle: {
                                    normal: {
                                        color: '#F8AC59'
                                    }
                                },
                                data: []
                            }
                        }]
                    };

                </script>
            </div>
        </div>
    </div>
    <!--首页右侧 end -->
</div>
</div>
<input id="path" value="${path}" type="hidden">
<div class="clearfix"></div>
<!--首页底部 sta -->
<!--<div id="model-foot" class="model-foot">

</div>-->
<!--首页底部 end-->
<script type="text/javascript" src="../../../../static/cockpit/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-3d.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/header-footer.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/pagejs/indexSSHZ.js?c=2.9"></script>
</body>
</html>
