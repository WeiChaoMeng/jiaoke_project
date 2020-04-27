<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path",basePath);
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
    <link rel="icon" href="../../../../static/images/favicon.ico" type="image/x-icon"/>
    <style>
        .comtab{
            width: 25%;
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
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con" style="height: 170px;" id="radar_echart">

            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con bar_l_echart" style="height: 170px;" id="xctj">

            </div>
        </div>
        <div class="modelpub">
            <div class="common-tit">标题</div>
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
                    <div class="boxnum"><span id="parknum">第58天</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">开工</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="placebg"></span>
                    <div class="boxnum"><span id="parkplace">1.7万吨</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">产量</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="freebg"></span>
                    <div class="boxnum"><span id="freenum">0.32吨</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">再生料总用量</div>
            </div>
            <div class="parkingbox marginl15">
                <div class="commombox-top"><span class="matchbg"></span>
                    <div class="boxnum"><span id="matchnum">18次</span></div>
                    <div class="commonbox-foot"></div>
                </div>
                <div class="commonbox-tit">预警</div>
            </div>
        </div>
        <!--中底 end -->
    </div>
    <!--首页居中 end -->
    <!--首页右侧 sta -->
    <div class="comtab">
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con">
                <div id="container-speed" style="height: 150px; "></div>
            </div>
        </div>
        <div class="modelpub margin10">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con bar_c_echart" style="height: 170px;" id="ldwhl">

            </div>
        </div>
        <div class="modelpub">
            <div class="common-tit">标题</div>
            <span class="tilt"></span>
            <div class="echart_con line_r_echart" style="height: 170px;" id="line_r_echart">

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
<!--首页底部 end-->
<script type="text/javascript" src="../../../../static/cockpit/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/lib/sockjs-client/1.0.2/sockjs.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/lib/stomp-websocket/2.3.3/stomp.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/lib/echarts.min.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-3d.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/lib/chifeng.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/header-footer.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/common.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/common/unit.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/pagejs/index.js?c=2.9"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/dark.js"></script>
<script type="text/javascript" src="../../../../static/cockpit/js/expo.js"></script>
<script>
    $(function () {
        echarts_3();
    });

    function echarts_3() {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('echart3'));

    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                lineStyle: {
                    color: '#57617B'
                }
            }
        },
        legend: {

            //icon: 'vertical',
            data: ['参数1', '参数2','参数3'],
            //align: 'center',
            // right: '35%',
            top:'0',
            textStyle: {
                color: "#fff"
            },
            // itemWidth: 15,
            // itemHeight: 15,
            itemGap: 20,
        },
        grid: {
            left: '0',
            right: '20',
            top:'10',
            bottom: '20',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'rgba(255,255,255,.6)'
                }
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)'
                }
            },
            data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
        }, {

        }],
        yAxis: [{
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'rgba(255,255,255,.6)'
                }
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)'
                }
            },
            splitLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)'
                }
            }
        }],
        series: [{
            name: '参数1',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(24, 163, 64, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(24, 163, 64, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#cdba00',
                    borderColor: 'rgba(137,189,2,0.27)',
                    borderWidth: 12
                }
            },
            data: [220, 182, 191, 134, 150, 120, 110, 125, 145, 122, 165, 122]
        }, {
            name: '参数2',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(39, 122,206, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(39, 122,206, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#277ace',
                    borderColor: 'rgba(0,136,212,0.2)',
                    borderWidth: 12
                }
            },
            data: [120, 110, 125, 145, 122, 165, 122, 220, 182, 191, 134, 150]
        }, {
            name: '参数3',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(39, 122,206, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(39, 122,206, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#ce0cc8',
                    borderColor: 'rgba(0,136,212,0.2)',
                    borderWidth: 12
                }
            },
            data: [20, 201, 90, 78, 30, 109, 221, 88, 70, 39, 55, 180]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    window.addEventListener("resize",function(){
        myChart.resize();
    });
}</script>
</body>
</html>
