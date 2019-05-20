<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>历史会议详情</title>
    <link href="../../../../static/css/oa/oa_meeting.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>${oaMeeting.name}</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td-width">发起人：</td>
            <td style="width: 16%" class="table-content">
                ${oaMeeting.promoter}
            </td>

            <td class="table-td-width">会议时间：</td>
            <td class="table-content">
                ${oaMeeting.startTimeStr}
                &nbsp;&nbsp;-&nbsp;&nbsp;
                ${oaMeeting.endTimeStr}
            </td>

            <td class="table-td-width">会议地点：</td>
            <td style="width: 16%" class="table-content">
                ${oaMeeting.place}
            </td>
        </tr>

        <tr>
            <td class="table-td-width">附件：</td>
            <td colspan="5" class="table-content">
                ${oaMeeting.attachment}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaMeeting.richText}
    </div>

    <div style="margin: 20px auto;height: auto;border: 1px #dedede solid;">
        <div style="width: 100%;background: #afdbef;height: 40px;">
            <div style="font-size: 14px;padding-left: 10px;line-height: 40px;">回执意见（共${commentsList.size()}条）</div>
        </div>

        <c:forEach items="${commentsList}" var="comments">
            <div style="height: 25px;padding: 10px;font-size: 13px;">
                <div style="width: 100%;height: 100%;line-height: 25px;background: #d8eef9;">
                    <span style="float: left;margin: 0 15px;width: 40px;">${comments.userName}</span>
                    <span style="float: left;margin: 0 15px;">${comments.message}</span>
                    <span style="float: left;margin: 0 15px;">${comments.timeStr}</span>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
</body>

<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript">
    //记录当前页
    var currentPageNum = JSON.parse('${currentPage}');

    //返回上一页
    function previousPage() {
        window.location.href = '${path}/meeting/toPendingMeeting?page=' + currentPageNum;
    }
</script>
</html>