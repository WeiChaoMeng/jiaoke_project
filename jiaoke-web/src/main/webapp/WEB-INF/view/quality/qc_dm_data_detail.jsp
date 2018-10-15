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
    <title>模板更新</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body style="padding:15px 8px 500px 8px;">

<div class="divbox">

    <div class="">
        <div class="boxtitle"><span>产品基本信息</span></div>

        <div class="boxdown">
            <table class="simpletable">
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

    </div>
</div>

<div class="">
    <div class="">
        <div class="boxtitle">
            <span>产品详细数据信息</span>
        </div>

        <div class="boxdown">
            <table class="simpletable">
                <thead>
                    <th style="width: 70px ">预警级别</th>
                    <th style="width: 70px ">日期</th>
                    <th style="width: 70px">时间</th>
                    <th style="width: 70px">盘号</th>
                    <th style="width: 70px ">配比号</th>
                    <th style="width: 70px">骨料4</th>
                    <th style="width: 70px">骨料3</th>
                    <th style="width: 70px">骨料2</th>
                    <th style="width: 70px">骨料1</th>
                    <th style="width: 70px ">石粉2</th>
                    <th style="width: 70px ">沥青</th>
                    <th style="width: 100px">合计(kg)</th>
                   
                </thead>
                
                <tbody>
                    <tr></tr>
                    <tr>
                        <td>3</td>
                        <td>6月10日</td>
                        <td>20:13:28</td>
                        <td>1</td>
                        <td>2</td>
                        <td>1543</td>
                        <td>2783</td>
                        <td>3344</td>
                        <td>4636</td>
                        <td>126.1</td>
                        <td>235.5</td>
                        <td>4997.6</td>
                        
                    </tr>
                
                </tbody>
                <thead>
                    <th style="width: 100px ">1仓温度</th>
                    <th style="width: 100px ">混合料温度</th>
                    <th style="width: 100px ">除尘器入口温度</th>
                    <th style="width: 100px ">每锅总量</th>
                    <th style="width: 100px ">石料总重</th>
                    <th style="width: 100px ">石料1比例</th>
                    <th style="width: 100px ">石料2比例</th>
                    <th style="width: 100px ">石料3比例</th>
                    <th style="width: 100px ">石料4比例</th>
                    <th style="width: 100px ">粉料比例</th>
                    <th style="width: 100px ">沥青含量</th>
                    <th style="width: 10px"></th>
                </thead>
                <tbody>
                    <td>176</td>
                    <td>104</td>
                    <td>88</td>
                    <td>4997.6</td>
                    <td>4636</td>
                    <td>25.85</td>
                    <td>11.23</td>
                    <td>24.81</td>
                    <td>30.87</td>
                    <td>2.52</td>
                    <td>4.71</td>
                </tbody>
            </table>
        </div>

    </div>
</div>


<div class="divbox_realtime">

    <li>

        <div>
            <div class="boxtitle">

            </div>
            <div id="chart" class="charts1"></div>
        </div>

        <script type="text/javascript">
            var myChart = echarts.init(document.getElementById('chart'));
            // 指定图表的配置项和数据
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var option = {
                title: {
                    text: '产品材料配比图',
                    subtext: '材料构成',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['骨料', '碎石', '骨料1', '碎石2', '添加剂']
                },
                series: [
                    {
                        name: '构成图',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: [
                            {value: 335, name: '骨料'},
                            {value: 310, name: '碎石'},
                            {value: 234, name: '骨料1'},
                            {value: 135, name: '碎石2'},
                            {value: 1548, name: '添加剂'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };


            setInterval(function () { //把option.series[0].data[0].value的值使用random()方法获取一个随机数
                option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
                myChart.setOption(option, true);
            }, 2000);
            myChart.setOption(option);
            window.addEventListener("resize", function () {
                myChart.resize();
            });
        </script>
</div>
</li>


<div class="divbox_realtime">
    <div>
        <div class="boxtitle">

        </div>
        <div id="chart2" class="charts1"></div>
    </div>

    <script type="text/javascript">
        var myChart2 = echarts.init(document.getElementById('chart2'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option2 =  {
                title: {
                    text: '产品材料构成曲线图',
                    subtext: ''
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['模板占比', '实际占比']
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
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['石料', '石料1', '石料2', '粉料', '沥青', '骨料', '骨料一']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} %'
                    }
                },
                series: [
                    {
                        name: '模板占比',
                        type: 'line',
                        data: [11, 11, 15, 13, 12, 13, 10],
                        formatter: '{value} %',
                        markPoint: {
                            
                            data: [
                                { type: 'max', name: '最大值' },
                                { type: 'min', name: '最小值' }
                            ]
                        }
                    },
                    {
                        name: '实际占比',
                        type: 'line',
                        data: [1, 2, 2, 5, 3, 2, 0],
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
</li>


</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
</html>
