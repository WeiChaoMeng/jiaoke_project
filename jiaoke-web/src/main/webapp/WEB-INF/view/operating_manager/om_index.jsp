<%--
  Created by IntelliJ IDEA.
  User: Melone
  Date: 2019/8/6
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/static/css/operating_manager/om_index.css" media="all">
    <link rel="stylesheet" href="/static/css/operating_manager/om_index_1.css" media="all">
    <script src="/static/js/echarts/echarts.js"></script>
</head>

<body layadmin-themealias="default">

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">

        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    本周生产量(吨)
                    <span class="layui-badge layui-bg-blue layuiadmin-badge">周</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">
                    <p class="layuiadmin-big-font" id="weekTotal">9,999,666</p>
                    <p>
                        时间段
                        <span class="layuiadmin-span-color" id="weekDate">2019-8-6 <i
                                class="layui-inline layui-icon layui-icon-flag"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    本月生产量(吨)
                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">月</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">
                    <p class="layuiadmin-big-font" id="monthData" >33,555</p>
                    <p>
                        时间段
                        <span class="layuiadmin-span-color" id="monthDate">2019-8-6 <i
                                class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    本年生产量(万吨)
                    <span class="layui-badge layui-bg-green layuiadmin-badge">年</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">

                    <p class="layuiadmin-big-font" id="yearData">999,666</p>
                    <p>
                        时间段
                        <span class="layuiadmin-span-color" id="yearDate" >2019-8-6  <i
                                class="layui-inline layui-icon layui-icon-dollar"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    累计完成生产量(万吨)
                    <span class="layui-badge layui-bg-orange layuiadmin-badge">总</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">

                    <p class="layuiadmin-big-font" id="sumData">66,666</p>
                    <p>
                        时间段
                        <span class="layuiadmin-span-color" id="sumDate">2019-8-6  <i
                                class="layui-inline layui-icon layui-icon-user"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-header" id="thisMonth">
                    本月产量折线图
                </div>
                <div class="layui-card-body">
                    <div class="layui-row">
                        <div class="layui-col-sm8">
                            <div id="echarts1"  class="layui-carousel layadmin-carousel layadmin-dataview" style="width: 100%; height: 600px;">
                                <script type="text/javascript">
                                    // 基于准备好的dom，初始化echarts实例
                                    var myChart1 = echarts.init(document.getElementById('echarts1'));
                                    option = {
                                        grid: {
                                            containLabel: true,
                                            left: 0,
                                            right: 10,
                                            bottom: 30,
                                        },
                                        tooltip: {
                                            show: true,
                                        },
                                        xAxis: {
                                            type: 'category',

                                            data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                                '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],

                                            splitLine: {
                                                show: true,
                                                lineStyle: {
                                                    color: 'rgb(237, 232, 249)',
                                                },
                                            },

                                            axisTick: {
                                                show: false,
                                            },
                                        },
                                        yAxis: {
                                            type: 'value',
                                            min:0,
                                            max:4000
                                        },
                                        series: [{
                                            data: [1820, 932, 1901, 2934, 1290, 1330, 320, 423, 1289, 2345, 2235, 3234, 3200, 234, 123, 1465, 67, 78, 435, 824, 354, 546, 446, 346, 46, 673, 36, 903, 2896, 3534],
                                            type: 'line',
                                            symbolSize: 8,
                                            itemStyle: {
                                                borderWidth: 2,
                                            },
                                        }]
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="layui-col-sm4">
                            <div class="layuiadmin-card-list">
                                <p class="layuiadmin-normal-font" id="monthD">月生产吨数</p>
                                <span>同上月增长</span>
                                <div class="layui-progress layui-progress-big" lay-showpercent="yes">
                                    <div class="layui-progress-bar" id ="lastMonthTonDiv" lay-percent="30%" style="width: 30%;"><span
                                            class="layui-progress-text" id ="lastMonthTonSpan">30%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="layuiadmin-card-list">
                                <p class="layuiadmin-normal-font" id="monthP">月生产盘数</p>
                                <span>同上月增长</span>
                                <div class="layui-progress layui-progress-big" lay-showpercent="yes">
                                    <div class="layui-progress-bar" id ="lastMonthDishDiv" lay-percent="20%" style="width: 20%;"><span
                                            class="layui-progress-text" id ="lastMonthDishSpan">20%</span></div>
                                </div>
                            </div>
                            <div class="layuiadmin-card-list">
                                <p class="layuiadmin-normal-font" id="monthS">月收入</p>
                                <span>同上月增长</span>
                                <div class="layui-progress layui-progress-big" lay-showpercent="yes">
                                    <div class="layui-progress-bar" id ="lastMonthIncomeDiv" lay-percent="25%" style="width: 25%;"><span
                                            class="layui-progress-text" id ="lastMonthIncomeSpan">25%</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-sm12">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-sm6">
                    <div class="layui-card" >
                        <div class="layui-card-header">完成工作与计划对比
                            <div class="layui-btn-group layuiadmin-btn-group">
                                <a href="javascript:;" onclick="addYearMessage()"  class="layui-btn layui-btn-primary layui-btn-xs" style="    top: 10px;">添加计划</a>
                            </div>
                        </div>
                        <div class="layui-card-body" id="echarts2" style="height: 300px;">
                            <script type="text/javascript">
                                // 基于准备好的dom，初始化echarts实例
                                var myChart2 = echarts.init(document.getElementById('echarts2'));

                                option2 = {
                                    backgroundColor:'#fff',
                                    grid: {
                                        y:'30',
                                        x:'10',
                                        x2: '10',
                                        y2: '0',
                                        containLabel: true
                                    },
                                    title: {
                                        text: '今年产量完成情况表(万吨)',
                                        x: 'center',
                                        y: 'top',
                                        itemGap: 20,
                                        textStyle : {
                                            // color : '#d9efff',
                                            fontFamily : '微软雅黑',
                                            fontSize : 18,
                                            fontWeight : 'bolder'
                                        }
                                    },
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{b}: ({d}%)<br/> {c}万吨"
                                    },
                                    series: [
                                        //认购完成01
                                        {
                                            name:'产量完成率',
                                            center: ['center', 'center'],
                                            type:'pie',
                                            radius: ['40%', '60%'],
                                            hoverAnimation: false,
                                            itemStyle:{
                                                normal:{
                                                    label:{
                                                        show:true,
                                                        distance:0.7,
                                                        textStyle:{color:'#000',fontSize:"14"},
                                                        formatter:'{b} {{d}%} \n {c}万吨',

                                                    },
                                                },
                                            },

                                            data:[
                                                {value:6000, name:'已完成',itemStyle:{
                                                        normal:{color:'#2b992b'}
                                                    },},
                                                {value:2000, name:'未完成',itemStyle:{
                                                        normal:{color:'#7b7b7b'}
                                                    }},
                                            ]
                                        },
                                        //认购完成02
                                        {
                                            name:'产量完成率',
                                            center: ['center', 'center'],
                                            type:'pie',
                                            radius: ['36%', '34%'],
                                            hoverAnimation: false,
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'center',
                                                    formatter:function (argument) {
                                                        var html;
                                                        html='目标值\r\n\r\n'+'8000';
                                                        return html;
                                                    },
                                                    textStyle:{
                                                        fontSize: 20,
                                                        color:'#000'
                                                    },

                                                }
                                            },
                                            data:[
                                                {value:6000, name:'目标值',itemStyle:{

                                                        color:'#7d879c',

                                                    }},
                                            ]
                                        },

                                    ]
                                };

                            </script>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6">
                    <div class="layui-card">
                        <div class="layui-card-header">各月完成比重</div>
                        <div class="layui-card-body" style="height: 300px;" id="echarts3" >

                            <script type="text/javascript">
                                // 基于准备好的dom，初始化echarts实例
                                var myChart3 = echarts.init(document.getElementById('echarts3'));
                                option3 = {
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    series: [{
                                        name: '库存情况',
                                        type: 'pie',
                                        radius: '68%',
                                        center: ['50%', '50%'],
                                        clockwise: false,
                                        data: [{
                                            value: 45,
                                            name: 'CARD'
                                        }, {
                                            value: 25,
                                            name: 'SSD'
                                        }, {
                                            value: 15,
                                            name: 'U盘'
                                        }, {
                                            value: 8,
                                            name: '嵌入式'
                                        }, {
                                            value: 7,
                                            name: 'FLASH'
                                        }],
                                        label: {
                                            normal: {
                                                textStyle: {
                                                    color: '#999',
                                                    fontSize: 14,
                                                }
                                            }
                                        },
                                        labelLine: {
                                            normal: {
                                                show: false
                                            }
                                        },
                                        itemStyle: {
                                            normal: {
                                                borderWidth: 4,
                                                borderColor: '#ffffff',
                                            },
                                            emphasis: {
                                                borderWidth: 0,
                                                shadowBlur: 10,
                                                shadowOffsetX: 0,
                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                                            }
                                        }
                                    }],
                                    color: [
                                        '#00acee',
                                        '#52cdd5',
                                        '#79d9f1',
                                        '#a7e7ff',
                                        '#c8efff'
                                    ],
                                    backgroundColor: '#fff'
                                };

                            </script>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6">
                    <div class="layui-card">
                        <div class="layui-card-header">各月生产天数</div>
                        <div class="layui-card-body" id="echarts4" style="height: 300px;" >
                            <script type="text/javascript">
                                // 基于准备好的dom，初始化echarts实例
                                var myChart4 = echarts.init(document.getElementById('echarts4'));
                                option4 = {
                                    grid: {
                                        left: '7%',
                                        right: '5%',
                                        top: '25%',
                                        bottom: '19%',
                                    },
                                    title: {
                                        show: false
                                    },
                                    tooltip : {
                                        trigger: 'axis',
                                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                        }
                                    },
                                    toolbox: {
                                        show: false,
                                    },
                                    xAxis: [
                                        {
                                            type: 'category',
                                            boundaryGap: true,
                                            show: true,
                                            axisTick: {
                                                show: false
                                            },
                                            axisLabel: {
                                                fontSize: 15,
                                                color: '#d0d0d0',
                                                margin: 8,
                                                interval:0 ,
                                                formatter:function(val){
                                                    return val.split("").join("\n");
                                                }
                                            },
                                            axisLine: {
                                                lineStyle: {
                                                    type: 'solid',
                                                    color: '#4e608b',//左边线的颜色
                                                    width:'1'//坐标线的宽度
                                                }
                                            },
                                            data: []
                                        }
                                    ],
                                    yAxis: [
                                        {
                                            type: 'value',
                                            min:0,
                                            scale: true,
                                            name: '',
                                            axisLine: {
                                                show: false
                                            },
                                            splitNumber : 4,
                                            axisTick: {
                                                show: false
                                            },
                                            splitLine: {
                                                lineStyle: {
                                                    // 使用深浅的间隔色
                                                    color: '#4e608b'
                                                }
                                            },
                                            axisLabel: {
                                                fontSize: 13,
                                                color: '#d0d0d0',
                                                margin: 12,
                                            },
                                            boundaryGap: [0.2, 0.2]
                                        }
                                    ],
                                    series: [
                                        {
                                            name:'每月生产天数',
                                            type:'bar',
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'top',
                                                    textStyle: {
                                                        color: '#1dacfe'
                                                    }
                                                }
                                            },
                                            itemStyle: {
                                                normal: {
                                                    color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                                        offset: 0,
                                                        color: "#4889fb" // 0% 处的颜色
                                                    }, {
                                                        offset: 1,
                                                        color: "#15b3ff" // 100% 处的颜色
                                                    }], false)
                                                }
                                            },
                                            barWidth: '40%',
                                            yAxisIndex: 0,
                                            data: []
                                        }
                                    ]
                                };


                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="experiment_from_div" id="addFrom" style="display:none;">
    <div class="title">
        <span>添加计划量</span>
    </div>

    <div class="title-msg">

    </div>

    <form class="login-form" method="post" novalidate >
        <!--输入框-->
        <div class="input-content">
            <!--autoFocus-->
            <div>
                <input type="text" autocomplete="off" id="dates"
                       placeholder="添加计划年份 例:2019"  />
                <input type="text" autocomplete="off" id="setTotal"
                       placeholder="添加计划量(万吨) 例:200"  />
            </div>
        </div>
        <!--登入按钮-->
        <div style="text-align: center">
            <button type="button" class="enter-btn"  onclick="sendFromData()">确定</button>
        </div>
    </form>

</div>
</div>
<%--js获取路径--%>
<input id="path" type="hidden" value="${path}"/>

<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/operating_manager/operating_manager.js"></script>

</body>
</html>
