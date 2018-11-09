<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>环保监控首页</title>
</head>
<style>
    body, button, dd, div, dl, dt, form, h1, h2, h3, h4, h5, h6, input, li, ol, p, td, textarea, th, ul {
        padding: 0;
        margin: 0;
    }

    #ct-current {
        margin: 0;
        padding: 0;
        width: 100%;
        float: right;
        height: 100%
    }

    .container {
        width: 1200px;
        margin: 0 auto;
    }

    #ct-current #txt-pub-time {
        font-size: 14px;
        color: #fff;
        opacity: .6;
        height: 19px;
        line-height: 19px;
        margin: 20px 0;
    }

    #ct-current #ct-main {
        height: 86px;
        margin-bottom: 28px;
        vertical-align: bottom;
        font-size: 0;
    }

    #ct-current #ct-main #txt-temperature {
        display: inline-block;
        font-size: 86px;
        color: #fff;
        height: 86px;
        line-height: 86px;
        margin: 0;
        padding: 0;
    }

    #ct-current #ct-main #txt-name {
        display: inline-block;
        font-size: 28px;
        color: #fff;
        line-height: 45px;
        height: 45px;
        margin: 0;
        padding: 0;
    }

    #ct-current #ct-other {
        vertical-align: middle;
        font-size: 0;
        margin-bottom: 28px;
    }

    #ct-current #ct-other .txt {
        display: inline-block;
        font-size: 18px;
        vertical-align: middle;
    }

    #ct-current #ct-other .item {
        display: inline-block;
        margin-right: 42px;
        color: #fff;
        height: 20px;
        line-height: 20px;
        font-size: 0;
    }

    #ct-current #ct-current-weather {
        position: absolute;
        top: 50px;
        right: 150px;
        width: 134px;
        height: 134px;
    }

    #ct-current #ct-current-weather img {
        width: 134px;
        height: 134px;
    }

    #ct-7-days {
        float: left;
        width: 740px;
        height: 492px;
        padding: 20px 0 0;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0 0 14px 0 rgba(0, 0, 0, .08);
    }

    #ct-living-index {
        float: right;
        width: 430px;
        position: relative;
    }

    #ct-7-days #title {
        font-size: 18px;
        color: #344665;
        line-height: 25px;
        height: 25px;
        margin-bottom: 18px;
        margin-left: 30px;
    }

    #ct-7-days #ct-weather {
        overflow: hidden;
        position: relative;
    }

    #ct-7-days #chart-days {
        width: 740px;
        height: 174px;
        position: absolute;
        top: 145px;
    }

    #ct-7-days .item {
        width: 92px;
        text-align: center;
        float: left;
        background-repeat: no-repeat;
        background-position: right;
        position: relative;
        padding: 11px 0 25px;
        list-style-type: none;
    }

    #ct-7-days .item.first .day {
        color: #c2c2c2;
    }

    #ct-7-days .item .day {
        font-size: 14px;
        color: #384c78;
        margin-bottom: 12px;
        height: 14px;
        line-height: 14px;
    }

    #ct-7-days .item.first .date {
        color: #c2c2c2;
    }

    #ct-7-days .item .date {
        font-size: 12px;
        color: #8a9baf;
        margin-bottom: 30px;
        height: 12px;
        line-height: 12px;
    }

    #ct-7-days .item.first .weather {
        color: #c2c2c2;
    }

    #ct-7-days .item .weather {
        font-size: 14px;
        color: #384c78;
        line-height: 14px;
        height: 14px;
    }

    #ct-7-days .item.first .icon {
        opacity: .3;
    }

    #ct-7-days .item .icon {
        display: inline-block;
        height: 30px;
        width: 30px;
    }

    #ct-7-days .item .ct-night {
        margin-top: 174px;
        margin-bottom: 24px;
    }

    #ct-7-days .item.first .wind {
        color: #c2c2c2;
    }

    #ct-7-days .item .wind {
        font-size: 12px;
        color: #8a9baf;
        line-height: 12px;
        height: 12px;
    }

    #ct-living-index #ct-pages {
        clear: both;
        overflow: hidden;
        position: relative;
        width: 440px;
        height: 470px;
        margin-left: -5px;
        padding-top: 18px;
    }

    #ct-living-index #ct-pages .item {
        height: 140px;
        width: 200px;
        background: #fff;
        box-shadow: 0 0 14px 0 rgba(0, 0, 0, .08);
        border-radius: 10px;
        float: left;
        text-align: center;
        overflow: hidden;
        margin-bottom: 20px;
        margin-left: 10px;
    }

    #ct-living-index #ct-pages .ct-sub {
        height: 102px;
        width: 100%;
        padding-top: 38px;
    }

    #ct-living-index #ct-pages .page {
        float: left;
        width: 440px;
    }

    #ct-living-index #title {
        float: left;
        font-size: 18px;
        color: #344665;
        height: 21px;
        line-height: 21px;
        margin-bottom: 6px;
        margin-top: 6px;
    }

    #ct-living-index #ct-pages #ct-content {
        width: 890px;
    }

    #ct-living-index #ct-pages .item.odd {
        margin-right: 14px;
    }

    #ct-living-index #ct-pages .item {
        height: 140px;
        width: 200px;
        background: #fff;
        box-shadow: 0 0 14px 0 rgba(0, 0, 0, .08);
        border-radius: 10px;
        float: left;
        text-align: center;
        overflow: hidden;
        margin-bottom: 20px;
        margin-left: 10px;
    }

    #ct-living-index #ct-pages .icon {
        height: 34px;
        width: 34px;
        display: block;
        margin: 0 auto 12px;
    }

    #ct-living-index #ct-pages .content {
        font-size: 16px;
        color: #384c78;
        line-height: 22px;
    }

