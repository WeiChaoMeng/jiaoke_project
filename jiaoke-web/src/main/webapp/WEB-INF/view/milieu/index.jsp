<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>环保监控首页</title>
    <link type="text/css" rel="stylesheet" href="../../../static/css/oa/milieu_index.css">
    <script src="../../../static/js/echarts/echarts.js"></script>
</head>

<body>
<div id="ct-current" style="background: url('../../../static/images/milieu/blue.jpg');position: fixed">
    <div class="container">

        <p id="txt-pub-time">数据更新时间  <%=new SimpleDateFormat("yyyy年MM月dd日 HH:mm").format(new Date())%></p>

        <div id="ct-main">
            <p id="txt-temperature">13°</p>
            <p id="txt-name">晴</p>
        </div>

        <div id="ct-other">
            <p class="item">
                <img class="basic-data-icon" src="../../../static/images/wether/fengxiang.png">
                <span class="txt" id="txt-wind">西南风&nbsp;2级</span>
            </p>
            <p class="item">
                <img class="basic-data-icon" src="../../../static/images/wether/shidu.png">
                <span class="txt" id="txt-humidity">湿度&nbsp;35%</span>
            </p>
            <p class="item">
                <img class="basic-data-icon" src="../../../static/images/wether/taiyang.png">
                <span class="txt" id="txt-ultraviolet">紫外线&nbsp;强</span>
            </p>
        </div>

        <div id="ct-current-weather">
            <img class="icon" src="../../../static/images/wether/day120/00.png">
        </div>
    </div>

    <div class="container">

        <div id="ct-living-index">
            <div style="display: inline-block">
                <h2 id="air-quality"><%=new SimpleDateFormat("MM月dd日").format(new Date())%>空气质量</h2>
            </div>

            <div class="alone-data-style">
                <div class="alone-inner-style">
                    <p class="content" id="PM25" style="padding-top: 5px;">28</p>
                    <img src="../../../static/images/wether/aqi/PM2.5.png" title="PM2.5指数(ug/m3)">
                    <p class="content">PM2.5指数(ug/m3)</p>
                </div>

                <%--折线--%>
                <div style="height:100px;width:510px;display: inline-block;">
                    <div id="chart1" style="width: 100%;height: 100%;"></div>
                </div>
            </div>

            <div class="alone-data-style">
                <div class="alone-inner-style">
                    <p class="content" id="PM10" style="padding-top: 5px;">28</p>
                    <img src="../../../static/images/wether/aqi/pm10.png" title="PM10(ug/m3)">
                    <p class="content">PM10指数(ug/m3)</p>
                </div>

                <%--折线--%>
                <div style="height:100px;width: 510px;display: inline-block;">
                    <div id="chart2" style="width: 100%;height: 100%;"></div>
                </div>
            </div>

            <div id="ct-pages">
                <ul id="ls-living1" class="page">
                    <%--空气质量--%>
                    <li class="item odd">
                        <div class="ct-sub">
                            <p class="content" id="AQI">轻度污染</p>
                            <img src="../../../static/images/wether/aqi/AQI.png" style="width: 38px;padding: 5px;"
                                 title="空气质量">
                            <p class="content">空气质量</p>
                        </div>
                    </li>

                    <%--空气质量指数--%>
                    <li class="item odd">
                        <div class="ct-sub">
                            <p class="content" id="AQIIndex">85</p>
                            <img src="../../../static/images/wether/aqi/AQIzhishu.png" style="width: 38px;padding: 5px;"
                                 title="空气质量指数">
                            <p class="content">空气质量指数</p>
                        </div>
                    </li>

                    <%--CO--%>
                    <li class="item odd">
                        <div class="ct-sub">
                            <p class="content" id="CO">3</p>
                            <img src="../../../static/images/wether/aqi/co.png"
                                 title="一氧化碳(mg/m3)">
                            <p class="content">一氧化碳(mg/m3)</p>
                        </div>
                    </li>

                    <%--NO2--%>
                    <li class="item odd">
                        <div class="ct-sub">
                            <p class="content" id="NO2">8</p>
                            <img src="../../../static/images/wether/aqi/no.png" style="margin: 10px 0 10px 0;"
                                 title="二氧化氮(ug/m3)">
                            <p class="content">二氧化氮(ug/m3)</p>
                        </div>
                    </li>

                    <%--O3--%>
                    <li class="item odd">
                        <div class="ct-sub">
                            <p class="content" id="O3">20</p>
                            <img src="../../../static/images/wether/aqi/o.png" style="margin: 10px 0 10px 0;"
                                 title="臭氧(ug/m3)">
                            <p class="content">臭氧(ug/m3)</p>
                        </div>
                    </li>

                    <%--SO2--%>
                    <li class="item odd">
                        <div class="ct-sub">
                            <p class="content" id="SO2">1</p>
                            <img src="../../../static/images/wether/aqi/so.png" style="margin: 10px 0 10px 0;"
                                 title="二氧化硫(ug/m3)">
                            <p class="content">二氧化硫(ug/m3)</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div id="ct-7-days">
            <h2 id="title">7日天气预报</h2>
            <div id="ct-weather" class="box-content">
                <ol id="ls-weather-day" class="ls-weather">
                    <li class="item" style="width: 92px">
                        <p class="day">星期日</p>
                        <p class="date">09月01日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/00.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/night40/00.png">
                            <p class="weather">晴</p>
                        </div>
                        <p class="wind">微分 2级</p>
                    </li>

                    <li class="item" style="width: 92px">
                        <p class="day">星期一</p>
                        <p class="date">09月02日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/01.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/night40/04.png">
                            <p class="weather">多云转雷阵雨</p>
                        </div>
                        <p class="wind">南风 3级</p>
                    </li>

                    <li class="item" style="width: 92px">
                        <p class="day">星二</p>
                        <p class="date">09月03日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/04.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/night40/07.png">
                            <p class="weather">雷阵雨转中雨</p>
                        </div>
                        <p class="wind">西北风 3级</p>
                    </li>

                    <li class="item" style="width: 92px">
                        <p class="day">星期三</p>
                        <p class="date">09月04日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/07.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/night40/00.png">
                            <p class="weather">中雨转晴</p>
                        </div>
                        <p class="wind">微风 3级</p>
                    </li>

                    <li class="item" style="width: 92px">
                        <p class="day">星期四</p>
                        <p class="date">09月05日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/00.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/night40/00.png">
                            <p class="weather">晴</p>
                        </div>
                        <p class="wind">微风 3级</p>
                    </li>

                    <li class="item" style="width: 92px">
                        <p class="day">星期五</p>
                        <p class="date">09月06日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/00.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/night40/00.png">
                            <p class="weather">晴</p>
                        </div>
                        <p class="wind">西南风 2级</p>
                    </li>

                    <li class="item" style="width: 92px">
                        <p class="day">星期六</p>
                        <p class="date">09月07日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/00.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/night40/01.png">
                            <p class="weather">晴转多云</p>
                        </div>
                        <p class="wind">微风 2级</p>
                    </li>
                </ol>
            </div>
        </div>

    </div>
