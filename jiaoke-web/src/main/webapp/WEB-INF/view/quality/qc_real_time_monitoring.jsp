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
    <link href="/static/css/qc/app-light.css" rel="stylesheet" type="text/css">
    <script src="/static/js/echarts/echarts.js"></script>
</head>

<body>

<%
    request.setAttribute("path",request.getContextPath());
%>

<div class="row" style="margin-top: 20px;">
    <div class="col-md-6 col-xl-3 mb-4">
        <div class="card shadow border-0">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-3 text-center">
                        <span class="circle circle-sm bg-primary">
                          <i class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
                        </span>
                    </div>
                    <div class="col pr-0">
                        <p class="small text-muted mb-0">Orders</p>
                        <span class="h3 mb-0">1,869</span>
                        <span class="small text-success">+16.5%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3 mb-4">
        <div class="card shadow border-0">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-3 text-center">
                        <span class="circle circle-sm bg-primary">
                          <i class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
                        </span>
                    </div>
                    <div class="col pr-0">
                        <p class="small text-muted mb-0">Orders</p>
                        <span class="h3 mb-0">1,869</span>
                        <span class="small text-success">+16.5%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3 mb-4">
        <div class="card shadow border-0">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-3 text-center">
                        <span class="circle circle-sm bg-primary">
                          <i class="fe fe-16 fe-filter text-white mb-0"></i>
                        </span>
                    </div>
                    <div class="col">
                        <p class="small text-muted mb-0">Conversion</p>
                        <div class="row align-items-center no-gutters">
                            <div class="col-auto">
                                <span class="h3 mr-2 mb-0"> 86.6% </span>
                            </div>
                            <div class="col-md-12 col-lg">
                                <div class="progress progress-sm mt-2" style="height:3px">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 87%"
                                         aria-valuenow="87" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3 mb-4">
        <div class="card shadow border-0">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-3 text-center">
                        <span class="circle circle-sm bg-primary">
                          <i class="fe fe-16 fe-activity text-white mb-0"></i>
                        </span>
                    </div>
                    <div class="col">
                        <p class="small text-muted mb-0">AVG Orders</p>
                        <span class="h3 mb-0">$80</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
                </thead>

                <tbody>

                    <tr>
                        <td id="crew1_basic_date" ></td>
                        <td id="crew1_basic_time" ></td>
                        <td id="crew1_basic_ratio" ></td>
                        <td id="crew1_basic_ratio_name" ></td>
                        <td id="crew1_basic_carNum" ></td>
                        <td id="crew1_basic_discNum" ></td>
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
            </thead>

            <tbody>

            <tr>
                <td id="crew2_basic_date" ></td>
                <td id="crew2_basic_time" ></td>
                <td id="crew2_basic_ratio" ></td>
                <td id="crew2_basic_ratio_name" ></td>
                <td id="crew2_basic_carNum" ></td>
                <td id="crew2_basic_discNum" ></td>

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
            <th>骨料温度</th>
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
                <th>骨料温度</th>
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
<div class="row my-4">
    <div class="col-md-6 mb-4">
        <div class="card shadow">
            <div class="card-header">
                <strong class="card-title mb-0">Bar Chart</strong>
            </div>
            <div class="card-body">
                <div id="chart7" style="width: 400px;height: 300px;" ></div>

                <script type="text/javascript">
                    var myChart7= echarts.init(document.getElementById('chart7'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option7= {
                        title: {
                            text: '一号机组级配曲线图',
                            x: 'left',
                            textStyle:{
                                color:'#685489',
                                fontSize: 16
                            },
                            padding: [5,0,0,40]
                        },
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限'],
                            x:'left',
                            left:'35%'
                        },
                        grid:{
                            left: '3.7%',
                            right: '3.7%',
                            bottom: '3%',
                            containLabel: true
                        },
                        tooltip: {
                            trigger: 'axis',
                            formatter: function(params, ticket, callback) {
                                return  '筛孔:' + returnX(params[0].value[0])  + '的通过率<br/>'
                                    +params[0].marker  + params[0].seriesName + ' :  ' + (params[0].value[1]).toFixed(1)+'%<br/>'
                                    +params[1].marker  + params[1].seriesName+':  '+(params[1].value[1]).toFixed(1)+'%<br/>'
                                    +params[2].marker  + params[2].seriesName+':  '+(params[2].value[1]).toFixed(1)+'%<br/>'
                                    +params[3].marker  + params[3].seriesName+':  '+(params[3].value[1]).toFixed(1)+'%<br/>'
                                    +params[4].marker  + params[4].seriesName+':  '+(params[4].value[1]).toFixed(1)+'%<br/>';
                            }
                        },
                        xAxis: {
                            type: 'value',
                            // name: '筛孔',
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
                            // name: '占比 %',
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
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            width:0.6,
                                            color: '#000000'
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
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        width:0.6,
                                        color: '#96ceb4'
                                    }
                                },
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'b',
                                type: 'line',
                                name:'实际级配',
                                symbolSize:6,
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#23c6c8'
                                    }
                                },
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'c',
                                type: 'line',
                                name:'上限',
                                symbolSize:6,
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#ed5565'
                                    }
                                },
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
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#ed5565'
                                    }
                                },
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            }
                        ]
                    };
                </script>

            </div>
        </div>
    </div>
    <div class="col-md-6 mb-4">
        <div class="card shadow">
            <div class="card-header">
                <strong class="card-title mb-0">Line Chart</strong>
            </div>
            <div class="card-body">
                <div id="chart4" style="width: 400px;height: 300px;"></div>
                <script type="text/javascript">
                    var myChart4 = echarts.init(document.getElementById('chart4'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option4 ={
                        title: {
                            text: '二号机组级配曲线图',
                            x: 'left',
                            textStyle:{
                                color:'#685489',
                                fontSize: 16
                            },
                            padding: [5,0,0,40]
                        },
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限'],
                            x:'left',
                            left:'35%'
                        },
                        grid:{
                            left: '3.7%',
                            right: '3.7%',
                            bottom: '3%',
                            containLabel: true
                        },
                        tooltip: {
                            trigger: 'axis',
                            formatter: function(params, ticket, callback) {
                                return  '筛孔:' + returnX(params[0].value[0])+ '的通过率<br/>'
                                    +params[0].marker  + params[0].seriesName + ' :  ' + (params[0].value[1]).toFixed(1)+'%<br/>'
                                    +params[1].marker  + params[1].seriesName+':  '+(params[1].value[1]).toFixed(1)+'%<br/>'
                                    +params[2].marker  + params[2].seriesName+':  '+(params[2].value[1]).toFixed(1)+'%<br/>'
                                    +params[3].marker  + params[3].seriesName+':  '+(params[3].value[1]).toFixed(1)+'%<br/>'
                                    +params[4].marker  + params[4].seriesName+':  '+(params[4].value[1]).toFixed(1)+'%<br/>';
                            }
                        },
                        xAxis: {
                            type: 'value',
                            // name: '筛孔',
                            nameGap: 16,
                            nameTextStyle: {
                                color: '#000000',
                                fontSize: 14
                            },
                            min:0,
                            max:7,
                            lineStyle:{
                                color: '#000000',
                                type : 'solid'
                            },
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
                                    color: '#000000' //颜色
                                }
                            }
                        },
                        yAxis: {
                            type: 'value',
                            // name: '占比 %',
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
                                    color: '#000000'
                                }
                            },
                            splitLine: {
                                show: true,
                                lineStyle: {

                                    color: '#000000'
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
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            width:0.6,
                                            color: '#000000'
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
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#ed5565'
                                    }
                                },
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
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#ed5565'
                                    }
                                },
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            }
                        ]
                    };

                </script>
            </div>
        </div>
    </div>
