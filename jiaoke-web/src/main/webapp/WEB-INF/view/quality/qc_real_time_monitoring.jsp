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
    <title>实时监控</title>
    <link href="../../css/default.css" rel="stylesheet" type="text/css">
    <link href="../../css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="../../js/echarts/echarts.js"></script>
    <script src="../../js/echarts/uimaker.js"></script>
</head>

<body style="padding:15px 8px 1000px 8px;background: #e8e8e8;">

    <div class="infolist_realtime">

        <div class="boxtitle">
            <span class="span_realtime">一号机组产品信息</span>
        </div>
        <div>
            <table class="realtime_table">

                <thead>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>配比号</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>生产人</th>
                    <th>客户号</th>
                </thead>

                <tbody>

                    <tr>
                        <td>20171101</td>
                        <td>8:35</td>
                        <td>256</td>
                        <td>京C66666</td>
                        <td>A16</td>
                        <td>王建军</td>
                        <td>1554568791</td>
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
                        <td>8:30:44</td>
                        <td>75
                            <i>℃</i>
                        </td>
                        <td>256
                            <i>℃</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
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
                        <td>8:30:44</td>
                        <td>75
                            <i>℃</i>
                        </td>
                        <td>256
                            <i>℃</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                    </tr>
                </tbody>

            </table>
        </div>
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
            var option1 = {
                title: {
                    text: '产品温度走势图',
                    left: 'left'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c}'
                },
                legend: {
                    left: 'right',
                    data: ['上限温度', '实际温度', '下限温度']
                },
                xAxis: {
                    type: 'category',
                    name: 'x',
                    splitLine: {
                        show: false
                    },
                    data: ['一', '二', '三', '四', '五', '六', '七', '八', '九']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                yAxis: {
                    type: 'log',
                    name: 'y'
                },
                series: [{
                    name: '上限温度',
                    type: 'line',
                    data: [1, 3, 9, 27, 81, 247, 741, 2223, 6669]
                }, {
                    name: '实际温度',
                    type: 'line',
                    data: [1, 2, 4, 8, 16, 32, 64, 128, 256]
                }, {
                    name: '下限温度',
                    type: 'line',
                    data: [1 / 2, 1 / 4, 1 / 8, 1 / 16, 1 / 32, 1 / 64, 1 / 128, 1 / 256, 1 / 512]
                }]
            };


            setInterval(function () { //把option.series[0].data[0].value的值使用random()方法获取一个随机数
                option1.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
                myChart1.setOption(option1, true);
            }, 2000);
            myChart1.setOption(option1);
            window.addEventListener("resize", function () {
                myChart1.resize();
            });
        </script>
    </div>

    <div class="infolist_realtime">

        <div class="boxtitle">
            <span class="span_realtime">二号机组产品信息</span>
        </div>
        <div>
            <table class="realtime_table">

                <thead>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>配比号</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>生产人</th>
                    <th>客户号</th>
                </thead>

                <tbody>

                    <tr>
                        <td>20171101</td>
                        <td>8:35</td>
                        <td>256</td>
                        <td>京C66666</td>
                        <td>A16</td>
                        <td>王建军</td>
                        <td>1554568791</td>
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
                        <td>8:30:44</td>
                        <td>75
                            <i>℃</i>
                        </td>
                        <td>256
                            <i>℃</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
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
                        <td>8:30:44</td>
                        <td>75
                            <i>℃</i>
                        </td>
                        <td>256
                            <i>℃</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                        <td>16
                            <i>%</i>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
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
            var option5 = {
                title: {
                    text: '产品温度走势图',
                    left: 'left'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c}'
                },
                legend: {
                    left: 'right',
                    data: ['上限温度', '实际温度', '下限温度']
                },
                xAxis: {
                    type: 'category',
                    name: 'x',
                    splitLine: {
                        show: false
                    },
                    data: ['一', '二', '三', '四', '五', '六', '七', '八', '九']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                yAxis: {
                    type: 'log',
                    name: 'y'
                },
                series: [{
                    name: '上限温度',
                    type: 'line',
                    data: [1, 3, 9, 27, 81, 247, 741, 2223, 6669]
                }, {
                    name: '实际温度',
                    type: 'line',
                    data: [1, 2, 4, 8, 16, 32, 64, 128, 256]
                }, {
                    name: '下限温度',
                    type: 'line',
                    data: [1 / 2, 1 / 4, 1 / 8, 1 / 16, 1 / 32, 1 / 64, 1 / 128, 1 / 256, 1 / 512]
                }]
            };
            setInterval(function () { //把option.series[0].data[0].value的值使用random()方法获取一个随机数
                option5.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
                myChart.setOption(option5, true);
            }, 2000);
            myChart5.setOption(option5);
            window.addEventListener("resize", function () {
                myChart5.resize();
            });
        </script>
    </div>


    <div class="divbox_realtime_2">
        <div>
            <div class="boxtitle">

            </div>
            <div id="chart2" class="charts1"></div>
        </div>

        <script type="text/javascript">
            var myChart2 = echarts.init(document.getElementById('chart2'));
            // 指定图表的配置项和数据
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var option2 = {
                title: {
                    text: '一号机组配比图',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['上限占比', '实际占比', '下限占比'],
                    x: 'left'
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
                xAxis: [{
                    axisLabel: {
                        rotate: 70,
                        interval: 0
                    },
                    type: 'category',
                    boundaryGap: false,
                    data: ['石料', '石料1', '石料2', '粉料', '沥青', '骨料', '骨料一', '石料', '石料1', '石料2', '粉料', '沥青', '骨料', '骨料一']
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
                        markPoint: {

                            data: [
                                { type: 'max', name: '最大值' },
                                { type: 'min', name: '最小值' }
                            ]
                        }
                    }, {
                        name: '实际占比',
                        type: 'line',
                        data: [7, 8, 9, 10, 8, 13, 7, 9, 7, 9, 6, 8, 7, 5],
                        formatter: '{value} %',
                        markPoint: {

                            data: [
                                { type: 'max', name: '最大值' },
                                { type: 'min', name: '最小值' }
                            ]
                        }
                    },
                    {
                        name: '下限占比',
                        type: 'line',
                        data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],
                        formatter: '{value} %',
                        markPoint: {
                            data: [
                                { type: 'max', name: '最大值' },
                                { type: 'min', name: '最小值' }
                            ]
                        }
                    }
                ]
            };



            myChart2.setOption(option2);
            window.addEventListener("resize", function () {
                myChart2.resize();
            });
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
                    text: '一号机组配比图',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['上限占比', '实际占比', '下限占比'],
                    x: 'left'
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
                xAxis: [{
                    axisLabel: {
                        rotate: 70,
                        interval: 0
                    },
                    type: 'category',
                    boundaryGap: false,
                    data: ['石料', '石料1', '石料2', '粉料', '沥青', '骨料', '骨料一', '石料', '石料1', '石料2', '粉料', '沥青', '骨料', '骨料一']
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
                        markPoint: {

                            data: [
                                { type: 'max', name: '最大值' },
                                { type: 'min', name: '最小值' }
                            ]
                        }
                    }, {
                        name: '实际占比',
                        type: 'line',
                        data: [7, 8, 9, 10, 8, 13, 7, 9, 7, 9, 6, 8, 7, 5],
                        formatter: '{value} %',
                        markPoint: {

                            data: [
                                { type: 'max', name: '最大值' },
                                { type: 'min', name: '最小值' }
                            ]
                        }
                    },
                    {
                        name: '下限占比',
                        type: 'line',
                        data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],
                        formatter: '{value} %',
                        markPoint: {
                            data: [
                                { type: 'max', name: '最大值' },
                                { type: 'min', name: '最小值' }
                            ]
                        }
                    }
                ]
            };


            myChart4.setOption(option4);
            window.addEventListener("resize", function () {
                myChart4.resize();
            });
        </script>
    </div>

</body>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/skin.js"></script>

</html>