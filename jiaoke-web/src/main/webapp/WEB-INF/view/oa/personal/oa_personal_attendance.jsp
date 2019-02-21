<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
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
                <th class="" style="width: 111px;height: 53px;">
                    <span>
                        <div style="text-align: center;">姓名</div>
                    </span>
                </th>
                <th class=""><span><div style="text-align: center;">部门</div></span></th>
                <th class=""><span><div style="text-align: center;">工号</div></span></th>
                <th class=""><span><div style="text-align: center;">职位</div></span></th>
                <%--<c:forEach items="${recordResultList}" var="recordResult">
                    <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">${"日一二三四五六".charAt(recordResult.workDate.getDay())}</div>
                            <div class="date_header_item_date">
                                <fmt:formatDate value="${recordResult.workDate}"
                                                pattern="dd"/>
                            </div>
                        </div>
                    </span>
                    </th>
                </c:forEach>--%>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week">三</div>
                            <div class="date_header_item_date">1</div>
                        </div>
                    </span>
                </th>

            </tr>
            </thead>

            <tbody id="attendanceDetails">

            <%--<c:forEach var="checkingAttendance" items="${oaCheckingAttendanceList}">
                <tr class="tr">
                    <td>${checkingAttendance.userName}</td>
                    <td>${checkingAttendance.department}</td>
                    <td>${checkingAttendance.jobnumber}</td>
                    <td>${checkingAttendance.position}</td>
                    <td>
                        <c:forEach items="${recordResultList}" var="recordResult">
                            <c:choose>
                                <c:when test="${checkingAttendance.userId == recordResult.userId}">
                                    <div><fmt:formatDate value="${recordResult.userCheckTime}"
                                                         pattern="HH:mm:ss"/></div>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>--%>
            <%--<tr class="tr">
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
            </tr>--%>
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
                    <tbody id="staffName">
                    <%--<c:forEach var="checkingAttendance" items="${oaCheckingAttendanceList}">
                        <tr>
                            <td class="">
                                <span></span>
                                <div style="text-align: center;">
                                    <div>${checkingAttendance.userName}</div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>--%>
                    <%--<tr>
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
                    </tr>--%>
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
        $.ajax({
            type: "POST",
            url: '${path}/personalAttendance/attendanceDetails',
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (resultJson) {
                console.log(JSON.parse(resultJson));
                var result = JSON.parse(resultJson);
                var attendanceDetails = '';
                var attendanceName = '';
                for (var key in result) {
                    if (key === "list") {
                        for (var i = 0; i < result[key].length; i++) {
                            attendanceDetails += '<tr class="tr">';
                            attendanceDetails += '<td>' + result[key][i].userName + '</td>';
                            attendanceDetails += '<td>' + result[key][i].department + '</td>';
                            attendanceDetails += '<td>' + result[key][i].jobnumber + '</td>';
                            attendanceDetails += '<td>' + result[key][i].position + '</td>';
                            attendanceDetails += '</tr>';

                            //左边固定姓名栏
                            attendanceName += '<tr>';
                            attendanceName += '<td class="">';
                            attendanceName += '<span></span>';
                            attendanceName += '<div style="text-align: center;">';
                            attendanceName += '<div>' + result[key][i].userName + '</div>';
                            attendanceName += '</div>';
                            attendanceName += '</td>';
                            attendanceName += '</tr>';
                        }
                    } else {
                        for (var j = 0; j < result[key].length; j++) {

                        }
                    }
                }
                $("#attendanceDetails").html(attendanceDetails);
                $("#staffName").html(attendanceName);
            }
        })
    });

    window.onload = function () {
        /* let trNum =  $('#attendanceDetails').find('.tr').length;
         for (let i = 0; i < trNum; i++) {
             alert($('#attendanceDetails').find('.tr').outerHeight());
         }*/
        /*$("#attendanceDetails tr").each(function () {
            var external = $(this);
            $("#staffName tr").each(function () {
                var inside = $(this);
                inside.css('height',external.outerHeight());
            })
        });*/

        let trNum = $('#attendanceDetails').find('.tr').length;
        for (let i = 0; i < trNum; i++) {
            var height = $('#attendanceDetails tr').eq(i).height();
            $('#staffName tr').eq(i).css('height', height);
        }
    };

</script>
</html>
