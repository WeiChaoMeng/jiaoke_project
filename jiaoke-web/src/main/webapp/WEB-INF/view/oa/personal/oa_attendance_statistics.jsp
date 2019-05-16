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

<div class="attendance-list" style="min-width: 3200px">

    <table class="attendance-user-content">
        <thead>
        <tr>
            <th style="width: 90px">姓名</th>
            <th style="width: 90px">部门</th>
            <th style="width: 120px">工号</th>
            <th style="width: 120px">职位</th>
            <c:forEach items="${punchRecordList}" var="punchRecord">
                <th style="width: 90px">
                    <span>
                        <div class="date_header">
                            <div class="date_header_item_week">${punchRecord.week}</div>
                            <div class="date_header_item_date">${punchRecord.day}</div>
                        </div>
                    </span>
                </th>
            </c:forEach>
        </tr>
        </thead>

        <tbody id="attendanceDetails">
        <c:choose>
            <c:when test="${dingDingAttendance == null}">
                <td colspan="4">暂无数据</td>
            </c:when>
            <c:otherwise>
                <tr>
                    <td>${dingDingAttendance.name}</td>
                    <td>${dingDingAttendance.departmentName}</td>
                    <td>${dingDingAttendance.jobnumber}</td>
                    <td>${dingDingAttendance.position}</td>
                    <c:forEach items="${punchRecordList}" var="punchRecord">
                        <td>
                            <c:forEach items="${punchTimeList}" var="punchTime">
                                <c:choose>
                                    <c:when test="${punchRecord.createTimeStr == punchTime.createTimeStr}">
                                        <div>${punchTime.time}</div>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
</html>
