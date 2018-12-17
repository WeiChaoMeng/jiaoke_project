<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>模板更新</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body style="padding:15px 8px 500px 8px;">

<div class="divbox">

    <div class="">
        <div class="boxtitle"><span>产品基本信息</span></div>

        <div class="boxdown">
            <table class="simpletable">
                            <thead>
                                <th>生产日期</th>
                                <th>生产时间</th>
                                <th>配比号</th>
                                <th>车号</th>
                                <th>盘号</th>
                                <th>客户号</th>
                            </thead>
                            
                            <tbody>
                            
                                <tr>
                                    <td>${product.proBase.produce_date}</td>
                                    <td>${product.proBase.produce_time}</td>
                                    <td>${product.proBase.produce_proportioning_num}</td>
                                    <td>${product.proBase.produce_car_num}</td>
                                    <td>${product.proBase.produce_disc_num}</td>
                                    <td>${product.proBase.produce_custom_num}</td>
                                </tr>
                            
                            </tbody>

            </table>
        </div>

    </div>
</div>

<div class="">
    <div class="">
        <div class="boxtitle">
            <span>产品详细数据信息</span>
        </div>

        <div class="boxdown">
            <table class="simpletable">
                <thead>
                    <th style="width: 70px">盘号</th>
                    <th style="width: 70px ">配比号</th>
                    <th style="width: 70px">骨料1</th>
                    <th style="width: 70px">骨料2</th>
                    <th style="width: 70px">骨料3</th>
                    <th style="width: 70px">骨料4</th>
                    <th style="width: 70px">骨料5</th>
                    <th style="width: 70px">骨料6</th>
                    <th style="width: 70px ">石粉2</th>
                    <th style="width: 70px ">石粉1</th>
                    <th style="width: 70px ">沥青</th>
                    <th style="width: 70px ">再生料</th>
                    <th style="width: 70px ">添加剂</th>
                    <th style="width: 100px">合计(kg)</th>
                   
                </thead>
                
                <tbody>
                    <tr></tr>
                    <tr>
                        <td>${product.proBase.produce_disc_num}</td>
                        <td>${product.proBase.produce_proportioning_num}</td>
                        <td>${product.proBase.material_aggregate_1 - product.proBase.material_aggregate_2}</td>
                        <td>${product.proBase.material_aggregate_2 - product.proBase.material_aggregate_3}</td>
                        <td>${product.proBase.material_aggregate_3 - product.proBase.material_aggregate_4}</td>
                        <td>${product.proBase.material_aggregate_4 - product.proBase.material_aggregate_5}</td>
                        <td>${product.proBase.material_aggregate_5 - product.proBase.material_aggregate_6}</td>
                        <td>${product.proBase.material_aggregate_6}</td>
                        <td>${product.proBase.material_stone_1}</td>
                        <td>${product.proBase.material_stone_2}</td>
                        <td>${product.proBase.material_asphalt}</td>
                        <td>${product.proBase.material_regenerate}</td>
                        <td>${product.proBase.material_additive}</td>
                        <td>${product.proBase.material_total}</td>
                    </tr>
                
                </tbody>
                <thead>
                    <th style="width: 100px ">1仓温度</th>
                    <th style="width: 100px ">混合料温度</th>
                    <th style="width: 100px ">除尘器入口温度</th>
                    <th style="width: 100px ">沥青温度</th>
                    <th style="width: 100px ">再生料温度</th>
                    <th style="width: 100px ">骨料1比例</th>
                    <th style="width: 100px ">骨料2比例</th>
                    <th style="width: 100px ">骨料3比例</th>
                    <th style="width: 100px ">骨料4比例</th>
                    <th style="width: 100px ">骨料5比例</th>
                    <th style="width: 100px ">骨料6比例</th>
                    <th style="width: 100px ">矿料1比例</th>
                    <th style="width: 100px ">沥青占比</th>
                    <th style="width: 100px ">再生料占比</th>
                </thead>
                <tbody>
                    <td>${product.proBase.temperature_warehouse_1}</td>
                    <td>${product.proBase.temperature_mixture}</td>
                    <td>${product.proBase.temperature_duster}</td>
                    <td>${product.proBase.temperature_asphalt}</td>
                    <td>${product.proBase.temperature_aggregate}</td>
                    <c:forEach items="${product.proMessage}" var="item">
                        <c:choose>
                            <c:when test="${item.material_name == '骨料1'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '骨料2'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '骨料3'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '骨料4'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '骨料5'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '骨料6'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '矿粉'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '沥青'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                            <c:when test="${item.material_name == '再生料'}">
                                <td>${item.actual_ratio}</td>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>