</style>
<body>
<div id="ct-current" style="background: url('../../../static/images/milieu/blue.jpg')">
    <div class="container">

        <p id="txt-pub-time">中央气象台 13:40发布</p>

        <div id="ct-main">
            <p id="txt-temperature">13°</p>
            <p id="txt-name">晴</p>
            <ul id="ls-warning"></ul>
        </div>

        <div id="ct-other">
            <p class="item">
                <i class="icon wind-5" id="icon-wind"></i>
                <span class="txt" id="txt-wind">西南风&nbsp;2级</span>
            </p>
            <p class="item">
                <i class="icon" id="icon-humidity"></i>
                <span class="txt" id="txt-humidity">湿度&nbsp;35%</span>
            </p>
            <p class="item">
                <i class="icon" id="icon-kPa"></i>
                <span class="txt" id="txt-kPa">气压&nbsp;1010hPa</span>
            </p>
            <p class="item show" id="info-limit">
                <i class="icon" id="icon-limit"></i>
                <span class="txt" id="txt-limit">限行&nbsp;5和0</span>
            </p>
        </div>

        <div id="ct-current-weather">
            <img class="icon" src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/currentweather/day/00.png">
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
                            <p class="weather">多云</p>
                            <img class="icon" src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/01.png"
                                 alt="多云" title="多云">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/01.png"
                                 alt="多云" title="多云">
                            <p class="weather">多云</p>
                        </div>
                        <p class="wind">西南风 3级</p>
                    </li>
                    <li class="item second" style="width: 92px">
                        <p class="day">今天</p>
                        <p class="date">11月08日</p>
                        <div class="ct-daytime">
                            <p class="weather">晴</p>
                            <img class="icon" src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/00.png"
                                 alt="晴" title="晴">
                        </div>
                        <div class="ct-night">
                            <img class="icon" src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/00.png"
                                 alt="晴" title="晴">
                            <p class="weather">晴</p>
                        </div>
                        <p class="wind">西北风 4级</p>
                    </li>
                    <li class="item" style="width: 92px"><p class="day">明天</p>
                        <p class="date">11月09日</p>
                        <div class="ct-daytime"><p class="weather">晴</p> <img class="icon"
                                                                              src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/00.png"
                                                                              alt="晴" title="晴"></div>
                        <div class="ct-night"><img class="icon"
                                                   src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/01.png"
                                                   alt="多云" title="多云">
                            <p class="weather">多云</p></div>
                        <p class="wind">北风 3级</p></li>
                    <li class="item" style="width: 92px"><p class="day">后天</p>
                        <p class="date">11月10日</p>
                        <div class="ct-daytime"><p class="weather">多云</p> <img class="icon"
                                                                               src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/01.png"
                                                                               alt="多云" title="多云"></div>
                        <div class="ct-night"><img class="icon"
                                                   src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/01.png"
                                                   alt="多云" title="多云">
                            <p class="weather">多云</p></div>
                        <p class="wind">北风 3级</p></li>
                    <li class="item" style="width: 92px"><p class="day">周日</p>
                        <p class="date">11月11日</p>
                        <div class="ct-daytime"><p class="weather">多云</p> <img class="icon"
                                                                               src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/01.png"
                                                                               alt="多云" title="多云"></div>
                        <div class="ct-night"><img class="icon"
                                                   src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/00.png"
                                                   alt="晴" title="晴">
                            <p class="weather">晴</p></div>
                        <p class="wind">北风 3级</p></li>
                    <li class="item" style="width: 92px"><p class="day">周一</p>
                        <p class="date">11月12日</p>
                        <div class="ct-daytime"><p class="weather">晴</p> <img class="icon"
                                                                              src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/00.png"
                                                                              alt="晴" title="晴"></div>
                        <div class="ct-night"><img class="icon"
                                                   src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/00.png"
                                                   alt="晴" title="晴">
                            <p class="weather">晴</p></div>
                        <p class="wind">北风 3级</p></li>
                    <li class="item" style="width: 92px"><p class="day">周二</p>
                        <p class="date">11月13日</p>
                        <div class="ct-daytime"><p class="weather">多云</p> <img class="icon"
                                                                               src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/01.png"
                                                                               alt="多云" title="多云"></div>
                        <div class="ct-night"><img class="icon"
                                                   src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/01.png"
                                                   alt="多云" title="多云">
                            <p class="weather">多云</p></div>
                        <p class="wind">东南风 3级</p></li>
                    <li class="item last" style="width: 92px"><p class="day">周三</p>
                        <p class="date">11月14日</p>
                        <div class="ct-daytime"><p class="weather">多云</p> <img class="icon"
                                                                               src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/day/01.png"
                                                                               alt="多云" title="多云"></div>
                        <div class="ct-night"><img class="icon"
                                                   src="//mat1.gtimg.com/pingjs/ext2020/weather/pc/icon/weather/night/02.png"
                                                   alt="阴" title="阴">
                            <p class="weather">阴</p></div>
                        <p class="wind">东北风 3级</p></li>
                </ol>
                <div id="chart-days" _echarts_instance_="ec_1541665980087"
                     style="-webkit-tap-highlight-color: transparent; user-select: none; background: rgba(0, 0, 0, 0);">
                    <div style="position: relative; overflow: hidden; width: 740px; height: 174px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
                        <canvas width="925" height="217" data-zr-dom-id="zr_0"
                                style="position: absolute; left: 0px; top: 0px; width: 740px; height: 174px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div id="ct-living-index">
            <h2 id="title">生活指数</h2>
            <div id="ct-pages">
                <div id="ct-content">
                    <ul id="ls-living1" class="page">
                        <li class="item odd">
                            <div class="ct-sub">
                                <i class="icon icon_chuanyi_jiaoleng"></i>
                                <p class="content">穿衣&nbsp;较冷</p>
                            </div>
                        </li>
                        <li class="item even">
                            <div class="ct-sub">
                                <i class="icon icon_yusan"></i>
                                <p class="content">雨伞&nbsp;不带伞</p>
                            </div>
                        </li>
                        <li class="item odd">
                            <div class="ct-sub">
                                <i class="icon icon_ganmao"></i>
                                <p class="content">感冒&nbsp;较易发</p>
                            </div>
                        </li>
                        <li class="item even">
                            <div class="ct-sub">
                                <i class="icon icon_xiche"></i>
                                <p class="content">洗车&nbsp;较适宜</p>
                            </div>
                        </li>
                        <li class="item odd">
                            <div class="ct-sub">
                                <i class="icon icon_yundong"></i>
                                <p class="content">运动&nbsp;较适宜</p>
                            </div>
                        </li>
                        <li class="item even">
                            <div class="ct-sub">
                                <i class="icon icon_fangsai"></i>
                                <p class="content">防晒&nbsp;中等</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>