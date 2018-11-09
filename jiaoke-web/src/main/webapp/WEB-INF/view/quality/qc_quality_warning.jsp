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
    <title>数据预警</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body style="padding:15px 8px 500px 8px;">

    <div class="my_echars_div_block" >

        <div>
            <div class="boxtitle">
                <span>一号机组实时数据预警</span>
            </div>
        </div>
        <div>
            <table class="warning_table">

                <thead>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>配比号</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>生产人</th>
                    <th>客户号</th>
                    <th>操作</th>
                </thead>

                <tbody>

                    <tr class="warning_table_even">
                        <td id="crew1_produce_date">20171101</td>
                        <td id="crew1_produce_time">8:35</td>
                        <td id="crew1_produce_ratio_id">256</td>
                        <td id="crew1_produce_car_num">京C66666</td>
                        <td id="crew1_produce_disc_num">A16</td>
                        <td id="crew1_produce_user"></td>
                        <td id="crew1_produce_custom_num">1554568791</td>

                    </tr>
                </tbody>
            </table>
        </div>
        <div class="div_container">
            <table class="warning_table">

                <thead>
                    <th>材料</th>
                    <th>模板配比</th>
                    <th>实际配比</th>
                    <th>偏差比</th>
                    <th>预警级别</th>
                </thead>

                <tbody id="crew1_material" >


                </tbody>

            </table>
        </div>
        <div class="div_echar">

            <li >

                <div>

                    <div class="boxtitle">
                        <span>当前产品材料构成曲线图</span>
                    </div>
                    <div id="chart" class="charts1"></div>

                </div>

                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById('chart'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option = {
                        title: {
                            text: '',
                            subtext: ''
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['模板占比', '实际占比'],
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
                            data: ['矿粉','沥青', '再生料', '添加剂', '骨料1', '骨料2', '骨料3', '骨料4', '骨料5', '骨料6', '骨料一']
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
                                        { type: 'min', name: '最小值' }
                                    ]
                                }
                            },
                            {
                                name: '下线占比',
                                type: 'line',
                                data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],

                            }
                        ]
                    };


                </script>
            </li>
        </div>


    </div>

    <div class="my_echars_div_block" >

        <div>
            <div class="boxtitle">
                <span>二号机组实时数据预警</span>
            </div>
        </div>
        <div>
            <table class="warning_table">

                <thead>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>配比号</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>生产人</th>
                    <th>客户号</th>
                    <th>操作</th>
                </thead>

                <tbody  id="crew2_message" >

                <tr class="warning_table_even">
                    <td id="crew2_produce_date">20171101</td>
                    <td id="crew2_produce_time">8:35</td>
                    <td id="crew2_produce_ratio_id">256</td>
                    <td id="crew2_produce_car_num">京C66666</td>
                    <td id="crew2_produce_disc_num">A16</td>
                    <td id="crew2_produce_user"></td>
                    <td id="crew2_produce_custom_num">1554568791</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="div_container">
            <table class="warning_table">

                <thead>
                    <th>材料</th>
                    <th>模板配比</th>
                    <th>实际配比</th>
                    <th>偏差比</th>
                    <th>预警级别</th>
                </thead>

                <tbody id="crew2_material" >

                </tbody>

            </table>
        </div>
        <div class="div_echar">

            <li>

                <div>

                    <div class="boxtitle">
                        <span>当前产品材料构成曲线图</span>
                    </div>
                    <div id="chart2" class="charts1"></div>

                </div>

                <script type="text/javascript">
                    var myChart2 = echarts.init(document.getElementById('chart2'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option2 = {
                        title: {
                            text: '',
                            subtext: ''
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['模板占比', '实际占比'],
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
                                name: '下线占比',
                                type: 'line',
                                data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],

                            }
                        ]
                    };



                </script>
            </li>
        </div>


    </div>

    <%--js获取路径--%>
    <input id="path" type="hidden" value="http://47.105.114.70"/>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_warning.js"></script>

</html>