</div>
<div class="row my-4">
    <div class="col-md-6 mb-4">
        <div class="card shadow">
            <div class="card-header">
                <strong class="card-title mb-0">一号机产品温度走势</strong>
            </div>
            <div class="card-body">
                <div id="chart1" class="charts1"></div>
                <script type="text/javascript">
                    var myChart1 = echarts.init(document.getElementById('chart1'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option1 =  {
                        tooltip: {
                            trigger: 'axis'
                        },
                        grid:{
                            top:'15%',
                            left: '1%',
                            right: '20%',
                            bottom: '2%',
                            containLabel: true
                        },
                        legend: {
                            data:['一仓温度','混合料温度','沥青温度','骨料温度','除尘器温度'],
                            x:'right',
                            orient:'vertical',
                            itemGap:20,
                            top:'25%',
                            left:'82.5%',
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
                            },
                            min:function (v) {
                                return (v.min - 30) < 0? 0:(v.min - 30).toFixed(1)
                            }
                        },
                        series: [
                            {
                                name:'一仓温度',
                                type:'line',
                                data:[11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }
                            },        {
                                name:'混合料温度',
                                type:'line',
                                data:[12, 13, 16, 17, 14, 11, 12],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                    ]
                                }
                            },        {
                                name:'沥青温度',
                                type:'line',
                                data:[11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
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
        </div>
    </div>
    <div class="col-md-6 mb-4">
        <div class="card shadow">
            <div class="card-header">
                <strong class="card-title mb-0">二号机产品温度走势</strong>
            </div>
            <div class="card-body">
                <div id="chart5" class="charts1"></div>
                <script type="text/javascript">
                    var myChart5 = echarts.init(document.getElementById('chart5'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option5= {
                        tooltip: {
                            trigger: 'axis'
                        },
                        grid:{
                            top:'15%',
                            left: '1%',
                            right: '20%',
                            bottom: '2%',
                            containLabel: true
                        },
                        legend: {
                            data:['一仓温度','混合料温度','沥青温度','骨料温度','除尘器温度'],
                            x:'right',
                            orient:'vertical',
                            itemGap:20,
                            top:'25%',
                            left:'82.5%',
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
                            },
                            min:function (v) {
                                return (v.min - 30) < 0? 0:(v.min - 30).toFixed(1)
                            }
                        },
                        series: [
                            {
                                name:'一仓温度',
                                type:'line',
                                data:[11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }
                            },        {
                                name:'混合料温度',
                                type:'line',
                                data:[12, 13, 16, 17, 14, 11, 12]
                            },        {
                                name:'沥青温度',
                                type:'line',
                                data:[11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }
                            },
                            {
                                name:'骨料温度',
                                type:'line',
                                data:[1, -2, 2, 5, 3, 2, 0],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }

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
        </div>
    </div>
</div>
    <%--js获取路径--%>
    <input id="path" type="hidden" value="${path}"/>
</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_monitoring.js"></script>


</html>