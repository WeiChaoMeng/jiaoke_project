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
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>


<script type="text/javascript" >



    /****************************************************************************/
    function  getRealTimeData() {
        $.ajax({
            url:"http://localhost:8080/getRealTimeData.do",
            type:"get",
            dataType:"json",
            success:function (res) {

                renderDataToPage(res);
            }

        })
    }

    function renderDataToPage(listStr) {

        if (listStr){
            for (var i=0;i<listStr.length;i++){

                if ( listStr[i].crewNum == 'crew1' ){

                    $("#crew1_basic_date").html(listStr[i].produce_date);
                    $("#crew1_basic_time").html(listStr[i].produce_time);
                    $("#crew1_basic_ratio").html(listStr[i].produce_proportioning_num);
                    $("#crew1_basic_carNum").html(listStr[i].produce_car_num);
                    $("#crew1_basic_discNum").html(listStr[i].produce_disc_num);
                    $("#crew1_basic_userNum").html(listStr[i].produce_custom_num);
                    $("#crew1_data_Aggregate1").html(listStr[i].material_aggregate_1 + "<i>%</i>");
                    $("#crew1_data_Aggregate2").html(listStr[i].material_aggregate_2 + "<i>%</i>");
                    $("#crew1_data_Aggregate3").html(listStr[i].material_aggregate_3 + "<i>%</i>");
                    $("#crew1_data_Aggregate4").html(listStr[i].material_aggregate_4 + "<i>%</i>");
                    $("#crew1_data_Aggregate5").html(listStr[i].material_aggregate_5 + "<i>%</i>");
                    $("#crew1_data_Aggregate6").html(listStr[i].material_aggregate_6 + "<i>%</i>");
                    $("#crew1_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                    $("#crew1_data_duster").html(listStr[i].temperature_duster+ " <i>℃</i>");

                    $("#crew1_data_stone1").html(listStr[i].material_stone_1+ "<i>%</i>");
                    $("#crew1_data_stone2").html(listStr[i].material_stone_2+ "<i>%</i>");
                    $("#crew1_data_asphalt").html(listStr[i].material_asphalt+ "<i>%</i>");
                    $("#crew1_data_regenerate").html(listStr[i].material_regenerate+ "<i>%</i>");
                    $("#crew1_data_additive").html(listStr[i].material_additive+ "<i>%</i>");
                    $("#crew1_data_total").html(listStr[i].material_total+ "<i>Kg</i>");
                    $("#crew1_data_temasphalt").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                    $("#crew1_data_aggregate").html(listStr[i].temperature_aggregate+ " <i>℃</i>");

                }else {
                 debugger
                    $("#crew2_basic_date").html(listStr[i].produce_date);
                    $("#crew2_basic_time").html(listStr[i].produce_time);
                    $("#crew2_basic_ratio").html(listStr[i].produce_proportioning_num);
                    $("#crew2_basic_carNum").html(listStr[i].produce_car_num);
                    $("#crew2_basic_discNum").html(listStr[i].produce_disc_num);
                    $("#crew2_basic_userNum").html(listStr[i].produce_custom_num);
                    $("#crew2_data_Aggregate1").html(listStr[i].material_aggregate_1 + "<i>%</i>");
                    $("#crew2_data_Aggregate2").html(listStr[i].material_aggregate_2 + "<i>%</i>");
                    $("#crew2_data_Aggregate3").html(listStr[i].material_aggregate_3 + "<i>%</i>");
                    $("#crew2_data_Aggregate4").html(listStr[i].material_aggregate_4 + "<i>%</i>");
                    $("#crew2_data_Aggregate5").html(listStr[i].material_aggregate_5 + "<i>%</i>");
                    $("#crew2_data_Aggregate6").html(listStr[i].material_aggregate_6 + "<i>%</i>");
                    $("#crew2_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                    $("#crew2_data_duster").html(listStr[i].temperature_duster+ " <i>℃</i>");
                    $("#crew2_data_stone1").html(listStr[i].material_stone_1+ "<i>%</i>");
                    $("#crew2_data_stone2").html(listStr[i].material_stone_2+ "<i>%</i>");
                    $("#crew2_data_asphalt").html(listStr[i].material_asphalt+ "<i>%</i>");
                    $("#crew2_data_regenerate").html(listStr[i].material_regenerate+ "<i>%</i>");
                    $("#crew2_data_additive").html(listStr[i].material_additive+ "<i>%</i>");
                    $("#crew2_data_total").html(listStr[i].material_total+ "<i>Kg</i>");
                    $("#crew2_data_temasphalt").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                    $("#crew2_data_aggregate").html(listStr[i].temperature_aggregate+ " <i>℃</i>");

                }
            }
        }

    }
    /****************************************************************************/

        window.setInterval(getRealTimeData,3000);


    $(function () {

    });
</script>

</html>