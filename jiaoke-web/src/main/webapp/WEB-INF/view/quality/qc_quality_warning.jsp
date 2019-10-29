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
    <script src="/static/js/echarts/echarts.js"></script>
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
                    <th>配比名称</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>生产人</th>
                    <th>客户号</th>
                </thead>

                <tbody>

                    <tr class="warning_table_even">
                        <td id="crew1_produce_date"></td>
                        <td id="crew1_produce_time"></td>
                        <td id="crew1_produce_ratio_id"></td>
                        <td id="crew1_pro_name"></td>
                        <td id="crew1_produce_car_num"></td>
                        <td id="crew1_produce_disc_num"></td>
                        <td id="crew1_produce_user"></td>
                        <td id="crew1_produce_custom_num"></td>

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
                    <th>三盘平均配比</th>
                </thead>

                <tbody id="crew1_material" >


                </tbody>

            </table>
        </div>
        <div class="div_echar">

            <li >

                <div>

                    <div class="boxtitle">
                        <span>一号机组三盘产品平均级配曲线图</span>
                    </div>
                    <div id="chart7" class="charts_2"></div>

                </div>

                <script type="text/javascript">
                    var myChart7= echarts.init(document.getElementById('chart7'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option7= {
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限']
                        },
                        grid: {

                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        toolbox: {
                            feature: {
                                dataZoom: {
                                    yAxisIndex: 'none'
                                },
                                restore: {},
                                saveAsImage: {}
                            }
                        },
                        xAxis: {
                            type: 'value',
                            name: '筛孔',
                            nameGap: 16,
                            nameTextStyle: {
                                color: '#000',
                                fontSize: 14
                            },
                            min:0,
                            max:7,
                            splitLine: {
                                show: false
                            },
                            axisLabel: { //轴标签
                                show: false //不显示
                            },
                            axisTick: { //轴刻度
                                show: false //不显示
                            },
                            axisLine: { //轴线
                                lineStyle: { //样式
                                    color: '#000' //颜色
                                }
                            }
                        },
                        yAxis: {
                            type: 'value',
                            name: '占比 %',
                            nameLocation: 'end',
                            nameGap: 20,
                            position: 'left',
                            offset: 3,
                            max:100,
                            min:0,
                            scale: true,
                            nameTextStyle: {
                                color: '#fff',
                                fontSize: 16
                            },
                            axisLine: {
                                onZero: false,
                                lineStyle: {
                                    color: '#000'
                                }
                            },
                            splitLine: {
                                show: true,
                                lineStyle: {
                                    color: '#000'
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
                                        normal: {
                                            position: "start"
                                        }
                                    },
                                    lineStyle:{
                                        color: '#000'
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
                    <th>配比名称</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>生产人</th>
                    <th>客户号</th>
                </thead>

                <tbody  id="crew2_message" >

                <tr class="warning_table_even">
                    <td id="crew2_produce_date"></td>
                    <td id="crew2_produce_time"></td>
                    <td id="crew2_produce_ratio_id"></td>
                    <td id="crew2_pro_name"></td>
                    <td id="crew2_produce_car_num"></td>
                    <td id="crew2_produce_disc_num"></td>
                    <td id="crew2_produce_user"></td>
                    <td id="crew2_produce_custom_num"></td>
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
                    <th>三盘平均配比</th>
                </thead>

                <tbody id="crew2_material" >

                </tbody>

            </table>
        </div>
        <div class="div_echar">

            <li>

                <div>

                    <div class="boxtitle">
                        <span>二号机组三盘产品平均级配曲线图</span>
                    </div>
                    <div id="chart4" class="charts_2"></div>

                </div>

                <script type="text/javascript">
                    var myChart4 = echarts.init(document.getElementById('chart4'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option4 ={
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限']
                        },
                        grid: {

                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        toolbox: {
                            feature: {
                                dataZoom: {
                                    yAxisIndex: 'none'
                                },
                                restore: {},
                                saveAsImage: {}
                            }
                        },
                        xAxis: {
                            type: 'value',
                            name: '筛孔',
                            nameGap: 16,
                            nameTextStyle: {
                                color: '#000',
                                fontSize: 14
                            },
                            min:0,
                            max:7,
                            splitLine: {
                                show: false
                            },
                            axisLabel: { //轴标签
                                show: false //不显示
                            },
                            axisTick: { //轴刻度
                                show: false //不显示
                            },
                            axisLine: { //轴线
                                lineStyle: { //样式
                                    color: '#000' //颜色
                                }
                            }
                        },
                        yAxis: {
                            type: 'value',
                            name: '占比 %',
                            nameLocation: 'end',
                            nameGap: 20,
                            position: 'left',
                            offset: 3,
                            max:100,
                            min:0,
                            scale: true,
                            nameTextStyle: {
                                color: '#fff',
                                fontSize: 16
                            },
                            axisLine: {
                                onZero: false,
                                lineStyle: {
                                    color: '#000'
                                }
                            },
                            splitLine: {
                                show: true,
                                lineStyle: {
                                    color: '#000'
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
                                        normal: {
                                            position: "start"
                                        }
                                    },
                                    lineStyle:{
                                        color: '#000'
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
            </li>
        </div>


    </div>

    <%--js获取路径--%>
    <input id="path" type="hidden" value="${path}"/>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_warning.js"></script>

</html>