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
<title>打卡记录</title>
<link href="../../css/default.css" rel="stylesheet" type="text/css">
<link href="../../css/style/green.css" rel="stylesheet" type="text/css" id = 'link'>
<link type="text/css" rel="stylesheet" href="../../slider/css/carousel.css">
<script src="../../js/echarts/echarts.js"></script>
<script src="../../js/echarts/uimaker.js"></script>
</head>

<body style="padding:10px 8px 1800px 8px;">

<div class="infolist1">

    <div class="infoboxleft">
        <div class="boxtitle">
            <span>一号配比</span>
            <a href="qc_dm_data_number.jsp" target="_self">更多
                <i class="iconfont">&#xeba8;</i>
            </a>
        </div>

        <div class="boxdown">
                   <table class="simpletable">

            <thead>
                <th>产品盘号</th>

                <th>生产时间</th>
                <th>客户名</th>
                <th>操作</th>
            </thead>

            <tbody>

                <tr>
                    <td>20171101</td>

                    <td>2017-11-01</td>

                    <td>uimaker</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>

                <tr>
                    <td>20171102</td>

                    <td>2017-11-02</td>

                    <td>admin</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>

                <tr>
                    <td>20171103</td>

                    <td>2017-11-03 </td>

                    <td>nanjing</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>

                <tr>
                    <td>20171104</td>

                    <td>2017-11-04</td>

                    <td>office</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>

                <tr>
                    <td>20171105</td>

                    <td>2017-11-05</td>

                    <td>uimaker</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>

                <tr>
                    <td>20171106</td>
 
                    <td>2017-11-06 </td>

                    <td>guanliyuan</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>

                <tr>
                    <td>20171107</td>
 
                    <td>2017-11-07 </td>

                    <td>moodoc</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>

                <tr>
                    <td>20171108</td>

                    <td>2017-11-08 </td>

                    <td>iphonex</td>
                    <td>
                        <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                        <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                            <i class="toolico iconfont">&#xe970;</i>查看</a>

                    </td>
                </tr>


            </tbody>

        </table>
        </div>

    </div>
</div>

<div class="chartbox4">
    <div class="boxtitle">
        <span>一号配比产品温度走势图</span>
        <a href="#">更多
            <i class="iconfont">&#xeba8;</i>
        </a>
    </div>
    <div id="chart1" class="charts"></div>

