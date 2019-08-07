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
    <title>劳动合同签订、续订、变更、终止审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActLaborContractRenewal.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActLaborContractRenewal.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActLaborContractRenewal.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActLaborContractRenewal.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActLaborContractRenewal.annex}" delims="," var="annex">
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

<div>
    <div class="notice-content">
        <input type="text" class="notice-personnel-field" value="${oaActLaborContractRenewal.name}" readonly>与我公司签订的劳动合同将于
        <input class="agreement-start-end start-date" type="text" value="${oaActLaborContractRenewal.startDateStr}" readonly>到期，请各部门（领导）于
        <input class="agreement-start-end end-date" type="text" value="${oaActLaborContractRenewal.endDateStr}" readonly>前签署意见。
    </div>
</div>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">总经理意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly></textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly></textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly></textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly></textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" readonly>
            </div>
        </td>
    </tr>
    </tbody>
</table>

<div class="form-but" id="return">
    <button type="button" class="return-but" onclick="previousPage()">返回</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
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

