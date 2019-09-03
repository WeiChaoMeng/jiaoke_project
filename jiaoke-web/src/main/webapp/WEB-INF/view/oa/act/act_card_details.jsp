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
    <title>饭卡申请单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="table-title">
    <span>${oaActCard.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActCard.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActCard.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActCard.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActCard.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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
<!-- -->
<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">申请人：</td>
        <td class="table-td-content">
            ${oaActCard.applicant}
        </td>

        <td class="tdLabel">申请时间：</td>
        <td class="table-td-content">
            ${oaActCard.applyTimeStr}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">所属单位：</td>
        <td colspan="3" class="table-td-content">
            ${oaActCard.company}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">事由：</td>
        <td colspan="3" class="table-td-content">
            ${oaActCard.reason}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">拟使用期限(开始)：</td>
        <td class="table-td-content">
            ${oaActCard.startTimeStr}
        </td>


        <td class="tdLabel">拟使用期限(结束)：</td>
        <td class="table-td-content">
            ${oaActCard.endTimeStr}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">关联部门负责人</td>
        <td colspan="5" class="approval-content">
            <textarea disabled="disabled" class="approval-content-textarea">${oaActCard.principalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" value="${oaActCard.principalDate}" disabled="disabled">
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" value="${oaActCard.principalSign}" disabled="disabled">
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">关联部门领导主管</td>
        <td colspan="5" class="approval-content">
            <textarea disabled="disabled" class="approval-content-textarea">${oaActCard.supervisorContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" value="${oaActCard.supervisorDate}" disabled="disabled">
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" value="${oaActCard.supervisorSign}" disabled="disabled">
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">主管部门负责人</td>
        <td colspan="5" class="approval-content">
            <textarea disabled="disabled" class="approval-content-textarea">${oaActCard.directorContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" value="${oaActCard.directorDate}" disabled="disabled">
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" value="${oaActCard.directorSign}" disabled="disabled">
            </div>
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //返回上一页
    function previousPage() {
        window.history.back();
    }

    //打印
    function printContent() {
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body,#return').css('width', '80%');
    }
</script>
</html>

