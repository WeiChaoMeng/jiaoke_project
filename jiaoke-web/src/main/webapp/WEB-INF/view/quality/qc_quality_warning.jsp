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

    <div>

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
                        <td id="crew1_produce_user">王建军</td>
                        <td id="crew1_produce_custom_num">1554568791</td>
                        <td>

                            <li>
                                <a href="#">
                                    <i class="toolico iconfont">&#xe6eb;</i>导出</a>
                            </li>

                        </td>

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

                    <tr class="warning_table_even">
                        <td  id="crew1_material_name" >沥青</td>
                        <td id="crew1_moudle_ratio" >20
                            <i>%</i>
                        </td>
                        <td id="crew1_actual_ratio"  >10
                            <i>%</i>
                        </td>
                        <td  id="crew1_deviation_ratio">10
                            <i>%</i>
                        </td>
                        <td id="crew1_warning_level" >一级</td>

                    </tr>


                    <tr class="warning_table_even">
                        <td>石料</td>
                        <td>15
                            <i>%</i>
                        </td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>5
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>


                    <tr class="warning_table_even">
                        <td>骨料</td>
                        <td>30
                            <i>%</i>
                        </td>
                        <td>21
                            <i>%</i>
                        </td>
                        <td>9
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>


                    <tr class="warning_table_even">
                        <td>石料1</td>
                        <td>40
                            <i>%</i>
                        </td>
                        <td>30
                            <i>%</i>
                        </td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>

                    <tr class="warning_table_even">
                        <td>骨料2</td>
                        <td>30
                            <i>%</i>
                        </td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>20
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>

                    <tr class="warning_table_even">
                        <td>骨料3</td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>7
                            <i>%</i>
                        </td>
                        <td>3
                            <i>%</i>
                        </td>
                        <td>一级</td>
                    </tr>

                    <tr class="warning_table_even">
                        <td>添加剂</td>
                        <td>20
                            <i>%</i>
                        </td>
                        <td>17
                            <i>%</i>
                        </td>
                        <td>3
                            <i>%</i>
                        </td>
                        <td>一级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>添加剂</td>
                        <td>20
                            <i>%</i>
                        </td>
                        <td>17
                            <i>%</i>
                        </td>
                        <td>3
                            <i>%</i>
                        </td>
                        <td>一级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>1仓温度</td>
                        <td>159
                            <i>℃</i>
                        </td>
                        <td>150
                            <i>℃</i>
                        </td>
                        <td>9
                            <i>℃</i>
                        </td>
                        <td>一级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>混合料温度</td>
                        <td>35
                            <i>℃</i>
                        </td>
                        <td>28
                            <i>℃</i>
                        </td>
                        <td>30
                            <i>℃</i>
                        </td>
                        <td>一级</td>
                    </tr>

                    <tr class="warning_table_even">
                        <td>除尘器入口温度</td>
                        <td>71
                            <i>℃</i>
                        </td>
                        <td>65
                            <i>℃</i>
                        </td>
                        <td>6
                            <i>℃</i>
                        </td>
                        <td>一级</td>
                    </tr>

                    <tr class="warning_table_even">
                        <td>沥青温度</td>
                        <td>158
                            <i>℃</i>
                        </td>
                        <td>120
                            <i>℃</i>
                        </td>
                        <td>38
                            <i>℃</i>
                        </td>
                        <td>二级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>骨料温度</td>
                        <td>184
                            <i>℃</i>
                        </td>
                        <td>165
                            <i>℃</i>
                        </td>
                        <td>19
                            <i>℃</i>
                        </td>
                        <td>二级</td>
                    </tr>
                </tbody>

            </table>
        </div>
        <div class="div_echar">

            <li style="margin-top: 60px;">

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
                                name: '下线占比',
                                type: 'line',
                                data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],
                                markPoint: {
                                    data: [
                                        { type: 'max', name: '最大值' },
                                        { type: 'min', name: '最小值' }
                                    ]
                                }
                            }
                        ]
                    };


                    setInterval(function () { //把option.series[0].data[0].value的值使用random()方法获取一个随机数
                        option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
                        myChart.setOption(option, true);
                    }, 2000);
                    myChart.setOption(option);
                    window.addwarning_table_EventListener("resize", function () {
                        myChart.resize();
                    });
                </script>
            </li>
        </div>


    </div>

    <div>

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
                    <td id="crew2_produce_user">王建军</td>
                    <td id="crew2_produce_custom_num">1554568791</td>
                    <td>

                        <li>
                            <a href="#">
                                <i class="toolico iconfont">&#xe6eb;</i>导出</a>
                        </li>

                    </td>

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

                <tr class="warning_table_even">
                    <td  id="crew2_material_name" >沥青</td>
                    <td id="crew2_moudle_ratio" >20
                        <i>%</i>
                    </td>
                    <td id="crew2_actual_ratio"  >10
                        <i>%</i>
                    </td>
                    <td  id="crew2_deviation_ratio">10
                        <i>%</i>
                    </td>
                    <td id="crew2_warning_level" >一级</td>

                </tr>

                    <tr class="warning_table_even">
                        <td>石料</td>
                        <td>15
                            <i>%</i>
                        </td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>5
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>


                    <tr class="warning_table_even">
                        <td>骨料</td>
                        <td>30
                            <i>%</i>
                        </td>
                        <td>21
                            <i>%</i>
                        </td>
                        <td>9
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>


                    <tr class="warning_table_even">
                        <td>石料1</td>
                        <td>40
                            <i>%</i>
                        </td>
                        <td>30
                            <i>%</i>
                        </td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>

                    <tr class="warning_table_even">
                        <td>骨料2</td>
                        <td>30
                            <i>%</i>
                        </td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>20
                            <i>%</i>
                        </td>
                        <td>一级</td>

                    </tr>

                    <tr class="warning_table_even">
                        <td>骨料3</td>
                        <td>10
                            <i>%</i>
                        </td>
                        <td>7
                            <i>%</i>
                        </td>
                        <td>3
                            <i>%</i>
                        </td>
                        <td>一级</td>
                    </tr>

                    <tr class="warning_table_even">
                        <td>添加剂</td>
                        <td>20
                            <i>%</i>
                        </td>
                        <td>17
                            <i>%</i>
                        </td>
                        <td>3
                            <i>%</i>
                        </td>
                        <td>一级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>添加剂</td>
                        <td>20
                            <i>%</i>
                        </td>
                        <td>17
                            <i>%</i>
                        </td>
                        <td>3
                            <i>%</i>
                        </td>
                        <td>一级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>1仓温度</td>
                        <td>159
                            <i>℃</i>
                        </td>
                        <td>150
                            <i>℃</i>
                        </td>
                        <td>9
                            <i>℃</i>
                        </td>
                        <td>一级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>混合料温度</td>
                        <td>35
                            <i>℃</i>
                        </td>
                        <td>28
                            <i>℃</i>
                        </td>
                        <td>30
                            <i>℃</i>
                        </td>
                        <td>一级</td>
                    </tr>

                    <tr class="warning_table_even">
                        <td>除尘器入口温度</td>
                        <td>71
                            <i>℃</i>
                        </td>
                        <td>65
                            <i>℃</i>
                        </td>
                        <td>6
                            <i>℃</i>
                        </td>
                        <td>一级</td>
                    </tr>

                    <tr class="warning_table_even">
                        <td>沥青温度</td>
                        <td>158
                            <i>℃</i>
                        </td>
                        <td>120
                            <i>℃</i>
                        </td>
                        <td>38
                            <i>℃</i>
                        </td>
                        <td>二级</td>
                    </tr>


                    <tr class="warning_table_even">
                        <td>骨料温度</td>
                        <td>184
                            <i>℃</i>
                        </td>
                        <td>165
                            <i>℃</i>
                        </td>
                        <td>19
                            <i>℃</i>
                        </td>
                        <td>二级</td>
                    </tr>
                </tbody>

            </table>
        </div>
        <div class="div_echar">

            <li style="margin-top: 60px;">

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
                                name: '下线占比',
                                type: 'line',
                                data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],
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
                    window.addwarning_table_EventListener("resize", function () {
                        myChart2.resize();
                    });
                </script>
            </li>
        </div>


    </div>


</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_warning.js"></script>

</html>