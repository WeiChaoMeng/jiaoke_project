<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>实时数据</title>
    <link href="../../../static/css/default.css" rel="stylesheet" type="text/css">
    <link href="../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link type="text/css" rel="stylesheet" href="../../../static/slider/css/carousel.css">
    <link href="../../../static/css/calendar.css" rel="stylesheet" type="text/css">
    <link href="../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <script src="../../../static/js/echarts/echarts.js"></script>
    <script src="../../../static/js/echarts/uimaker.js"></script>
    <style>
        .data-display div {
            width: 20%;
            float: left;
            margin-top: 10px;
        }

        .data-display div p {
            color: #000000;
            font-size: 13px;
            margin-bottom: 5px;
        }

        .current {
            padding-left: 20px;
        }

        .data-title {
            font-size: 15px;
            color: #000;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
<div class="chartbox3" id="chart_box" style="width: 100%;height: 100%;float: right;margin-top: 20px">

    <div class="data-display" style="height: 150px;width: 100%;padding-left: 30px">
        <div style="width: 100%;margin:0;">
            <p style="font-size: 15px" id="updateDate">更新时间：2018-11-10</p>
        </div>

        <div>
            <span class="data-title">PM2.5</span>
            <p class="current">当前值：37μg/m3</p>
            <p class="current">标准值：0~35μg/m3</p>
        </div>
        <div>
            <span class="data-title">PM10</span>
            <p class="current">当前值：52 ug/m3</p>
            <p class="current">标准值：40 ug/m3</p>
        </div>
        <div>
            <span class="data-title">TSP</span>
            <p class="current">当前值：49 ug/m3</p>
            <p class="current">标准值：30 ug/m3</p>
        </div>
        <div>
            <span class="data-title">噪音</span>
            <p class="current">当前值：57dB</p>
            <p class="current">标准值：40dB</p>
        </div>
        <div>
            <span class="data-title">废弃物</span>
            <p class="current">当前值：8m³</p>
        </div>
    </div>
    <div id="chart2" style="height:400px;width: 95%;padding-left: 30px"></div>

    <script type="text/javascript">
        var myChart1 = echarts.init(document.getElementById('chart2'));
        // 指定图表的配置项和数据
        option = {
            title: {
                text: '本周环境数据趋势'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend: {
                data: ['PM2.5', 'PM10', 'TSP', '噪音', '废弃物']
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: 'PM2.5',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name: 'PM10',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name: 'TSP',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name: '噪音',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data: [320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name: '废弃物',
                    type: 'line',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    areaStyle: {normal: {}},
                    data: [820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };
        myChart1.setOption(option, true);
        window.addEventListener("resize", function () {
            myChart1.resize();
        });

        $(function () {
            var date = new Date();
            var dates = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate() + "-" + date.getTime() + "-" + date.getMinutes() + "-" + date.getSeconds();
            $("#updateDate").html(dates);
        });

    </script>
</div>
</body>
</html>