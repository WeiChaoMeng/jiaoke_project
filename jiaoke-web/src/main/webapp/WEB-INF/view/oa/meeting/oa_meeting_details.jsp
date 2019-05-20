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
    <title>会议详情</title>
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

    <div style="margin: 20px 0;">
        <div style="width: 100%;background: #afdbef;height: 40px;">
            <div style="font-size: 14px;padding-left: 10px;line-height: 40px;border: 1px #b3b3b3 solid;border-bottom: none;">
                处理意见
            </div>
        </div>

        <textarea name="" id="processingOpinion" class="opinion-column"></textarea>

        <div class="form-but" style="margin-top: 20px;">
            <button type="button" class="return-but" onclick="previousPage()">返回</button>
            <button type="button" class="commit-but" onclick="commit()">提交</button>
        </div>
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
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script type="text/javascript">
    //记录当前页
    var page = JSON.parse('${currentPage}');
    //流程实例Id
    var processInstanceId = JSON.parse('${processInstanceId}');
    //任务Id
    var taskId = JSON.parse('${taskId}');

    //返回上一页
    function previousPage() {
        window.location.href = '${path}/meeting/toPendingMeeting?page=' + page;
    }

    //提交
    function commit() {
        var processingOpinion = $('#processingOpinion').val();
        $.ajax({
            type: "post",
            url: '/meeting/commitMeeting',
            data: {
                'page': page,
                'processInstanceId': processInstanceId,
                'processingOpinion': processingOpinion,
                'taskId': taskId
            },
            async: false,
            success: function (data) {
                if (data === 'success') {
                    window.location.href = '${path}/meeting/toPendingMeeting?page=' + page;
                    layer.msg('提交成功！');
                } else {
                    layer.msg('提交失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

</script>
</html>