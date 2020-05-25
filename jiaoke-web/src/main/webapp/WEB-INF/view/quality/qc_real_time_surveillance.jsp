<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <title>实时监测</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <script src="/static/js/echarts/echarts.js"></script>
</head>

<body style="padding:15px 8px 1000px 8px;background: #e5f0f0;">



    <div class="infolist_realtime">

        <div class="boxtitle">
            <span class="span_realtime">一号机组产品信息</span>
        </div>
        <div>
            <table class="realtime_table"  >

                <thead>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>配比号</th>
                    <th>产品名称</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>客户号</th>
                </thead>

                <tbody>

                    <tr>
                        <td id="crew1_basic_date" ></td>
                        <td id="crew1_basic_time" ></td>
                        <td id="crew1_basic_ratio" ></td>
                        <td id="crew1_basic_ratioName" ></td>
                        <td id="crew1_basic_carNum" ></td>
                        <td id="crew1_basic_discNum" ></td>
                        <td  id="crew1_basic_userNum" ></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="boxtitle">
            <span class="span_realtime">一号机组产品状态数据</span>
        </div>
        <div>
            <table class="realtime_table">

                <thead>
                    <th>骨料1</th>
                    <th>骨料2</th>
                    <th>骨料3</th>
                    <th>骨料4</th>
                    <th>骨料5</th>
                    <th>骨料6</th>
                    <th>1仓温度</th>
                    <th> 除尘器入口温度</th>
                </thead>

                <tbody>

                    <tr>
                        <td id="crew1_data_Aggregate1" >8:30:44</td>
                        <td  id="crew1_data_Aggregate2" >75
                            <i>%</i>
                        </td>
                        <td id="crew1_data_Aggregate3" >256
                            <i>℃</i>
                        </td>
                        <td id="crew1_data_Aggregate4" >16
                            <i>%</i>
                        </td>
                        <td id="crew1_data_Aggregate5" >16
                            <i>%</i>
                        </td >
                        <td  id="crew1_data_Aggregate6"  >16
                            <i>%</i>
                        </td>
                        <td id="crew1_data_warehouse1" >16
                            <i>℃</i>
                        </td>
                        <td id="crew1_data_duster" >16
                            <i>℃</i>
                        </td>
                    </tr>
                </tbody>

                <thead>
                    <th>石粉1</th>
                    <th>石粉2</th>
                    <th>沥青</th>
                    <th>再生料</th>
                    <th>添加剂</th>
                    <th>合计kg</th>
                    <th>沥青温度</th>
                    <th>混合料温度</th>
                </thead>

                <tbody>

                    <tr>
                        <td id="crew1_data_stone1"  >8<i>%</i></td>
                        <td id="crew1_data_stone2"  >75
                            <i>%</i>
                        </td>
                        <td id="crew1_data_asphalt" >256
                            <i>%</i>
                        </td>
                        <td id="crew1_data_regenerate" >16
                            <i>%</i>
                        </td>
                        <td  id="crew1_data_additive" >16
                            <i>%</i>
                        </td>
                        <td  id="crew1_data_total" >16
                            <i>kg</i>
                        </td>
                        <td id="crew1_data_temasphalt" >16
                            <i>℃</i>
                        </td>
                        <td id="crew1_data_aggregate" >16
                            <i>℃</i>
                        </td>
                    </tr>
                </tbody>

            </table>
        </div>
    </div>

    <div class="infolist_realtime">

    <div class="boxtitle">
        <span class="span_realtime">二号机组产品信息</span>
    </div>
    <div>
        <table class="realtime_table"  >

            <thead>
            <th>生产日期</th>
            <th>生产时间</th>
            <th>配比号</th>
            <th>产品名称</th>
            <th>车号</th>
            <th>盘号</th>
            <th>客户号</th>
            </thead>

            <tbody>

            <tr>
                <td id="crew2_basic_date" ></td>
                <td id="crew2_basic_time" ></td>
                <td id="crew2_basic_ratio" ></td>
                <td id="crew2_basic_ratioName" ></td>
                <td id="crew2_basic_carNum" ></td>
                <td id="crew2_basic_discNum" ></td>
                <td  id="crew2_basic_userNum" ></td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="boxtitle">
        <span class="span_realtime">二号机组产品状态数据</span>
    </div>
    <div>
        <table class="realtime_table">

            <thead>
            <th>骨料1</th>
            <th>骨料2</th>
            <th>骨料3</th>
            <th>骨料4</th>
            <th>骨料5</th>
            <th>骨料6</th>
            <th>1仓温度</th>
            <th> 除尘器入口温度</th>
            </thead>

            <tbody>

            <tr>
                <td id="crew2_data_Aggregate1" >8<i>%</i></td>
                <td  id="crew2_data_Aggregate2" >75
                    <i>%</i>
                </td>
                <td id="crew2_data_Aggregate3" >256
                    <i>℃</i>
                </td>
                <td id="crew2_data_Aggregate4" >16
                    <i>%</i>
                </td>
                <td id="crew2_data_Aggregate5" >16
                    <i>%</i>
                </td >
                <td  id="crew2_data_Aggregate6"  >16
                    <i>%</i>
                </td>
                <td id="crew2_data_warehouse1" >16
                    <i>℃</i>
                </td>
                <td id="crew2_data_duster" >16
                    <i>℃</i>
                </td>
            </tr>
            </tbody>

            <thead>
            <th>石粉1</th>
            <th>石粉2</th>
            <th>沥青</th>
            <th>再生料</th>
            <th>添加剂</th>
            <th>合计kg</th>
            <th>沥青温度</th>
            <th>混合料温度</th>
            </thead>

            <tbody>

            <tr>
                <td id="crew2_data_stone1"  >8<i>%</i></td>
                <td id="crew2_data_stone2"  >75
                    <i>%</i>
                </td>
                <td id="crew2_data_asphalt" >256
                    <i>%</i>
                </td>
                <td id="crew2_data_regenerate" >16
                    <i>%</i>
                </td>
                <td  id="crew2_data_additive" >16
                    <i>%</i>
                </td>
                <td  id="crew2_data_total" >16
                    <i>kg</i>
                </td>
                <td id="crew2_data_temasphalt" >16
                    <i>℃</i>
                </td>
                <td id="crew2_data_aggregate" >16
                    <i>℃</i>
                </td>
            </tr>
            </tbody>

        </table>
    </div>
