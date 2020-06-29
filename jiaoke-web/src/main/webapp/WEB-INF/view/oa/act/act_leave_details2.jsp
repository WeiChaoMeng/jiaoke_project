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
    <title>请假审批表详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 65%">

<div class="table-title">
    <span>${oaActLeave.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActLeave.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActLeave.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActLeave.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActLeave.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title" title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}</span>
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

<div style="margin-top: 10px">
    <input type="text" class="filling-date-content" value="${oaActLeave.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content">
            ${oaActLeave.name}
        </td>

        <td class="tdLabel">申请时间</td>
        <td class="table-td-content">
            ${oaActLeave.applyDate}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">事由</td>
        <td colspan="5" class="table-td-evaluation">
            <textarea class="evaluation-content-disabled" style="height: 58px" readonly>${oaActLeave.reason}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期</label>
                <input class="approval-date-input" type="text" value="${oaActLeave.applicantSignatureDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">本人签字</label>
                <input class="approval-signature-input" type="text" value="${oaActLeave.applicantSignature}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">部门负责人</td>
        <div style="width: 49%;float: left">
            <td colspan="5" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActLeave.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActLeave.principalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActLeave.principal}" readonly>
                </div>
            </td>
        </div>

        <div style="width: 49%;float: right">
            <td colspan="5" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActLeave.principalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActLeave.principalDateT}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActLeave.principalT}" readonly>
                </div>
            </td>
        </div>
    </tr>

    <tr>
        <td class="tdLabel">主管领导</td>
        <td colspan="5" class="approval-content">
            <textarea readonly class="approval-content-textarea">${oaActLeave.supervisorContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期</label>
                <input class="approval-date-input" type="text" value="${oaActLeave.supervisorDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字</label>
                <input class="approval-signature-input" type="text" value="${oaActLeave.supervisor}" readonly>
            </div>
        </td>
    </tr>
    </tbody>
</table>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script"> 注：每周五上交</span>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //打印
    function printContent() {
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '65%');
    }
</script>
</html>

