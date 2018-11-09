<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>测试天气</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/nav.css">
    <style>
        .nav-mini.nav .nav-item ul {
            background-color: #fff;
        }

        .nav-item a img {
            width: 25px;
            padding: 5px 0
        }

        .nav a{
            padding-left: 16px;
        }
    </style>
</head>
<body>
<div class="nav nav-mini" style="background: #fff;position: fixed;">
    <div class="nav-top">
        <div id="mini" style="border-bottom: 2px #fff solid;">
            <img style="padding: 3.5px 13px" src="../../../static/images/milieu/menu.png">
        </div>
    </div>
    <ul>
        <li class="nav-item">
            <a id="circumstanceIndex">
                <img src="../../../static/images/milieu/index1.png">
                <span style="margin-left: 10px;position: absolute;font-size: 13px;">首页</span>
            </a>
        </li>
        <li class="nav-item">
            <a><img src="../../../static/images/milieu/realTime.png">
                <span style="margin-left: 10px;position: absolute;font-size: 13px;">实时数据</span>
            </a>
            <ul>
                <li><a id="data_analysis"><span>数据分析</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><img src="../../../static/images/milieu/history1.png">
                <span style="margin-left: 10px;position: absolute;font-size: 13px;">历史数据</span>
            </a>
            <ul>
                <li><a id="circumstance"><span>环境监测</span></a></li>
            </ul>
        </li>
    </ul>
</div>
<div class="rightdown"
     style="float:right;width:96%;transition: width 2s;-moz-transition: width 2s; -webkit-transition: width 0.3s;-o-transition: width 2s;">
    <iframe src="weatherIndex.do" id="iframe" name="right" width="100%" height="100%" frameborder="0"
            scrolling="auto" style="min-height: 750px;"></iframe>
</div>
</body>
<script src="../../../static/js/jquery.min.js"></script>
<script>
    $(function () {
        // nav收缩展开
        $('.nav-item>a').on('click', function () {
            if (!$('.nav').hasClass('nav-mini')) {
                if ($(this).next().css('display') == "none") {
                    //展开未展开
                    $('.nav-item').children('ul').slideUp(300);
                    $(this).next('ul').slideDown(300);
                    $(this).parent('li').addClass('nav-show').siblings('li').removeClass('nav-show');
                } else {
                    //收缩已展开
                    $(this).next('ul').slideUp(300);
                    $('.nav-item.nav-show').removeClass('nav-show');
                }
            }
        });
        //nav-mini切换
        $('#mini').on('click', function () {
            if (!$('.nav').hasClass('nav-mini')) {
                $('.nav-item.nav-show').removeClass('nav-show');
                $('.nav-item').children('ul').removeAttr('style');
                $('.nav').addClass('nav-mini');
                $(".rightdown").css("width", "96%");
            } else {
                $('.nav').removeClass('nav-mini');
                $(".rightdown").css("width", "88%");
            }
        });
    });

    $("#data_analysis").on("click", function () {
        $('#iframe').attr("src", "realTimeData.do");
    });

    $("#circumstance").on("click", function () {
        $('#iframe').attr("src", "circumstance.do");
    });

    $("#circumstanceIndex").on("click", function () {
        $('#iframe').attr("src", "weatherIndex.do");
    });

    /*$(function () {
        $.ajax({
            type: "get",
            url: 'http://v.juhe.cn/weather/index?cityname=11&dtype=json&format=1&key=0c6ea6e224f4d60cca9337736baeff9d',
            dataType:'jsonp',
            error: function (request) {
                alert("error");
                console.log(request);
            },
            success: function (data) {
                if (data.resultcode === "200"){
                    $("#div").append("");
                    console.log(data.result.sk);
                }
            }
        });
    })*/
</script>
</html>