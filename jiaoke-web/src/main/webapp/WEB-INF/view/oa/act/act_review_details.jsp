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
    <title>合同审查表详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActReview.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActReview.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActReview.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActReview.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActReview.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title" title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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

<span class="fill-in-date" style="min-width: 130px">编号  ${oaActReview.numbering}</span>

<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">合同名称</td>
        <td class="table-td-content" colspan="3">
            ${oaActReview.name}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">合同相对人</td>
        <td class="table-td-content" colspan="3">
            ${oaActReview.relative}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">合同金额</td>
        <td class="table-td-content" style="width: 340px;">
            ${oaActReview.amount}
        </td>

        <td class="tdLabel">合同编号</td>
        <td class="table-td-content">
            ${oaActReview.number}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">经办人</td>
        <td class="table-td-content">
            ${oaActReview.promoterStr}
        </td>

        <td class="tdLabel">部门负责人</td>
        <td class="table-td-content">
            ${oaActReview.principal}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">法务审查意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActReview.legalAffairsContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期</label>
                <input class="approval-date-input" type="text" value="${oaActReview.legalAffairsDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字</label>
                <input class="approval-signature-input" type="text" value="${oaActReview.legalAffairs}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">财务部门审查意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActReview.financeContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期</label>
                <input class="approval-date-input" type="text" value="${oaActReview.financeDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字</label>
                <input class="approval-signature-input" type="text" value="${oaActReview.finance}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">主管领导审查意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActReview.supervisorContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期</label>
                <input class="approval-date-input" type="text" value="${oaActReview.supervisorDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字</label>
                <input class="approval-signature-input" type="text" value="${oaActReview.supervisor}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">主要领导审查意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActReview.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期</label>
                <input class="approval-date-input" type="text" value="${oaActReview.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字</label>
                <input class="approval-signature-input" type="text" value="${oaActReview.companyPrincipal}"
                       readonly>
            </div>
        </td>
    </tr>
    </tbody>
</table>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script">注：1.不涉及技术审查的可不填“技术负责人审查意见”。2.应收款确认单不需填写“法务审查意见”。</span>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //打印
    function printContent() {
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '80%');
    }
</script>
</html>