</div>

</body>
<script src="../../../static/js/jquery.min.js"></script>
<script type="text/javascript">

    //pm2.5
    var fineParticles = [];
    //pm10
    var pmios = [];

    var dates = [];

    $(function () {
        $.ajax({
            type: "get",
            url: '${path}/weatherReportByCity/weatherReport',
            // url: '',
            error: function (request) {
                alert("error");
            },
            success: function (data) {
                console.log(data.air);
                var date = new Date();
                var currentDate = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";

                var results = JSON.parse(data.weather);

                if (results.result !== null) {
                    var abc = '';

                    //天气
                    for (var key in results) {
                        if (key === "result") {

                            //遍历result
                            for (var i in results[key]) {

                                //当前实况天气
                                if (i === "sk") {

                                    $('#txt-pub-time').text('数据更新时间  ' + currentDate + " " + results[key][i].time);
                                    $('#txt-temperature').text(results[key][i].temp + '°');
                                    $('#txt-wind').text(results[key][i].wind_direction + ' ' + results[key][i].wind_strength);
                                    $('#txt-humidity').text('湿度 ' + results[key][i].humidity);

                                } else if (i === "today") {
                                    $('#txt-name').text(results[key][i].weather)
                                    $('#ct-current-weather img').attr('src', '../../../static/images/wether/day120/' + results[key][i].weather_id.fa + '.png');
                                    $('#txt-ultraviolet').text('紫外线强度 ' + results[key][i].uv_index);

                                    //未来7天气象
                                } else if (i === "future") {
                                    for (var j in results[key][i]) {

                                        abc += '<li class="item" style="width: 92px">';
                                        abc += '<p class="day">' + results[key][i][j].week + '</p>';
                                        abc += '<p class="date">' + results[key][i][j].date.slice(4, 6) + '月' + results[key][i][j].date.slice(6, 8) + '日</p>';
                                        abc += '<div class="ct-daytime">';
                                        abc += '<img class="icon" src="../../../static/images/wether/day40/' + results[key][i][j].weather_id.fa + '.png">';
                                        abc += '</div>';
                                        abc += '<div class="ct-night">';
                                        abc += '<img class="icon" src="../../../static/images/wether/night40/' + results[key][i][j].weather_id.fb + '.png">';
                                        abc += '<p class="weather">' + results[key][i][j].weather + '</p>';
                                        abc += '</div>';
                                        abc += '<p class="temperature-range">' + results[key][i][j].temperature + '</p>';
                                        abc += '<p class="wind">' + results[key][i][j].wind + '</p>';
                                        abc += '</li>'
                                    }
                                }
                            }
                        }
                    }
                }

                //空气质量
                $('#ls-weather-day').html(abc);

                var air = JSON.parse(data.air);
                for (var key in air) {
                    if (key === "result") {
                        for (var i in air[key]) {
                            $('#AQI').text(air[key][i].quality);
                            $('#AQIIndex').text(air[key][i].AQI);
                            $('#PM25').text(air[key][i]['PM2.5']);
                            $('#PM10').text(air[key][i].PM10);
                            $('#CO').text(air[key][i].CO);
                            $('#NO2').text(air[key][i].NO2);
                            $('#O3').text(air[key][i].O3);
                            $('#SO2').text(air[key][i].SO2);
                        }
                    }
                }

                var airQuality = data.airQualityList;
                for (var i = 0; i < airQuality.length; i++) {
                    pmios.push(airQuality[i].pmio);
                    fineParticles.push(airQuality[i].fineParticle);
                    dates.push(airQuality[i].updateDateStr);
                }

                var myChart = echarts.init(document.getElementById('chart1'));
                var myChart2 = echarts.init(document.getElementById('chart2'));

                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: 'PM2.5过去一周走势图',
                        x: 'left',
                        y: 'top',
                        textStyle: {
                            fontSize: 10,
                            color: "#afafb1"
                        }
                    },
                    xAxis: {
                        type: "category",
                        data: dates,
                        splitLine: {show: false},
                        axisLine: {show: false},
                        axisTick: {show: false},
                        axisLabel: {show: true}
                    },
                    yAxis: {
                        type: 'value',
                        splitLine: {show: false},
                        axisLine: {show: false},
                        axisTick: {show: false},
                        axisLabel: {show: false}
                    },
                    grid: {
                        x: 10,
                        y: 30,
                        x2: 10,
                        y2: 30
                    },
                    series: [{
                        data: fineParticles,
                        type: 'line',
                        symbol: 'circle',
                        symbolSize: 8,
                        itemStyle: {
                            normal: {
                                color: "#f68227",
                                lineStyle: {
                                    color: "#f68227"
                                },
                                label: {
                                    show: true,
                                    color: "#000"
                                }
                            }
                        }
                    }]
                };

                // 指定图表的配置项和数据
                var option1 = {
                    title: {
                        text: 'PM10过去一周走势图',
                        x: 'left',
                        y: 'top',
                        textStyle: {
                            fontSize: 10,
                            color: "#afafb1"
                        }
                    },
                    xAxis: {
                        type: "category",
                        data: dates,
                        splitLine: {show: false},
                        axisLine: {show: false},
                        axisTick: {show: false},
                        axisLabel: {show: true}
                    },
                    yAxis: {
                        type: 'value',
                        splitLine: {show: false},
                        axisLine: {show: false},
                        axisTick: {show: false},
                        axisLabel: {show: false}
                    },
                    grid: {
                        x: 10,
                        y: 30,
                        x2: 10,
                        y2: 30
                    },
                    series: [{
                        data: pmios,
                        type: 'line',
                        symbol: 'circle',
                        symbolSize: 8,
                        itemStyle: {
                            normal: {
                                color: "#f68227",
                                lineStyle: {
                                    color: "#f68227"
                                },
                                label: {
                                    show: true,
                                    color: "#000"
                                }
                            }
                        }
                    }]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                myChart2.setOption(option1);
                window.onresize = function () {
                    myChart.resize();
                    myChart2.resize();
                };
            }
        });
    });
</script>
</html>