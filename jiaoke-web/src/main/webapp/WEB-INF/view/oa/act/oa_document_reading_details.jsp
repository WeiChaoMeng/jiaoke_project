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
    <title>收文阅办审批单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .input-radio-div{
            width: 100px;display: inline-block;text-align: center;
        }
        .radio-style{
            vertical-align: middle;outline: none;
            zoom: 120%;
        }
        .deadline-select{
            line-height: 30px;margin-top: 8px;width: 25%;display: inline-block;float: right
        }

        .dep-radio{
            line-height: 30px;margin-top: 8px;width: 75%;display: inline-block;
        }

        .handling-result-div{
            border-top: 1px solid #eaeaea;width: 100%;display: inline-block;margin-top: 10px;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActRead.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRead.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRead.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRead.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRead.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}</span>
                                <input type="hidden" value="${annex}">
                                <a class="table-file-download icon"
                                   href="javascript:location.href=encodeURI('/fileDownloadHandle/download?fileName=${annex}')"
                                   title="下载">&#xebda;</a>
                            </div>
                        </div>
                    </c:forTokens>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>

<div>
    <span class="fill-in-date" style="min-width: 130px;float: left">${oaActRead.departmentNumbering}</span>

    <span class="form-number-left" style="min-width: 130px;float: right">编号 ${oaActRead.numbering}</span>
</div>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">来文机关</td>
        <td class="table-td-content" style="width: 314px;">
            ${oaActRead.organ}
        </td>

        <td class="tdLabel">来文字号</td>
        <td class="table-td-content">
            ${oaActRead.fontSize}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">份数</td>
        <td class="table-td-content">
            ${oaActRead.copies}
        </td>

        <td class="tdLabel">收文日期</td>
        <td class="table-td-content">
            ${oaActRead.receiptTime}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">文件标题</td>
        <td colspan="3" class="table-td-content" style="padding: 10px">
            ${oaActRead.fileTitle}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">拟办意见</td>
        <td colspan="3" class="table-td-content" style="padding: 10px;height: 60px">
            <textarea class="approval-content-textarea"
                      readonly>${oaActRead.receiptProposedContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text"
                       value="${oaActRead.receiptProposedDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text"
                       value="${oaActRead.receiptProposed}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">部门意见</td>
        <td colspan="5" class="approval-content">
            <c:forEach items="${commentsList}" var="comments">
                <div class="comment-container" style="padding: 5px 0;">
                    <div class="comment-style">
                        <span class="comment-name">${comments.userName}</span>
                        <span class="comment-message">${comments.message}</span>
                        <span class="comment-date">${comments.timeStr}</span>
                    </div>
                </div>
            </c:forEach>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">领导批示</td>
        <td colspan="3" class="table-td-content" style="padding: 10px;height: 60px">
            <textarea class="approval-content-textarea"
                      readonly>${oaActRead.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text"
                       value="${oaActRead.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text"
                       value="${oaActRead.companyPrincipal}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">办理结果</td>
        <td colspan="3" class="table-td-content" style="padding: 10px;height: 60px">
            <textarea class="approval-content-textarea"
                      readonly>${oaActRead.outcomeContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text"
                       value="${oaActRead.outcomeDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text"
                       value="${oaActRead.outcome}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">保存期限</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActRead.deadline}</textarea>
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
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