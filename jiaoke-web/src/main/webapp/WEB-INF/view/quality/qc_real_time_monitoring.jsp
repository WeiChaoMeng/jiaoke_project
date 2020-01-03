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
    <title>实时监控</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <script src="/static/js/echarts/echarts.js"></script>
</head>

<body style="padding:15px 8px 1000px 8px;background: #ffffff;">

<%
    request.setAttribute("path",request.getContextPath());
%>

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
                    <th>配比名称</th>
                    <th>车号</th>
                    <th>盘号</th>
                    <th>工程名称</th>
                </thead>

                <tbody>

                    <tr>
                        <td id="crew1_basic_date" ></td>
                        <td id="crew1_basic_time" ></td>
                        <td id="crew1_basic_ratio" ></td>
                        <td id="crew1_basic_ratio_name" ></td>
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
                        <td id="crew1_data_Aggregate1" ><i>%</i></td>
                        <td  id="crew1_data_Aggregate2" >
                            <i>%</i>
                        </td>
                        <td id="crew1_data_Aggregate3" >
                            <i>℃</i>
                        </td>
                        <td id="crew1_data_Aggregate4" >
                            <i>%</i>
                        </td>
                        <td id="crew1_data_Aggregate5" >
                            <i>%</i>
                        </td >
                        <td  id="crew1_data_Aggregate6"  >
                            <i>%</i>
                        </td>
                        <td id="crew1_data_warehouse1" >
                            <i>℃</i>
                        </td>
                        <td id="crew1_data_duster" >
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
                        <td id="crew1_data_stone1"  ><i>%</i></td>
                        <td id="crew1_data_stone2"  >
                            <i>%</i>
                        </td>
                        <td id="crew1_data_asphalt" >
                            <i>%</i>
                        </td>
                        <td id="crew1_data_regenerate" >
                            <i>%</i>
                        </td>
                        <td  id="crew1_data_additive" >
                            <i>%</i>
                        </td>
                        <td  id="crew1_data_total" >
                            <i>kg</i>
                        </td>
                        <td id="crew1_data_temasphalt" >
                            <i>℃</i>
                        </td>
                        <td id="crew1_data_aggregate" >
                            <i>℃</i>
                        </td>
                    </tr>
                </tbody>

            </table>
        </div>

        <div class="boxtitle">
            <span class="span_realtime">一号机组三组产品平均数据</span>
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
                    <td id="crew1_data_Aggregate1_svg" ><i>kg</i></td>
                    <td  id="crew1_data_Aggregate2_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew1_data_Aggregate3_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew1_data_Aggregate4_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew1_data_Aggregate5_svg" >
                        <i>kg</i>
                    </td >
                    <td  id="crew1_data_Aggregate6_svg"  >
                        <i>kg</i>
                    </td>
                    <td id="crew1_data_warehouse1_svg" >
                        <i>℃</i>
                    </td>
                    <td id="crew1_data_duster_svg" >
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
                    <td id="crew1_data_stone1_svg"  ><i>kg</i></td>
                    <td id="crew1_data_stone2_svg"  >
                        <i>kg</i>
                    </td>
                    <td id="crew1_data_asphalt_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew1_data_regenerate_svg" >
                        <i>kg</i>
                    </td>
                    <td  id="crew1_data_additive_svg" >
                        <i>kg</i>
                    </td>
                    <td  id="crew1_data_total_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew1_data_temasphalt_svg" >
                        <i>℃</i>
                    </td>
                    <td id="crew1_data_aggregate_svg" >
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
            <th>配比名称</th>
            <th>车号</th>
            <th>盘号</th>
            <th>工程名称</th>
            </thead>

            <tbody>

            <tr>
                <td id="crew2_basic_date" ></td>
                <td id="crew2_basic_time" ></td>
                <td id="crew2_basic_ratio" ></td>
                <td id="crew2_basic_ratio_name" ></td>
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
                <td id="crew2_data_Aggregate1" ><i>%</i></td>
                <td  id="crew2_data_Aggregate2" >
                    <i>%</i>
                </td>
                <td id="crew2_data_Aggregate3" >
                    <i>℃</i>
                </td>
                <td id="crew2_data_Aggregate4" >
                    <i>%</i>
                </td>
                <td id="crew2_data_Aggregate5" >
                    <i>%</i>
                </td >
                <td  id="crew2_data_Aggregate6"  >
                    <i>%</i>
                </td>
                <td id="crew2_data_warehouse1" >
                    <i>℃</i>
                </td>
                <td id="crew2_data_duster" >
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
                <td id="crew2_data_stone1"  ><i>%</i></td>
                <td id="crew2_data_stone2"  >
                    <i>%</i>
                </td>
                <td id="crew2_data_asphalt" >
                    <i>%</i>
                </td>
                <td id="crew2_data_regenerate" >
                    <i>%</i>
                </td>
                <td  id="crew2_data_additive" >
                    <i>%</i>
                </td>
                <td  id="crew2_data_total" >
                    <i>kg</i>
                </td>
                <td id="crew2_data_temasphalt" >
                    <i>℃</i>
                </td>
                <td id="crew2_data_aggregate" >
                    <i>℃</i>
                </td>
            </tr>
            </tbody>

        </table>
    </div>

        <div class="boxtitle">
            <span class="span_realtime">二号机组三盘产品平均数据</span>
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
                    <td id="crew2_data_Aggregate1_svg" ><i>kg</i></td>
                    <td  id="crew2_data_Aggregate2_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew2_data_Aggregate3_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew2_data_Aggregate4_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew2_data_Aggregate5_svg" >
                        <i>kg</i>
                    </td >
                    <td  id="crew2_data_Aggregate6_svg"  >
                        <i>kg</i>
                    </td>
                    <td id="crew2_data_warehouse1_svg" >
                        <i>℃</i>
                    </td>
                    <td id="crew2_data_duster_svg" >
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
                    <td id="crew2_data_stone1_svg"  ><i>kg</i></td>
                    <td id="crew2_data_stone2_svg"  >
                        <i>kg</i>
                    </td>
                    <td id="crew2_data_asphalt_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew2_data_regenerate_svg" >
                        <i>kg</i>
                    </td>
                    <td  id="crew2_data_additive_svg" >
                        <i>kg</i>
                    </td>
                    <td  id="crew2_data_total_svg" >
                        <i>kg</i>
                    </td>
                    <td id="crew2_data_temasphalt_svg" >
                        <i>℃</i>
                    </td>
                    <td id="crew2_data_aggregate_svg" >
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
                text: '一号机组级配曲线图'
            },
            legend: {
                data:['合成级配','实际级配','上限','中值','下限']
            },
            grid: {

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
            tooltip: {
                trigger: 'item'
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
                    show: false//不显示
                    // rotate:90
                },
                axisTick: { //轴刻度
                    show: false //不显示
                },
                axisLine: { //轴线
                    lineStyle: { //样式
                        color: '#000' //颜色
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
                            rotate:90,
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
        var option4 ={
            title: {
                text: '二号机组级配曲线图'
            },
            legend: {
                data:['合成级配','实际级配','上限','中值','下限']
            },
            grid: {

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
            tooltip: {
                trigger: 'item'
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
                    text: '一号机组产品温度走势图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['最高气温','最低气温']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: {readOnly: false},
                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
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
                    },
                    min:60
                },
                series: [
                    {
                        name:'一仓温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10],
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },        {
                        name:'混合料温度',
                        type:'line',
                        data:[12, 13, 16, 17, 14, 11, 12],
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },        {
                        name:'沥青温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10],
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
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
                    text: '二号机组产品温度走势图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['最高气温','最低气温']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: {readOnly: false},
                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
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
                    },
                    min:50
                },
                series: [
                    {
                        name:'一仓温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10],
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },        {
                        name:'混合料温度',
                        type:'line',
                        data:[12, 13, 16, 17, 14, 11, 12],
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },        {
                        name:'沥青温度',
                        type:'line',
                        data:[11, 11, 15, 13, 12, 13, 10],
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
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
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_monitoring.js"></script>


</html>