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
    <title>质量管理</title>
    <link href="../../css/default.css" rel="stylesheet" type="text/css">
    <link href="../../css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="../../js/echarts/echarts.js"></script>
    <script src="../../js/echarts/uimaker.js"></script>
</head>

<body style="padding:15px 8px 400px 8px;overflow-x: hidden;">

<div class="chartbox1">
    <div class="boxtitle"><span>本周产品用料统计</span></div>
    <div id="chart2" class="charts1"></div>
</div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('chart2'), 'uimaker');
    // 指定图表的配置项和数据
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },

        grid: {
            x: 60,
            x2: 40,
            y: 10,
            height: 200
        },

        calculable: true,
        xAxis: [
            {
                type: 'category',
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
                name: '骨料',
                type: 'bar',
                data: [320, 332, 301, 334, 390, 330, 320]
            },
            {
                name: '沥青',
                type: 'bar',
                stack: '广告',
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '碎石',
                type: 'bar',
                stack: '广告',
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '添加料',
                type: 'bar',
                stack: '广告',
                data: [150, 232, 201, 154, 190, 330, 410]
            },

        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option);
    window.addEventListener("resize", function () {
        myChart1.resize();
    });
</script>

<div class="divbox">

    <div class="boxleft">
        <div class="leftbox">
            <div class="boxtitle"><span>最新产品</span></div>

            <div class="boxdown">
                <table class="simpletable">

                    <thead>
                    <th>产品编号</th>
                    <th>产量)</th>
                    <th>生产时间</th>
                    <th>生产完成时间</th>
                    <th>生产人</th>
                    <th>操作</th>
                    </thead>

                    <tbody>

                    <tr>
                        <td>20171101</td>
                        <td>256</td>
                        <td>2017-11-01 16:35:26</td>
                        <td>2017-11-01</td>
                        <td>uimaker</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    <tr>
                        <td>20171102</td>
                        <td>300</td>
                        <td>2017-11-02 10:50:08</td>
                        <td>2017-11-02</td>
                        <td>admin</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    <tr>
                        <td>20171103</td>
                        <td>500</td>
                        <td>2017-11-03 00:00:14</td>
                        <td>2017-11-03</td>
                        <td>nanjing</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    <tr>
                        <td>20171104</td>
                        <td>1000</td>
                        <td>2017-11-04 16:22:00</td>
                        <td>2017-11-04</td>
                        <td>office</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    <tr>
                        <td>20171105</td>
                        <td>200</td>
                        <td>2017-11-05 04:00:00</td>
                        <td>2017-11-05</td>
                        <td>uimaker</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    <tr>
                        <td>20171106</td>
                        <td>150</td>
                        <td>2017-11-06 18:20:10</td>
                        <td>2017-11-06</td>
                        <td>guanliyuan</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    <tr>
                        <td>20171107</td>
                        <td>450</td>
                        <td>2017-11-07 08:34:00</td>
                        <td>2017-11-07</td>
                        <td>moodoc</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    <tr>
                        <td>20171108</td>
                        <td>500</td>
                        <td>2017-11-08 19:00:14</td>
                        <td>2017-11-08</td>
                        <td>iphonex</td>
                        <td><a href="#">查看</a></td>
                    </tr>

                    </tbody>

                </table>
            </div>

        </div>
    </div>

    <div class="boxright">
        <div class="rightbox">
            <div class="boxtitle"><span>产品报表</span></div>

            <ul class="textlist">
                <li><span></span><a href="#">一月沥青产品质量报表</a><i>11-10</i></li>
                <li><span></span><a href="#">二月沥青产品质量报表</a><i>11-09</i></li>
                <li><span></span><a href="#">三月沥青产品质量报表</a><i>11-08</i></li>
                <li><span></span><a href="#">四月沥青产品质量报表</a><i>11-07</i></li>
                <li><span></span><a href="#">五月沥青产品质量报表</a><i>11-06</i></li>
                <li><span></span><a href="#">六月沥青产品质量报表</a><i>11-05</i></li>
                <li><span></span><a href="#">七月沥青产品质量报表</a><i>11-04</i></li>
                <li><span></span><a href="#">八月沥青产品质量报表</a><i>11-03</i></li>
                <li><span></span><a href="#">九月沥青产品质量报表</a><i>11-02</i></li>
            </ul>

        </div>
    </div>
</div>


</body>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/skin.js"></script>
</html>