<script type="text/javascript">
    var myChart1 = echarts.init(document.getElementById('chart1'));
    // 指定图表的配置项和数据
    var colors = ['#5793f3', '#d14a61', '#675bba'];
    var option1 =  {
            title: {
                text: '',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c}'
            },
            legend: {
                left: 'left',
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
        setInterval(function () {//把option.series[0].data[0].value的值使用random()方法获取一个随机数
            option1.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
            myChart.setOption(option1, true);
        }, 2000);
        myChart1.setOption(option1);
        window.addEventListener("resize", function () {
            myChart1.resize();
        });
    </script>

</div>

<div class="infolist1">

    <div class="infoboxleft">
        <div class="boxtitle">
            <span>二号配比</span>
            <a href="qc_dm_data_number.jsp" target="_self">更多
                <i class="iconfont">&#xeba8;</i>
            </a>
        </div>

        <div class="boxdown">
            <table class="simpletable">

                <thead>
                    <th>产品盘号</th>

                    <th>生产时间</th>
                    <th>客户名</th>
                    <th>操作</th>
                </thead>

                <tbody>

                    <tr>
                        <td>20171101</td>

                        <td>2017-11-01</td>

                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171102</td>

                        <td>2017-11-02</td>

                        <td>admin</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171103</td>

                        <td>2017-11-03 </td>

                        <td>nanjing</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171104</td>

                        <td>2017-11-04</td>

                        <td>office</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171105</td>

                        <td>2017-11-05</td>

                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171106</td>

                        <td>2017-11-06 </td>

                        <td>guanliyuan</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171107</td>

                        <td>2017-11-07 </td>

                        <td>moodoc</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171108</td>

                        <td>2017-11-08 </td>

                        <td>iphonex</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>


                </tbody>

            </table>
        </div>

    </div>
</div>

<div class="chartbox4">
    <div class="boxtitle">
        <span>二号配比产品统计图</span>
        <a href="#">更多
            <i class="iconfont">&#xeba8;</i>
        </a>
    </div>
    <div id="chart2" class="charts"></div>

    <script type="text/javascript">
        var myChart2 = echarts.init(document.getElementById('chart2'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option2 = {
                title: {
                    text: '',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c}'
                },
                legend: {
                    left: 'left',
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
        setInterval(function () {//把option.series[0].data[0].value的值使用random()方法获取一个随机数
            option2.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
            myChart2.setOption(option2, true);
        }, 2000);
        myChart2.setOption(option2);
        window.addEventListener("resize", function () {
            myChart2.resize();
        });
    </script>

</div>

<div class="infolist1">

    <div class="infoboxleft">
        <div class="boxtitle">
            <span>三号配比</span>
            <a href="qc_dm_data_number.jsp" target="_self">更多
                <i class="iconfont">&#xeba8;</i>
            </a>
        </div>

        <div class="boxdown">
            <table class="simpletable">

                <thead>
                    <th>产品盘号</th>

                    <th>生产时间</th>
                    <th>客户名</th>
                    <th>操作</th>
                </thead>

                <tbody>

                    <tr>
                        <td>20171101</td>

                        <td>2017-11-01</td>

                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171102</td>

                        <td>2017-11-02</td>

                        <td>admin</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171103</td>

                        <td>2017-11-03 </td>

                        <td>nanjing</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171104</td>

                        <td>2017-11-04</td>

                        <td>office</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171105</td>

                        <td>2017-11-05</td>

                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171106</td>

                        <td>2017-11-06 </td>

                        <td>guanliyuan</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171107</td>

                        <td>2017-11-07 </td>

                        <td>moodoc</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171108</td>

                        <td>2017-11-08 </td>

                        <td>iphonex</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>


                </tbody>

            </table>
        </div>

    </div>
</div>

<div class="chartbox4">
    <div class="boxtitle">
        <span>三号配比产品统计图</span>
        <a href="#">更多
            <i class="iconfont">&#xeba8;</i>
        </a>
    </div>
    <div id="chart3" class="charts"></div>

    <script type="text/javascript">
        var myChart3 = echarts.init(document.getElementById('chart3'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option3 = {
                title: {
                    text: '',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c}'
                },
                legend: {
                    left: 'left',
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
        setInterval(function () {//把option.series[0].data[0].value的值使用random()方法获取一个随机数
            option3.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
            myChart3.setOption(option3, true);
        }, 2000);
        myChart3.setOption(option3);
        window.addEventListener("resize", function () {
            myChart3.resize();
        });
    </script>

</div>

<div class="infolist1">

    <div class="infoboxleft">
        <div class="boxtitle">
            <span>四号配比</span>
            <a href="qc_dm_data_number.jsp" target="_self">更多
                <i class="iconfont">&#xeba8;</i>
            </a>
        </div>

        <div class="boxdown">
            <table class="simpletable">

                <thead>
                    <th>产品盘号</th>

                    <th>生产时间</th>
                    <th>客户名</th>
                    <th>操作</th>
                </thead>

                <tbody>

                    <tr>
                        <td>20171101</td>

                        <td>2017-11-01</td>

                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171102</td>

                        <td>2017-11-02</td>

                        <td>admin</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171103</td>

                        <td>2017-11-03 </td>

                        <td>nanjing</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171104</td>

                        <td>2017-11-04</td>

                        <td>office</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171105</td>

                        <td>2017-11-05</td>

                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171106</td>

                        <td>2017-11-06 </td>

                        <td>guanliyuan</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171107</td>

                        <td>2017-11-07 </td>

                        <td>moodoc</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>20171108</td>

                        <td>2017-11-08 </td>

                        <td>iphonex</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>


                </tbody>

            </table>
        </div>

    </div>
</div>

<div class="chartbox4">
    <div class="boxtitle">
        <span>四号配比产品统计图</span>
        <a href="#">更多
            <i class="iconfont">&#xeba8;</i>
        </a>
    </div>
    <div id="chart4" class="charts"></div>

    <script type="text/javascript">
        var myChart4 = echarts.init(document.getElementById('chart4'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option4 = {
                title: {
                    text: '',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c}'
                },
                legend: {
                    left: 'left',
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
        setInterval(function () {//把option.series[0].data[0].value的值使用random()方法获取一个随机数
            option4.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
            myChart4.setOption(option4, true);
        }, 2000);
        myChart4.setOption(option4);
        window.addEventListener("resize", function () {
            myChart4.resize();
        });
    </script>

</div>




<div class="infolist1">

    <div class="infoboxleft">
        <div class="boxtitle">
            <span>客户分类产品统计</span>
            <a href="qc_dm_data_number.jsp" target="_self">更多
                <i class="iconfont">&#xeba8;</i>
            </a>
        </div>

        <div class="boxdown">
            <table class="simpletable">

                <thead>
                    <th>模板号</th>
                    <th>总盘数</th>
                    <th>生产时间</th>
                    <th>客户名</th>
                    <th>操作</th>
                </thead>

                <tbody>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="#" class="selected" id="">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>

                    <tr>
                        <td>ct-80</td>
                        <td>320</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td>
                            <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont"></i>导出</a>
                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="add">
                                <i class="toolico iconfont">&#xe970;</i>查看</a>

                        </td>
                    </tr>


                </tbody>

            </table>
        </div>

    </div>
</div>

<div class="chartbox4">
    <div class="boxtitle">
        <span>当日客户产量占比图</span>
        <a href="#">更多
            <i class="iconfont">&#xeba8;</i>
        </a>
    </div>
    <div id="chart5" class="charts"></div>

    <script type="text/javascript">
        var myChart5 = echarts.init(document.getElementById('chart5'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option5 =  {
                title: {
                    text: '',
                    subtext: '',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['张XX', '王XX', '李XX', '赵XX', '黄XX']
                },
                series: [
                    {
                        name: '占比总量',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: [
                            { value: 335, name: '张XX' },
                            { value: 310, name: '王XX' },
                            { value: 234, name: '李XX' },
                            { value: 135, name: '赵XX' },
                            { value: 1548, name: '黄XX' }
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
        setInterval(function () {//把option.series[0].data[0].value的值使用random()方法获取一个随机数
            option5.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
            myChart5.setOption(option5, true);
        }, 2000);
        myChart5.setOption(option5);
        window.addEventListener("resize", function () {
            myChart5.resize();
        });
    </script>

</div>

</div>


</body>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/skin.js"></script>
</html>