</div>

    <div class="divbox_realtime_2">
    <div>
        <div class="boxtitle">

        </div>
        <div id="chart7" class="charts1"></div>
    </div>

    <script type="text/javascript">
        var myChart7= echarts.init(document.getElementById('chart7'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option7= {
            title: {
                text: '一号机组配比图',
                x: 'left',
                textStyle:{
                    color:'#685489',
                    fontSize: 16
                },
                padding: [5,0,0,70]
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['上限占比', '实际占比', '下限占比'],
                x:'right',
                // top:'7.5%',
                left:'50.5%',
                textStyle:{
                    color: '#53332b'
                }
            },
            grid:{
                left: '5%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                axisLabel: {
                    rotate: 70,
                    interval: 0
                },
                type: 'category',
                boundaryGap: false,
                data: ['骨料1', '骨料2', '骨料3', '骨料4', '骨料5', '骨料6', '石粉', '沥青', '再生料', '添加剂']
            }],
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
                    data: [11, 11, 15, 13, 12, 13, 10, 11, 11, 15, 13, 12, 13, 10],
                    formatter: '{value} %'
                }, {
                    name: '实际占比',
                    type: 'line',
                    data: [7, 8, 9, 10, 8, 13, 7, 9, 7, 9, 6, 8, 7, 5],
                    formatter: '{value} %',
                    markPoint: {
                        data: [
                            { type: 'max', name: '最大值' },
                        ]
                    }
                },
                {
                    name: '下限占比',
                    type: 'line',
                    data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],
                    formatter: '{value} %'
                }
            ]
        };


    </script>
