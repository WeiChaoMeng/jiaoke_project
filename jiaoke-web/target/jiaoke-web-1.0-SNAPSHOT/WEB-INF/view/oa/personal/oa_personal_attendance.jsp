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
    <title>考勤统计</title>
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
                <col style="width: 145px; min-width: 145px;">
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
                <th class="">
                    <span>
                        <div style="text-align: center;">姓名</div>
                    </span>
                </th>
                <th class=""><span><div style="text-align: center;">部门</div></span></th>
                <th class=""><span><div style="text-align: center;">工号</div></span></th>
                <th class=""><span><div style="text-align: center;">职位</div></span></th>
                <th class="">
                    <span>
                        <div class="date_header_item">
                            <div class="date_header_item_week" id="week"></div>
                            <div class="date_header_item_date" id="day"></div>
                        </div>
                    </span>
                </th>
            </tr>
            </thead>
        </table>

        <table class="attendance-list-content" style="margin: 0">
            <colgroup>
                <col style="width: 120px; min-width: 120px;">
                <col style="width: 200px;min-width: 200px;">
                <col style="width: 145px; min-width: 145px;">
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
            <tbody id="attendanceDetails">

            <c:forEach var="checkingAttendance" items="${oaCheckingAttendanceList}">
                <tr class="tr">
                    <td>${checkingAttendance.userName}</td>
                    <td>${checkingAttendance.department}</td>
                    <td>${checkingAttendance.jobnumber}</td>
                    <td>${checkingAttendance.position}</td>
                    <td>
                        <c:forEach items="${checkingAttendance.recordresult}" var="recordResult">
                            <div>${recordResult}</div>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

    <!--表左边固定-->
    <%--<div class="table-fixed-left">
        <div class="ant-table-header">
            <table class="ant-table-fixed">
                <colgroup>
                    <col style="width: 120px; min-width: 120px;">
                </colgroup>
                <thead class="ant-table-thead">
                <tr style="height: 57px">
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
                    <c:forEach var="checkingAttendance" items="${oaCheckingAttendanceList}">
                        <tr>
                            <td class="">
                                <span></span>
                                <div style="text-align: center;">
                                    <div>${checkingAttendance.userName}</div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>--%>

</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script>
    //同步姓名栏tr高度
    $(function () {
        var attendanceList = $('#attendanceDetails').children('tr');
        var staffNameList = $('#staffName').children('tr');
        for (var i = 0; i < attendanceList.length; i++) {
            if (i !== 0) {
                staffNameList.eq(i).css('height', attendanceList.eq(i)[0].getBoundingClientRect().height);
            } else {
                staffNameList.eq(i).css('height', attendanceList.eq(i)[0].getBoundingClientRect().height - 1);
            }
        }

        var date = new Date();
        var week = date.getDay();//获取存储当前日期
        var day = date.getDate();//获取存储当前日期
        var weekday = ["日", "一", "二", "三", "四", "五", "六"];
        $('#day').text(day);
        $('#week').text(weekday[week]);
    });
</script>
</html>
