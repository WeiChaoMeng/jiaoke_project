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
    <title>实时监测</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
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
                    <th>车号</th>
                    <th>盘号</th>
                    <th>客户号</th>
                </thead>

                <tbody>

                    <tr>
                        <td id="crew1_basic_date" >20171101</td>
                        <td id="crew1_basic_time" >8:35</td>
                        <td id="crew1_basic_ratio" >256</td>
                        <td id="crew1_basic_carNum" >京C66666</td>
                        <td id="crew1_basic_discNum" >A16</td>
                        <td  id="crew1_basic_userNum" >1554568791</td>
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
            <th>车号</th>
            <th>盘号</th>
            <th>客户号</th>
            </thead>

            <tbody>

            <tr>
                <td id="crew2_basic_date" >20171101</td>
                <td id="crew2_basic_time" >8:35</td>
                <td id="crew2_basic_ratio" >256</td>
                <td id="crew2_basic_carNum" >京C66666</td>
                <td id="crew2_basic_discNum" >A16</td>
                <td  id="crew2_basic_userNum" >1554568791</td>
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
                            { type: 'min', name: '最小值' }
                        ]
                    }
                },
                {
                    name: '下限占比',
                    type: 'line',
                    data: [1, 2, 2, 5, 3, 2, 0, 1, 2, 2, 5, 3, 2, 0],
                    formatter: '{value} %',

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
                    }
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
                    }
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
<script type="text/javascript" src="/static/js/skin.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_monitoring_false.js.js"></script>

<script>
    $(function () {
       getRealTimeData();
    });

    //获取实时数据
    function getRealTimeData(){
        $.ajax({
            url:"${path}/getRealTimeSurveillanceFalse.do",
            type:"post",
            success:function (res) {
                console.log(JSON.parse(res));
                var result = JSON.parse(res);
                $("#crew1_basic_date").html(result.produceDate.substring(0,10));
                $("#crew1_basic_time").html(result.productTime.substring(11,19));
                $("#crew1_basic_ratio").html(result.produceProportioningNum);
                $("#crew1_basic_carNum").html(result.produceCarNum);
                $("#crew1_basic_discNum").html(result.produceDiscNum);
                $("#crew1_basic_userNum").html(result.produceCustomNum);

                $("#crew1_data_Aggregate1").html(result.materialAggregate1);
                $("#crew1_data_Aggregate2").html(result.materialAggregate2);
                $("#crew1_data_Aggregate3").html(result.materialAggregate3);
                $("#crew1_data_Aggregate4").html(result.materialAggregate4);
                $("#crew1_data_Aggregate5").html(result.materialAggregate5);
                $("#crew1_data_Aggregate6").html(result.materialAggregate6);
                $("#crew1_data_warehouse1").html(result.temperatureWarehouse1+ "<i>℃</i>");
                $("#crew1_data_duster").html(result.temperatureDuster+ "<i>℃</i>");

                $("#crew1_data_stone1").html(result.materialStone1);
                $("#crew1_data_stone2").html(result.materialStone2);
                $("#crew1_data_asphalt").html(result.materialAsphalt);
                $("#crew1_data_regenerate").html(result.materialRegenerate);
                $("#crew1_data_additive").html(result.materialAdditive);
                $("#crew1_data_total").html(result.materialTotal);
                $("#crew1_data_temasphalt").html(result.temperatureAsphalt+ "<i>℃</i>");
                $("#crew1_data_aggregate").html(result.temperatureAggregate+ "<i>℃</i>");
            }
        })
    }
    window.setInterval(getRealTimeData,3000);
</script>
</html>