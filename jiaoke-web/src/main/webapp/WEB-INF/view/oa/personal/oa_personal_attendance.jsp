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
    <title>个人考勤</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
</head>

<body style="padding:15px 8px 0 8px;">

<div class="personal-attendance">

    <!--导出-->
    <div class="derive-report">
        <table>
            <tbody>
            <tr>
                <td>
                    <ul class="tab-switch" id="tab">
                        <li><a href="javascript:;">导出报表</a></li>
                    </ul>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div id="rrr" class="attendance-list" onscroll="myFunction()">

        <table class="attendance-list-content" id="aaa">
            <colgroup>
                <col style="width: 120px; min-width: 120px;">
                <col style="width: 200px;min-width: 200px;">
                <col style="width: 140px; min-width: 140px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 90px; min-width: 90px;">
                <col style="width: 80px; min-width: 80px;">
                <col style="width: 80px; min-width: 80px;">
                <col style="width: 80px; min-width: 80px;">
                <col style="width: 80px; min-width: 80px;">
                <col style="width: 80px; min-width: 80px;">
                <col style="width: 80px; min-width: 80px;">
                <col style="width: 80px; min-width: 80px;">
                <col style="width: 80px; min-width: 80px;">
            </colgroup>
            <thead>
            <tr>
                <th class=""><span><div style="text-align: center;">姓名</div></span></th>
                <th class=""><span><div style="text-align: center;">部门</div></span></th>
                <th class=""><span><div style="text-align: center;">工号</div></span></th>
                <th class=""><span><div style="text-align: center;">职位</div></span></th>
                <th class=""><span><div style="text-align: center;">出勤天数</div></span></th>
                <th class=""><span><div style="text-align: center;">休息天数</div></span></th>
                <th class=""><span><div style="text-align: center;">工作时长</div></span></th>
                <th class=""><span><div style="text-align: center;">迟到次数</div></span></th>
                <th class=""><span><div style="text-align: center;">迟到时长</div></span></th>
                <th class=""><span><div style="text-align: center;">严重迟到次数</div></span></th>
                <th class=""><span><div style="text-align: center;">严重迟到时长</div></span></th>
                <th class=""><span><div style="text-align: center;">旷工迟到天数</div></span></th>
                <th class=""><span><div style="text-align: center;">早退次数</div></span></th>
                <th class=""><span><div style="text-align: center;">早退时长</div></span></th>
                <th class=""><span><div style="text-align: center;">上班缺卡次数</div></span></th>
                <th class=""><span><div style="text-align: center;">下班缺卡次数</div></span></th>
                <th class=""><span><div style="text-align: center;">旷工天数</div></span></th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">三</div>
                            <div class="date_header_item_date">1</div>
                        </div>
                    </span>
                </th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">四</div>
                            <div class="date_header_item_date">2</div>
                        </div>
                    </span>
                </th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">五</div>
                            <div class="date_header_item_date">3</div>
                        </div>
                    </span>
                </th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">六</div>
                            <div class="date_header_item_date">4</div>
                        </div>
                    </span>
                </th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">日</div>
                            <div class="date_header_item_date">5</div>
                        </div>
                    </span>
                </th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">一</div>
                            <div class="date_header_item_date">6</div>
                        </div>
                    </span>
                </th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">二</div>
                            <div class="date_header_item_date">7</div>
                        </div>
                    </span>
                </th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">三</div>
                            <div class="date_header_item_date">8</div>
                        </div>
                    </span>
                </th>

            </tr>
            </thead>

            <tbody>

            <tr></tr>
            <tr class="even">
            <tr class="tr">
                <td>张三</td>
                <td>生产经营部</td>
                <td>008</td>
                <td>施工管理</td>
                <td>20</td>
                <td>2</td>
                <td>0</td>
                <td>4</td>
                <td>32分钟</td>
                <td>1</td>
                <td>19分钟</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>1</td>
                <td>0</td>
                <td>0</td>
                <td>正常</td>
                <td>正常</td>
                <td>正常</td>
                <td>休息</td>
                <td>休息</td>
                <td>旷工</td>
                <td>正常</td>
                <td>正常</td>
                <td>正常</td>
            </tr>
            <tr class="tr">
                <td>张三</td>
                <td>运营部</td>
                <td>010</td>
                <td>工程师</td>
                <td>20</td>
                <td>2</td>
                <td>0</td>
                <td>4</td>
                <td>32分钟</td>
                <td>1</td>
                <td>19分钟</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>1</td>
                <td>0</td>
                <td>0</td>
                <td>正常</td>
                <td>正常</td>
                <td>正常</td>
                <td>休息</td>
                <td>休息</td>
                <td>旷工</td>
                <td>正常</td>
                <td>正常</td>
                <td>正常</td>
            </tr>
            </tbody>

        </table>
    </div>

    <!--表左边固定-->
    <div class="table-fixed-left">
        <div class="ant-table-header">
            <table class="ant-table-fixed">
                <colgroup>
                    <col style="width: 120px; min-width: 120px;">
                </colgroup>
                <thead class="ant-table-thead">
                <tr>
                    <th>
                        <span>
                            <div style="text-align: center;">姓名</div>
                        </span>
                    </th>
                </tr>
                </thead>
            </table>
        </div>

        <div class="ant-table-body-outer">
            <div class="ant-table-body-inner">
                <table class="ant-table-fixed">
                    <colgroup>
                        <col style="width: 120px; min-width: 120px;">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td class="">
                            <span></span>
                            <div style="text-align: center;">
                                <div>张三</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="">
                            <span></span>
                            <div style="text-align: center;">
                                <div>李四</div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script>
    /*列表中的日期*/
    $(function () {
        var time = new Date();
        var date = time.getDate();

        var show_day = new Array('日', '一', '二', '三', '四', '五', '六');
        var day = time.getDay();

        $("#aaa tr:first").append("<th class=''>" +
            "<span>" +
            "<div class='date_header_item'>" +
            "<div class='date_header_item_week'>" + show_day[day] + "</div>" +
            "<div class='date_header_item_date'>" + date + "</div>" +
            "</div>" +
            "</span>" +
            "</th>");
    });
</script>
</html>