<div class="divbox_realtime">

    <li>

        <div>
            <div class="boxtitle">

            </div>
            <div id="chart" class="charts1"></div>
        </div>

        <script type="text/javascript">
            var myChart = echarts.init(document.getElementById('chart'));
            // 指定图表的配置项和数据
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var option = {
                title: {
                    text: '产品材料配比图',
                    subtext: '材料构成',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['骨料1', '骨料2','骨料3','骨料4','骨料5','骨料6','石粉1', '石粉2', '沥青', '再生料','添加剂']
                },
                series: [
                    {
                        name: '构成图',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: [
                            {value: ${product.proBase.material_aggregate_1 - product.proBase.material_aggregate_2}, name: '骨料1'},
                            {value: ${product.proBase.material_aggregate_2 - product.proBase.material_aggregate_3}, name: '骨料2'},
                            {value: ${product.proBase.material_aggregate_3 - product.proBase.material_aggregate_4}, name: '骨料3'},
                            {value: ${product.proBase.material_aggregate_4 - product.proBase.material_aggregate_5}, name: '骨料4'},
                            {value: ${product.proBase.material_aggregate_5 - product.proBase.material_aggregate_6}, name: '骨料5'},
                            {value: ${product.proBase.material_aggregate_6}, name: '骨料6'},
                            {value: ${product.proBase.material_stone_1}, name: '石粉1'},
                            {value: ${product.proBase.material_stone_2}, name: '石粉2'},
                            {value: ${product.proBase.material_asphalt}, name: '沥青'},
                            {value: ${product.proBase.material_regenerate}, name: '再生料'},
                            {value: ${product.proBase.material_additive}, name: '添加剂'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };


            myChart.setOption(option);
            window.addEventListener("resize", function () {
                myChart.resize();
            });
        </script>
</div>
</li>


<div class="divbox_realtime">
    <div>
        <div class="boxtitle">

        </div>
        <div id="chart2" class="charts1"></div>
    </div>

    <script type="text/javascript">
        var myChart2 = echarts.init(document.getElementById('chart2'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option2 =  {
                title: {
                    text: '产品材料构成曲线图',
                    subtext: ''
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['模板占比', '实际占比']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['骨料1','骨料2','骨料3','骨料4','骨料5','骨料6','矿粉','沥青','再生料']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} %'
                    }
                },
                series: [
                    {
                        name: '上限占比',
                        type: 'line',
                        data: [
                        <c:forEach items="${product.proMessage}" var="item" varStatus="sta">
                            <c:choose>
                                <c:when test="${item.material_name == '骨料1'}">
                                    ${item.moudle_ratio + 2 },
                                </c:when>
                                <c:when test="${item.material_name == '骨料2'}">
                                    ${item.moudle_ratio + 2},
                                </c:when>
                                <c:when test="${item.material_name == '骨料3'}">
                                    ${item.moudle_ratio + 4},
                                </c:when>
                                <c:when test="${item.material_name == '骨料4'}">
                                    ${item.moudle_ratio + 4 },
                                </c:when>
                                <c:when test="${item.material_name == '骨料5'}">
                                    ${item.moudle_ratio + 4 },
                                </c:when>
                                <c:when test="${item.material_name == '骨料6'}">
                                    ${item.moudle_ratio + 4},
                                </c:when>
                                <c:when test="${item.material_name == '矿粉'}">
                                    ${item.moudle_ratio + 1},
                                </c:when>
                                <c:when test="${item.material_name == '沥青'}">
                                    ${item.moudle_ratio + 1},
                                </c:when>
                                <c:when test="${item.material_name == '再生料'}">
                                    ${item.moudle_ratio + 1},
                                </c:when>
                            </c:choose>
                        </c:forEach>
                         ],
                        formatter: '{value} %'
                    },
                    {
                        name: '实际占比',
                        type: 'line',
                        data: [
                            <c:forEach items="${product.proMessage}" var="item" varStatus="sta">
                                <c:choose>
                                    <c:when test="${item.material_name == '骨料1'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料2'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料3'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料4'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料5'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料6'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '矿粉'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '沥青'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                    <c:when test="${item.material_name == '再生料'}">
                                        ${item.actual_ratio},
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        ],
                        formatter: '{value} %'
                    },
                    {
                        name: '下限占比',
                        type: 'line',
                        data: [
                            <c:forEach items="${product.proMessage}" var="item" varStatus="sta">
                                <c:choose>
                                    <c:when test="${item.material_name == '骨料1'}">
                                    ${item.moudle_ratio - 2 },
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料2'}">
                                    ${item.moudle_ratio - 2},
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料3'}">
                                    ${item.moudle_ratio - 4},
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料4'}">
                                    ${item.moudle_ratio - 4 },
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料5'}">
                                    ${item.moudle_ratio - 4 },
                                    </c:when>
                                    <c:when test="${item.material_name == '骨料6'}">
                                    ${item.moudle_ratio - 4},
                                    </c:when>
                                    <c:when test="${item.material_name == '矿粉'}">
                                    ${item.moudle_ratio - 1},
                                    </c:when>
                                    <c:when test="${item.material_name == '沥青'}">
                                    ${item.moudle_ratio - 1},
                                    </c:when>
                                    <c:when test="${item.material_name == '再生料'}">
                                    ${item.moudle_ratio - 1},
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        ],
                        formatter: '{value} %'
                    }
                ]
            };

            myChart2.setOption(option2);
            window.addEventListener("resize", function () {
                myChart2.resize();
            });
    </script>
</div>
</li>


</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
</html>
