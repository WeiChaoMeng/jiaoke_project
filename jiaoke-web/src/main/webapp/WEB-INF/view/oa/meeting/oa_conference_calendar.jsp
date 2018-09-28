<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会议日历</title>
    <link rel="stylesheet" href="../../../../static/css/calendar/style.css">
    <link rel="stylesheet" href="../../../../static/css/fold/bootstrap.min.css">
</head>
<body style="padding:15px 8px 0px 8px;" class="inner-container">

<div id="calendar">
    <header class="header">
        <ul>
            <li class="cur">月</li>
            <li>年</li>
        </ul>
    </header>
    <aside class="sidebar">
        <div class="wrapper">
            <div class="title">
                <span class="btn btn-prev"><</span>
                <span class="date">2017年9月</span>
                <span class="btn btn-next">></span>
            </div>
            <ul class="week">
                <li>日</li>
                <li>一</li>
                <li>二</li>
                <li>三</li>
                <li>四</li>
                <li>五</li>
                <li>六</li>
            </ul>
            <ul class="day"></ul>
        </div>
    </aside>
    <div class="container">
        <div id="renderMonth" class="render render-show">
            <h2 class="title">2017年9月</h2>
            <ul class="week">
                <li>周日</li>
                <li>周一</li>
                <li>周二</li>
                <li>周三</li>
                <li>周四</li>
                <li>周五</li>
                <li>周六</li>
            </ul>
            <ul class="day"></ul>
        </div>
        <div id="renderFullYear" class="render">
            <div class="title">
                <h2>2017年</h2>
                <p>
                    <span class="lunar-year"><i></i>丁酉鸡年</span>
                    <span class="info"><i></i>农历初一</span>
                </p>
            </div>
            <ul class="month"></ul>
        </div>
        <div id="control">
            <input type="button" value="<" class="btn btn-prev">
            <input type="button" value="今天" class="today">
            <input type="button" value=">" class="btn btn-next">
        </div>
        <div id="popup">
            <h3 class="title">七夕节</h3>
            <i class="arrow arrow-left"></i>
            <i class="arrow arrow-right"></i>
            <p class="date">2017年8月28日</p>
            <p class="lunar">丁酉鸡年</p>
        </div>
    </div>
    <div class="test"
         style="background-color: rgba(255, 255, 255, .9);width: 21.7%;height: 609px;float:  left;border-left: solid 1px #d4dad3;border-right: solid 1px #d4dad3;">
        <div class="ooo">
            <div style="width: 100%;padding: 25.5px;text-align: center;font-size: 20px;font-weight: 500;border-bottom: solid 1px #c9c7cd;">
                <span>会议详情</span>
            </div>

            <!--  折叠菜单start -->
            <div class="panel-group" id="accordion" style="display: none;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">
                                中心组第十四次扩大学习
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">开始时间:</span>
                            <p style="display: inline-block;margin-left: 10px">2018-06-06 10:00:00</p>
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">结束时间:</span>
                            <p style="display: inline-block;margin-left: 10px">2018-06-06 12:00:00</p>
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">会议室:</span>
                            <p style="display: inline-block;margin-left: 10px">201</p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">
                                2018年中心组第十四次扩大学习的通知
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">开始时间:</span>
                            <p style="display: inline-block;margin-left: 10px">2018-06-08 13:00:00</p>
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">结束时间:</span>
                            <p style="display: inline-block;margin-left: 10px">2018-06-08 15:00:00</p>
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">会议室:</span>
                            <p style="display: inline-block;margin-left: 10px">201</p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree">
                                关于进行内部控制专题讲座的通知
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">开始时间:</span>
                            <p style="display: inline-block;margin-left: 10px">2018-06-08 16:00:00</p>
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">结束时间:</span>
                            <p style="display: inline-block;margin-left: 10px">2018-06-08 17:00:00</p>
                            <span style="display: inline-block;width: 70px;text-align: right;background: #d6fffd">会议室:</span>
                            <p style="  display: inline-block;margin-left: 10px">201</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- end -->

        </div>
    </div>
</div>

<script src="../../../../static/js/fold/jquery.min.js"></script>
<script src="../../../../static/js/fold/bootstrap.min.js"></script>
<script src="../../../../static/js/calendar/tools.js"></script>
<script src="../../../../static/js/calendar/ChineseCalendar.js"></script>
<script src="../../../../static/js/calendar/calender.js"></script>

</body>
<script type="text/javascript">

    $(".meeting_mark").on("click",function () {
        $(".panel-group").css("display" ,"block");
    })
    
</script>
</html>