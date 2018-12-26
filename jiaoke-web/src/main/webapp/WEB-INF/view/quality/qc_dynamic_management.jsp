<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>

<head>
    <meta charset="utf-8">
    <title>动态管理</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id = 'link'>
    <!--基本样式-->

    <link type="text/css" rel="stylesheet" href="/static/css/qc/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jedate.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/qc_select.css">
    <script type="text/javascript" src="/static/js/qc/jedate.js"></script>
    <script  src="/static/js/jquery.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>
</head>

<body style="padding:15px 8px 50px 8px;">

<ul id="cardArea" class="card-area clearfix">


    <li class="card-item active">
        <div class="card">
            <div class="card-title title-even">
                <div class="content">
                    <div class="zq-product-img">
                        <i class="zq-icon icon40x40 crad-area-icon1"></i>
                    </div>
                    <h1>条件筛选</h1>
                    <p class="short-info">根据日期、材料进行筛选后展示</p>
                </div>
            </div>
            <div class="card-content content-first bg-e8e8e8">
                <ul class="content-first-list">

                </ul>
            </div>
            <div class="card-content content-second">

                <div class="main-info">
                    <div style="width: 100%;height: 10%;" >
                        <div >
                            <div class="jeitem">
                                <label class="jelabel">日范围选择</label>
                                <div class="jeinpbox"><input type="text" class="jeinput" id="test11" placeholder="YYYY-MM-DD"></div>
                            </div>
                        </div>
                    </div>
                    <div class="behind">
                        <div class="function-list-wrap">
                            <label class="jelabel">材料选择</label>
                            <ul class="function-list">
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_aggregate_1" >一仓材料</a></li>
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_aggregate_2">二仓材料</a></li>
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_aggregate_3">三仓材料</a></li>
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_aggregate_4">四仓材料</a></li>
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_aggregate_5">五仓材料</a></li>
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_aggregate_6">六仓材料</a></li>
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_asphalt">油石比</a></li>
                                <li class="function"><a href="" onclick="chengeHref(this.id)" id="material_stone">石粉比</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </li>

    <c:forEach items="${rationList}" var="keys" varStatus="status">

        <li class="card-item active">
            <div class="card">
                <div class="card-title title-even">
                    <div class="content">
                        <div class="zq-product-img">
                            <i class="zq-icon icon40x40 crad-area-icon1"></i>
                        </div>
                        <h1>${keys}号配比油石比走势图</h1>
                        <p class="short-info">直观显示 一键生成</p>
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
                                        res = "<div style='border-top:5px solid #0066cc;background:#010204;padding:0 30px 10px 20px;font-weight:700;font-size:14;'><p>次数："
                                            + times+ "</p><p>含量："
                                            + value+ "</p></div>";
                                        return res;
                                    }
                                },
                                grid: {
                                    left: '3%',
                                    right: '4%',
                                    bottom: '3%',
                                    containLabel: true
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
                                    data: getxAxis(${fn:length(allItem[keys])})
                                },
                                yAxis: {
                                    type: 'value',
                                    name: '含量',
                                    axisTick:{show:false},
                                    axisLine:linecolor,
                                    // splitLine: linecolor,
                                    // axisLabel:{color:'#fff'},
                                    axisLabel: {
                                        formatter: '{value} %'
                                    },
                                    max: <fmt:formatNumber value="${moudelRatio[keys] + 2}" type="currency" pattern="0.0#"/>,
                                    min: <fmt:formatNumber value="${moudelRatio[keys] - 2}" type="currency" pattern="0.0#"/>,

                                },
                                series: [
                                    {
                                        name: '3的指数',
                                        type: 'line',
                                        lineStyle:{normal:{color:'#333333',width:2}},

                                        smooth:false,
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
                                            data: [

                                                { yAxis: '${moudelRatio[keys] + 1}', xAxis: ${fn:length(allItem[keys])}},
                                                { yAxis: '${moudelRatio[keys] - 1}', xAxis: ${fn:length(allItem[keys])}}
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
                        <h1>${keys}号配比油石比极差</h1>
                        <p class="short-info">自动计算 轻松工作</p>
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
                                toolbox: {
                                    feature: {
                                        saveAsImage: {}
                                    }
                                },
                                grid: {
                                    left: '3%',
                                    right: '4%',
                                    bottom: '3%',
                                    containLabel: true
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
                                    <%--max: <fmt:formatNumber value="${moudelRatio[keys] + 3}" type="currency" pattern="0.0#"/>--%>

                                },
                                series: [
                                    {
                                        name: '3的指数',
                                        type: 'line',
                                        lineStyle:{normal:{color:'#333333',width:2}},

                                        smooth:false,
                                        symbol:'circle',
                                        //     symbol:"image://",
                                        symbolSize: 7,

                                        data:
                                        <c:forEach items="${maxMin}" var="maxMinRation">
                                            <c:if test="${maxMinRation.key == keys}" >
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
                                        data:[
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
                        <h1>${keys}号配比平均油石比</h1>
                        <p class="short-info">直观展示 简单保存</p>
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
                                        var times = params[0].name
                                        //  var times = "2017-11-23 11:00:18";
                                        res = "<div style='border-top:5px solid #0066cc;background:#010204;padding:0 30px 10px 20px;font-weight:700;font-size:14;'><p>时间："
                                            + times+ "</p><p>数量："
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
                                    left: '3%',
                                    right: '4%',
                                    bottom: '3%',
                                    containLabel: true
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
                                    max: <fmt:formatNumber value="${moudelRatio[keys] }" type="currency" pattern="0.0#"/>,
                                    min: <fmt:formatNumber value="${moudelRatio[keys] - 0.5}" type="currency" pattern="0.0#"/>

                                },
                                series: [
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
                                        name: '3的指数',
                                        type: 'line',
                                        lineStyle:{normal:{color:'#333333',width:2}},
                                        // step: 'start',
                                        symbol:'circle', //这句就是去掉点的
                                        smooth:false,  //这句就是让曲线变平滑的
                                        symbolSize: 7,

                                        data:

                                            <c:forEach items="${svg3}" var="svg3Ration">
                                                <c:if test="${svg3Ration.key == keys}" >
                                                 ${svg3Ration.value},
                                                </c:if>
                                            </c:forEach>
                                    },
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
</ul>
<input id="path" type="hidden" value="${path}"/>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/qc_dynamic.js"></script>

</html>