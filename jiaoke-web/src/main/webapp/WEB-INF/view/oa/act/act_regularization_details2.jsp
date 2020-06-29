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
    <title>转正申请表详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActRegularization.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRegularization.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRegularization.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRegularization.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRegularization.annex}" delims="," var="annex">
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
    <input type="text" class="filling-date-content" value="${oaActRegularization.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content">
            ${oaActRegularization.name}
        </td>

        <td class="tdLabel">部门</td>
        <td class="table-td-content">
            ${oaActRegularization.department}
        </td>

        <td class="tdLabel">职务</td>
        <td class="table-td-content">
            ${oaActRegularization.position}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">学历</td>
        <td class="table-td-content">
            <c:choose>
                <c:when test="${oaActRegularization.education == 0}">初中及以下</c:when>
                <c:when test="${oaActRegularization.education == 1}">中专/中技</c:when>
                <c:when test="${oaActRegularization.education == 2}">高中</c:when>
                <c:when test="${oaActRegularization.education == 3}">大专</c:when>
                <c:when test="${oaActRegularization.education == 4}">本科</c:when>
                <c:when test="${oaActRegularization.education == 5}">硕士</c:when>
                <c:when test="${oaActRegularization.education == 6}">博士</c:when>
            </c:choose>
        </td>

        <td class="tdLabel">入职时间</td>
        <td class="table-td-content">
            ${oaActRegularization.entryDate}
        </td>

        <td class="tdLabel">试用期时间</td>
        <td class="table-td-content">
            ${oaActRegularization.probationPeriod}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">自我评价</td>
        <td colspan="5" class="table-td-details">
            <textarea class="evaluation-content-disabled" readonly>${oaActRegularization.selfAssessment}</textarea>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">部门评价</td>
        <td colspan="5" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 32%;float:left;">
                <label class="opinion-principal-title">部长 </label>
                <textarea class="opinion-column-Juxtaposition"
                          readonly>${oaActRegularization.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActRegularization.principalDate}"
                           readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActRegularization.principal}"
                           readonly>
                </div>
            </div>

            <div class="opinion-principal" style="width: 32%;float:left;margin: 0 3px">
                <label class="opinion-principal-title"></label>
                <textarea class="opinion-column-Juxtaposition"
                          readonly>${oaActRegularization.principalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActRegularization.principalDateT}"
                           readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActRegularization.principalT}"
                           readonly>
                </div>
            </div>

            <div class="opinion-supervisor" style="width: 34%;float: right;">
                <label class="opinion-principal-title">主管 </label>
                <textarea class="opinion-column-Juxtaposition"
                          readonly>${oaActRegularization.supervisorContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActRegularization.supervisorDate}"
                           readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActRegularization.supervisor}"
                           readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">组织人事部意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActRegularization.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRegularization.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRegularization.personnel}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理审批</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActRegularization.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRegularization.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRegularization.companyPrincipal}"
                       readonly>
            </div>
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
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

