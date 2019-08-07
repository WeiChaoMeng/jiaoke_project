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
</head>

<body>
<div id="ct-current" style="background: url('../../../static/images/milieu/blue.jpg');position: fixed">
    <div class="container">

        <p id="txt-pub-time">中央气象台 13:40发布</p>

        <div id="ct-main">
            <p id="txt-temperature">13°</p>
            <p id="txt-name">晴</p>
            <ul id="ls-warning"></ul>
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

    <div class="container" style="margin-bottom: 35px">

        <div id="ct-7-days">
            <h2 id="title">7日天气预报</h2>
            <div id="ct-weather" class="box-content">
                <ol id="ls-weather-day" class="ls-weather">
                    <li class="item first" style="width: 92px">
                        <p class="day">昨天</p>
                        <p class="date">11月07日</p>
                        <div class="ct-daytime">
                            <img class="icon" src="../../../static/images/wether/day40/00.png">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="../../../static/images/wether/day40/00.png">
                            <p class="weather">晴</p>
                        </div>
                        <p class="wind">西南风 3级</p>
                    </li>
                </ol>
            </div>
        </div>

        <div id="ct-living-index">
            <h2 id="air-quality">空气质量</h2>
            <div id="ct-pages">
                <div id="ct-content">

                    <ul id="ls-living1" class="page">
                        <%--空气质量--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/AQI.png"
                                     style="margin-bottom: 20px;text-align: center" title="空气质量">
                                <p class="content" id="AQI">轻度污染</p>
                            </div>
                        </li>

                        <%--空气质量指数--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/AQIzhishu.png"
                                     style="margin-bottom: 20px;text-align: center" title="空气质量指数">
                                <p class="content" id="AQIIndex">85</p>
                            </div>
                        </li>

                        <%--PM2.5--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/pm.png"
                                     style="margin-bottom: 20px;text-align: center" title="PM2.5指数(ug/m3)">
                                <p class="content" id="PM25">91</p>
                            </div>
                        </li>

                        <%--PM10--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/pm10.png"
                                     style="margin-bottom: 20px;text-align: center" title="PM10(ug/m3)">
                                <p class="content" id="PM10">136</p>
                            </div>
                        </li>
                    </ul>

                    <ul id="ls-living2" class="page">
                        <%--CO--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/co.png"
                                     style="margin-bottom: 20px;text-align: center" title="一氧化碳(mg/m3)">
                                <p class="content" id="CO">1.0</p>
                            </div>
                        </li>

                        <%--NO2--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/no.png"
                                     style="margin-bottom: 20px;text-align: center;padding: 11px 0" title="二氧化氮(ug/m3)">
                                <p class="content" id="NO2">84</p>
                            </div>
                        </li>

                        <%--O3--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/o.png"
                                     style="margin-bottom: 20px;text-align: center;padding: 11px 0" title="臭氧(ug/m3)">
                                <p class="content" id="O3">16</p>
                            </div>
                        </li>

                        <%--SO2--%>
                        <li class="item odd">
                            <div class="ct-sub">
                                <img src="../../../static/images/wether/aqi/so.png"
                                     style="margin-bottom: 20px;text-align: center;padding: 11px 0" title="二氧化硫(ug/m3)">
                                <p class="content" id="SO2">12</p>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../../../static/js/jquery.min.js"></script>
<script>
    $(function () {
        $.ajax({
            type: "get",
            url: '${path}/weatherReportByCity/weatherReport',
            error: function (request) {
                alert("error");
                console.log(request);
            },
            success: function (data) {
                var results = JSON.parse(data.weather);

                var abc = '';

                //天气
                for (var key in results) {
                    if (key === "result") {

                        //遍历result
                        for (var i in results[key]) {

                            //当前实况天气
                            if (i === "sk") {
                                $('#txt-pub-time').text('中央气象台 ' + results[key][i].time + '发布');
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

            }
        });
    })
</script>
</html>