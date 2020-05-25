<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>职称（技术等级）评聘申请表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActEngage.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActEngage.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActEngage.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActEngage.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActEngage.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
                                <a class="table-file-download icon"
                                   href="/fileDownloadHandle/download?fileName=${annex}"
                                   title="下载">&#xebda;</a>
                            </div>
                        </div>
                    </c:forTokens>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>

<form id="oaActEngage">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">申请人姓名</td>
            <td class="table-td-content" id="personnelCensorContent">
                ${oaActEngage.applicant}
            </td>

            <td class="tdLabel">所在部门及岗位</td>
            <td class="table-td-content">
                ${oaActEngage.department}
                <input type="hidden" name="id" value="${oaActEngage.id}">
                <input type="hidden" name="promoter" value="${oaActEngage.promoter}">
                <input type="hidden" name="departmentPrincipal" value="${oaActEngage.departmentPrincipal}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">
                <span style="display: block;line-height: 20px;font-size: 13px;">拟评聘职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
            </td>
            <td class="table-td-content">
                ${oaActEngage.undoutedly}
            </td>

            <td class="tdLabel">考试时间</td>
            <td class="table-td-content">
                ${oaActEngage.examTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">证书取得时间</td>
            <td class="table-td-content">
                ${oaActEngage.certificate}
            </td>

            <td class="tdLabel">本人签字</td>
            <td class="table-td-content">
                ${oaActEngage.signature}
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;width: 50%">部门负责人意见</td>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">部门主管意见</td>
        </tr>

        <tr>
            <td colspan="2" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal" style="width: 100%">
                    <textarea class="opinion-column-Juxtaposition" readonly>${oaActEngage.principalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActEngage.principalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActEngage.principal}" readonly>
                    </div>
                </div>
            </td>

            <td colspan="2" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-supervisor" style="width: 100%">
                    <textarea class="opinion-column-Juxtaposition" readonly>${oaActEngage.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActEngage.supervisorDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActEngage.supervisor}" readonly>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">人事主管意见</td>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">总经理意见</td>
        </tr>

        <tr>
            <td colspan="2" class="approval-content">
                <textarea class="approval-content-textarea" readonly>${oaActEngage.personnelContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEngage.personnelDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEngage.personnel}" readonly>
                </div>
            </td>

            <td colspan="2" class="approval-content">
                <textarea class="approval-content-textarea" readonly>${oaActEngage.companyPrincipalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEngage.companyPrincipalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEngage.companyPrincipal}" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="4" style="text-align: left;text-indent: 20px;">评聘小组意见</td>
        </tr>

        <tr>
            <td colspan="4" class="approval-content" style="padding: 10px">
                <c:choose>
                    <c:when test="${commentsListSize == 0}">
                        <textarea class="approval-content-textarea" readonly></textarea>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${commentsList}" var="comments">
                            <div class="comment-container" style="padding: 5px 0;">
                                <div class="comment-style">
                                    <span class="comment-name">${comments.userName}</span>
                                    <span class="comment-message">${comments.message}</span>
                                    <span class="comment-date">${comments.timeStr}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="padding: 10px;">
                <span style="display: block;line-height: 20px;font-size: 13px;">聘用职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
            </td>
            <td class="table-td-content">
                ${oaActEngage.rankName}
            </td>

            <td class="tdLabel" style="padding: 10px;">
                <span style="display: block;line-height: 20px;font-size: 13px;">享受职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）津贴时间</span>
            </td>
            <td class="table-td-content">
                ${oaActEngage.rankAllowance}
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div id="processingOpinionContent">
    <div class="handle-title" style="background: #2ca4f9;color: #ffffff;">
        <div class="handle-title-script">处理意见</div>
    </div>
    <textarea id="processingOpinion" oninput="value=value.replace(/\s+/g,'')" class="opinion-column" style="height: 72px;width: 100%;margin-bottom: 20px"></textarea>
</div>

<div class="form-but" id="return">
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        var processingOpinion = $('#processingOpinion').val();
        if (processingOpinion === undefined){
            processingOpinion = "";
        }

        $.ajax({
            type: "post",
            url: '/engage/approvalSubmit',
            data: $('#oaActEngage').serialize() + "&processingOpinion=" + processingOpinion + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    <%--window.location.href = '${path}/oaHomePage/toOaHomePage';--%>
                    window.history.back();
                    layer.msg('提交成功！');
                } else if (data === 'backSuccess') {
                    <%--window.location.href = '${path}/oaHomePage/toOaHomePage';--%>
                    window.history.back();
                    window.top.tips("提交成功,并将数据转存到待发事项中！", 6, 1, 2000);
                } else {
                    layer.msg('提交失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //打印
    function printContent() {
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#return').show();
        $('#body').css('width', '70%');
    }
</script>
</html>