</div>

    <div class="divbox_realtime_2">
    <div>
        <div class="boxtitle">

        </div>
        <div id="chart4" class="charts1"></div>
    </div>

    <script type="text/javascript">
        var myChart4 = echarts.init(document.getElementById('chart4'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option4 = {
            title: {
                text: '二号机组配比图',
                x: 'left',
                textStyle:{
                    color:'#685489',
                    fontSize: 16
                },
                padding: [5,0,0,70]
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['上限占比', '实际占比', '下限占比'],
                x:'right',
                // top:'7.5%',
                left:'50.5%',
                textStyle:{
                    color: '#53332b'
                }
            },
            grid:{
                left: '5%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                axisLabel: {
                    rotate: 70,
                    interval: 0
                },
                type: 'category',
                boundaryGap: false,
                data: ['骨料1', '骨料2', '骨料3', '骨料4', '骨料5', '骨料6', '石粉', '沥青', '再生料', '添加剂']
            }],
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
                    data: [11, 11, 15, 13, 12, 13, 10, 11, 11, 15, 13, 12, 13, 10],
                    formatter: '{value} %',
                }, {
                    name: '实际占比',
                    type: 'line',
                    data: [7, 8, 9, 10, 8, 13, 7, 9, 7, 9, 6, 8, 7, 5],
                    formatter: '{value} %',
                    markPoint: {
                        data: [
                            { type: 'max', name: '最大值' },
                        ]
                    }
                },
                {
                    name: '下限占比',
                    type: 'line',
                    data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],
                    formatter: '{value} %'
                }
            ]
        };



    </script>
</div>

    <div class="divbox_realtime">


        <div>
            <div class="boxtitle">
                <span class="span_realtime"></span>
            </div>
            <div id="chart1" class="charts1"></div>
        </div>

        <script type="text/javascript">
            var myChart1 = echarts.init(document.getElementById('chart1'));
            // 指定图表的配置项和数据
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var option1 =  {
                title: {
                    text: '一号机组产品温度走势图',
                    x: 'left',
                    textStyle:{
                        color:'#685489',
                        fontSize: 16
                    },
                    padding: [5,0,0,70]
                },
                tooltip: {
                    trigger: 'axis'
                },
                grid:{
                    left: '5%',
                    right: '20%',
                    bottom: '5%',
                    containLabel: true
                },
                legend: {
                    data:['一仓温度','混合料温度','沥青温度','骨料温度','除尘器温度'],
                    x:'right',
                    orient:'vertical',
                    itemGap:20,
                    top:'25%',
                    left:'85%',
                    textStyle:{
                        color: '#53332b',
                        fontWeight : 'bold'
                    }
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: ['周一','周二','周三','周四','周五','周六','周日']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} °C'
                    }
                },
                series: [
                    {
                        name:'一仓温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10]
                    },        {
                        name:'混合料温度',
                        type:'line',
                        data:[12, 13, 16, 17, 14, 11, 12],
                    },        {
                        name:'沥青温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10],
                    },
                    {
                        name:'骨料温度',
                        type:'line',
                        data:[1, -2, 2, 5, 3, 2, 0],

                    },
                    {
                        name:'除尘器温度',
                        type:'line',
                        data:[1, -2, 2, 5, 3, 2, 0],

                    }
                ]
            };

        </script>
    </div>

    <div class="divbox_realtime">

        <div>
            <div class="boxtitle">
                <span class="span_realtime"></span>
            </div>
            <div id="chart5" class="charts1"></div>
        </div>

        <script type="text/javascript">
            var myChart5 = echarts.init(document.getElementById('chart5'));
            // 指定图表的配置项和数据
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var option5= {
                title: {
                    text: '二号机组产品温度走势图',
                    x: 'left',
                    textStyle:{
                        color:'#685489',
                        fontSize: 16
                    },
                    padding: [5,0,0,70]
                },
                tooltip: {
                    trigger: 'axis'
                },
                grid:{
                    left: '5%',
                    right: '20%',
                    bottom: '5%',
                    containLabel: true
                },
                legend: {
                    data:['一仓温度','混合料温度','沥青温度','骨料温度','除尘器温度'],
                    x:'right',
                    orient:'vertical',
                    itemGap:20,
                    top:'25%',
                    left:'85%',
                    textStyle:{
                        color: '#53332b',
                        fontWeight : 'bold'
                    }
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: ['周一','周二','周三','周四','周五','周六','周日']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} °C'
                    }
                },
                series: [
                    {
                        name:'一仓温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10]
                    },        {
                        name:'混合料温度',
                        type:'line',
                        data:[12, 13, 16, 17, 14, 11, 12]
                    },        {
                        name:'沥青温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10]
                    },
                    {
                        name:'骨料温度',
                        type:'line',
                        data:[1, -2, 2, 5, 3, 2, 0],

                    },
                    {
                        name:'除尘器温度',
                        type:'line',
                        data:[1, -2, 2, 5, 3, 2, 0],

                    }
                ]
            };

        </script>
    </div>

    <div>

    </div>
    <%--js获取路径--%>
    <input id="path" type="hidden" value="${path}"/>
</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_monitoring_false.js"></script>

</html>