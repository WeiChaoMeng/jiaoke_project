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
    request.setAttribute("path", request.getContextPath());
%>
<div class="card shadow my-4" style="width: 97%;margin: 15px auto;" >
    <div class="card-body">
        <div class="row align-items-center my-4">
            <div class="col-md-4">
                <div class="mx-4">
                    <h3>一号机组</h3>
                </div>
                <div class="row align-items-center">
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >生产日期</p>
                            <span class="h2 mb-0" id="crew1_basic_date" ></span>
                            <p class="small mb-0">
                                <span class="fe fe-arrow-up text-success fe-12"></span>
                                <span class="text-muted ml-1" id="crew1_basic_time"  style="font-size: 13px;" ></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >总量</p>
                            <span class="h2 mb-0" id="crew1_data_total"  ></span>
                            <p class="small mb-0">
                                <span class="fe fe-arrow-up text-success fe-12"></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >配比名称</p>
                            <span class="h2 mb-0" id="crew1_basic_ratio_name" ></span>
                            <p class="small mb-0">
                            </p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >盘号</p>
                            <span class="h2 mb-0"  id="crew1_basic_discNum"></span>
                            <p class="small mb-0">
                                <span class="fe fe-arrow-down text-danger fe-12"></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8" style="height: 300px;width: 66.66%">
                <div class="mr-4">
                    <div id="chart7" style="width: 825px;height: 300px;" ></div>
                    <script type="text/javascript">
                        var myChart7 = echarts.init(document.getElementById('chart7'));
                        // 指定图表的配置项和数据
                        var colors = ['#5793f3', '#d14a61', '#675bba'];
                        var option7 = {
                            title: {
                                text: '一号机组级配曲线图',
                                x: 'left',
                                textStyle: {
                                    color: '#685489',
                                    fontSize: 16
                                },
                                padding: [5, 0, 0, 40]
                            },
                            legend: {
                                data: ['合成级配', '实际级配', '上限', '中值', '下限'],
                                x: 'left',
                                left: '35%'
                            },
                            grid: {
                                left: '3.7%',
                                right: '3.7%',
                                bottom: '3%',
                                containLabel: true
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter: function (params, ticket, callback) {
                                    return '筛孔:' + returnX(params[0].value[0]) + '的通过率<br/>'
                                        + params[0].marker + params[0].seriesName + ' :  ' + (params[0].value[1]).toFixed(1) + '%<br/>'
                                        + params[1].marker + params[1].seriesName + ':  ' + (params[1].value[1]).toFixed(1) + '%<br/>'
                                        + params[2].marker + params[2].seriesName + ':  ' + (params[2].value[1]).toFixed(1) + '%<br/>'
                                        + params[3].marker + params[3].seriesName + ':  ' + (params[3].value[1]).toFixed(1) + '%<br/>'
                                        + params[4].marker + params[4].seriesName + ':  ' + (params[4].value[1]).toFixed(1) + '%<br/>';
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
                                min: 0,
                                max: 7,

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
                                max: 100,
                                min: 0,
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
                                            rotate: 90,
                                            normal: {
                                                position: "start"
                                            }
                                        },
                                        lineStyle: {
                                            normal: {
                                                type: 'solid',
                                                width: 0.6,
                                                color: '#000000'
                                            }
                                        },
                                        data: []
                                    }
                                },
                                {
                                    id: 'a',
                                    type: 'line',
                                    name: '合成级配',
                                    symbolSize: 6,
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            width: 0.6,
                                            color: '#96ceb4'
                                        }
                                    },
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                },
                                {
                                    id: 'b',
                                    type: 'line',
                                    name: '实际级配',
                                    symbolSize: 6,
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
                                    name: '上限',
                                    symbolSize: 6,
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
                                    name: '中值',
                                    symbolSize: 6,
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                },
                                {
                                    id: 'e',
                                    type: 'line',
                                    name: '下限',
                                    symbolSize: 6,
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
</div>
<div class="row" >
    <div class="col-md-12">
        <div class="card shadow eq-card mb-4" style="height: auto;">
            <div class="card-body" style="width: 100%;">
                <div class="card-title">
                    <strong>一号机组生产信息</strong>
                </div>
                <div class="row mt-b">
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料10</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate10_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate10" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate10_svg"> <i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料9</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate9_real"  ><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate9" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate9_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料8</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate8_real"  ><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate8" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate8_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料7</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate7_real" ><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate7" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate7_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料6</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate6_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate6" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate6_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料5</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate5_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate5" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate5_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料4</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate4_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate4" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate4_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料3</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate3_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate3" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate3_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>

                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料2</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate2_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate2" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate2_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料1</p>
                        <h3 class="mb-1" id="crew1_data_Aggregate1_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate1" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_Aggregate1_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">矿粉4</p>
                        <h3 class="mb-1" id="crew1_data_stone4_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_stone4" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_stone4_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3">
                        <p class="text-muted mb-1">矿粉3</p>
                        <h3 class="mb-1" id="crew1_data_stone3_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_stone3" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_stone3_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">矿粉2</p>
                        <h3 class="mb-1" id="crew1_data_stone2_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_stone2" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_stone2_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">矿粉1</p>
                        <h3 class="mb-1" id="crew1_data_stone1_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_stone1" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_stone1_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">沥青</p>
                        <h3 class="mb-1" id="crew1_data_asphalt_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_asphalt" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_asphalt_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">再生料</p>
                        <h3 class="mb-1" id="crew1_data_regenerate_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_regenerate" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_regenerate_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂1</p>
                        <h3 class="mb-1" id="crew1_data_additive_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_additive" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_additive_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂2</p>
                        <h3 class="mb-1" id="crew1_data_additive1_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_additive1" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_additive1_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂3</p>
                        <h3 class="mb-1" id="crew1_data_additive2_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_additive2" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_additive2_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂4</p>
                        <h3 class="mb-1" id="crew1_data_additive3_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_additive3" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew1_data_additive3_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">一仓温度</p>
                        <h3 class="mb-1" id="crew1_data_warehouse1"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_warehouse1_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">除尘器温度</p>
                        <h3 class="mb-1" id="crew1_data_duster"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_duster_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">沥青温度</p>
                        <h3 class="mb-1" id="crew1_data_temasphalt"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_temasphalt_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3">
                        <p class="text-muted mb-1">混合料温度</p>
                        <h3 class="mb-1" id="crew1_data_aggregate"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew1_data_aggregate_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                </div>
                <div class="chart-widget">
                    <div id="columnChartWidget" width="300" height="200"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card shadow my-4" style="width: 97%;margin: 15px auto;" >
    <div class="card-body">
        <div class="row align-items-center my-4">
            <div class="col-md-4">
                <div class="mx-4">
                    <h3>二号机组</h3>
                </div>
                <div class="row align-items-center">
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >生产日期</p>
                            <span class="h2 mb-0" id="crew2_basic_date" ></span>
                            <p class="small mb-0">
                                <span class="fe fe-arrow-up text-success fe-12"></span>
                                <span class="text-muted ml-1" id="crew2_basic_time"  style="font-size: 13px;" ></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >总量</p>
                            <span class="h2 mb-0" id="crew2_data_total"  ></span>
                            <p class="small mb-0">
                                <span class="fe fe-arrow-up text-success fe-12"></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >配比名称</p>
                            <span class="h2 mb-0" id="crew2_basic_ratio_name" ></span>
                            <p class="small mb-0">
                            </p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-4">
                            <p class="small text-uppercase text-muted mb-0" style="font-size: 13px;" >盘号</p>
                            <span class="h2 mb-0"  id="crew2_basic_discNum"></span>
                            <p class="small mb-0">
                                <span class="fe fe-arrow-down text-danger fe-12"></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="mr-4">
                    <div id="chart4" style="width: 825px;height: 300px;" ></div>
                    <script type="text/javascript">
                        var myChart4 = echarts.init(document.getElementById('chart4'));
                        // 指定图表的配置项和数据
                        var colors = ['#5793f3', '#d14a61', '#675bba'];
                        var option4 = {
                            title: {
                                text: '二号机组级配曲线图',
                                x: 'left',
                                textStyle: {
                                    color: '#685489',
                                    fontSize: 16
                                },
                                padding: [5, 0, 0, 40]
                            },
                            legend: {
                                data: ['合成级配', '实际级配', '上限', '中值', '下限'],
                                x: 'left',
                                left: '35%'
                            },
                            grid: {
                                left: '3.7%',
                                right: '3.7%',
                                bottom: '3%',
                                containLabel: true
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter: function (params, ticket, callback) {
                                    return '筛孔:' + returnX(params[0].value[0]) + '的通过率<br/>'
                                        + params[0].marker + params[0].seriesName + ' :  ' + (params[0].value[1]).toFixed(1) + '%<br/>'
                                        + params[1].marker + params[1].seriesName + ':  ' + (params[1].value[1]).toFixed(1) + '%<br/>'
                                        + params[2].marker + params[2].seriesName + ':  ' + (params[2].value[1]).toFixed(1) + '%<br/>'
                                        + params[3].marker + params[3].seriesName + ':  ' + (params[3].value[1]).toFixed(1) + '%<br/>'
                                        + params[4].marker + params[4].seriesName + ':  ' + (params[4].value[1]).toFixed(1) + '%<br/>';
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
                                min: 0,
                                max: 7,
                                lineStyle: {
                                    color: '#000000',
                                    type: 'solid'
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
                                max: 100,
                                min: 0,
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
                                                width: 0.6,
                                                color: '#000000'
                                            }
                                        },
                                        data: []
                                    }
                                },
                                {
                                    id: 'a',
                                    type: 'line',
                                    name: '合成级配',
                                    symbolSize: 6,
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                },
                                {
                                    id: 'b',
                                    type: 'line',
                                    name: '实际级配',
                                    symbolSize: 6,
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                },
                                {
                                    id: 'c',
                                    type: 'line',
                                    name: '上限',
                                    symbolSize: 6,
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
                                    name: '中值',
                                    symbolSize: 6,
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                },
                                {
                                    id: 'e',
                                    type: 'line',
                                    name: '下限',
                                    symbolSize: 6,
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
</div>
<div class="row" >
    <div class="col-md-12">
        <div class="card shadow eq-card mb-4" style="height: auto;">
            <div class="card-body" style="width: 100%;">
                <div class="card-title">
                    <strong>二号机组生产信息</strong>
                </div>
                <div class="row mt-b">
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料10</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate10_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate10" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate10_svg"> <i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料9</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate9_real"  ><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate9" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate9_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料8</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate8_real"  ><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate8" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate8_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料7</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate7_real" ><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate7" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate7_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料6</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate6_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate6" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate6_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料5</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate5_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate5" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate5_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料4</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate4_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate4" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate4_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料3</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate3_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate3" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate3_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>

                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料2</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate2_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate2" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate2_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">骨料1</p>
                        <h3 class="mb-1" id="crew2_data_Aggregate1_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate1" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_Aggregate1_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">矿粉4</p>
                        <h3 class="mb-1" id="crew2_data_stone4_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_stone4" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_stone4_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3">
                        <p class="text-muted mb-1">矿粉3</p>
                        <h3 class="mb-1" id="crew2_data_stone3_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_stone3" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_stone3_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">矿粉2</p>
                        <h3 class="mb-1" id="crew2_data_stone2_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_stone2" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_stone2_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">矿粉1</p>
                        <h3 class="mb-1" id="crew2_data_stone1_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_stone1" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_stone1_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">沥青</p>
                        <h3 class="mb-1" id="crew2_data_asphalt_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_asphalt" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_asphalt_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">再生料</p>
                        <h3 class="mb-1" id="crew2_data_regenerate_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_regenerate" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_regenerate_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂1</p>
                        <h3 class="mb-1" id="crew2_data_additive_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_additive" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_additive_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂2</p>
                        <h3 class="mb-1" id="crew2_data_additive1_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_additive1" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_additive1_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂3</p>
                        <h3 class="mb-1" id="crew2_data_additive2_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_additive2" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_additive2_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">添加剂4</p>
                        <h3 class="mb-1" id="crew2_data_additive3_real"><i>kg</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_additive3" ><i>%</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                        <p class="text-muted mb-2" id="crew2_data_additive3_svg" ><i>kg</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">一仓温度</p>
                        <h3 class="mb-1" id="crew2_data_warehouse1"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_warehouse1_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">除尘器温度</p>
                        <h3 class="mb-1" id="crew2_data_duster"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_duster_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3 border-right">
                        <p class="text-muted mb-1">沥青温度</p>
                        <h3 class="mb-1" id="crew2_data_temasphalt"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_temasphalt_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                    <div class="col-1 text-center mb-3">
                        <p class="text-muted mb-1">混合料温度</p>
                        <h3 class="mb-1" id="crew2_data_aggregate"><i>℃</i></h3>
                        <p class="text-muted mb-2" id="crew2_data_aggregate_svg" ><i>℃</i><span class="fe fe-arrow-up fe-12 text-success"></span></p>
                    </div>
                </div>
                <div class="chart-widget">
                    <div id="" width="300" height="200"></div>
                </div>
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
                    var option1 = {
                        tooltip: {
                            trigger: 'axis'
                        },
                        grid: {
                            top: '15%',
                            left: '1%',
                            right: '20%',
                            bottom: '2%',
                            containLabel: true
                        },
                        legend: {
                            data: ['一仓温度', '混合料温度', '沥青温度', '骨料温度', '除尘器温度'],
                            x: 'right',
                            orient: 'vertical',
                            itemGap: 20,
                            top: '25%',
                            left: '82.5%',
                            textStyle: {
                                color: '#53332b',
                                fontWeight: 'bold'
                            }
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                        },
                        yAxis: {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} °C'
                            },
                            min: function (v) {
                                return (v.min - 30) < 0 ? 0 : (v.min - 30).toFixed(1)
                            }
                        },
                        series: [
                            {
                                name: '一仓温度',
                                type: 'line',
                                data: [11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }
                            }, {
                                name: '混合料温度',
                                type: 'line',
                                data: [12, 13, 16, 17, 14, 11, 12],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                    ]
                                }
                            }, {
                                name: '沥青温度',
                                type: 'line',
                                data: [11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                    ]
                                }
                            },
                            {
                                name: '骨料温度',
                                type: 'line',
                                data: [1, -2, 2, 5, 3, 2, 0],

                            },
                            {
                                name: '除尘器温度',
                                type: 'line',
                                data: [1, -2, 2, 5, 3, 2, 0],

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
                    var option5 = {
                        tooltip: {
                            trigger: 'axis'
                        },
                        grid: {
                            top: '15%',
                            left: '1%',
                            right: '20%',
                            bottom: '2%',
                            containLabel: true
                        },
                        legend: {
                            data: ['一仓温度', '混合料温度', '沥青温度', '骨料温度', '除尘器温度'],
                            x: 'right',
                            orient: 'vertical',
                            itemGap: 20,
                            top: '25%',
                            left: '82.5%',
                            textStyle: {
                                color: '#53332b',
                                fontWeight: 'bold'
                            }
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                        },
                        yAxis: {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} °C'
                            },
                            min: function (v) {
                                return (v.min - 30) < 0 ? 0 : (v.min - 30).toFixed(1)
                            }
                        },
                        series: [
                            {
                                name: '一仓温度',
                                type: 'line',
                                data: [11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }
                            }, {
                                name: '混合料温度',
                                type: 'line',
                                data: [12, 13, 16, 17, 14, 11, 12]
                            }, {
                                name: '沥青温度',
                                type: 'line',
                                data: [11, 11, 15, 13, 12, 13, 10],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }
                            },
                            {
                                name: '骨料温度',
                                type: 'line',
                                data: [1, -2, 2, 5, 3, 2, 0],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'}
                                    ]
                                }

                            },
                            {
                                name: '除尘器温度',
                                type: 'line',
                                data: [1, -2, 2, 5, 3, 2, 0],

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