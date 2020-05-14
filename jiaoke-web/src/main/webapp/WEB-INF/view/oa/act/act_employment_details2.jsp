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
    <span>${oaActEmployment.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActEmployment.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActEmployment.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActEmployment.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActEmployment.annex}" delims="," var="annex">
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

<div style="margin-top: 10px">
    <input type="text" class="filling-date-content" value="${oaActEmployment.applyTime}" readonly>
    <span class="filling-date">申请时间 </span>
</div>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">申请部室</td>
        <td class="table-td-content">
            ${oaActEmployment.department}
        </td>

        <td class="tdLabel">申请人</td>
        <td class="table-td-content">
            ${oaActEmployment.applicant}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">用人岗位</td>
        <td class="table-td-content">
            ${oaActEmployment.job}
        </td>

        <td class="tdLabel">人数</td>
        <td class="table-td-content">
            ${oaActEmployment.peopleNumber}
        </td>
    </tr>

    <tr>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;width: 50%">申请原因</td>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">拟用人要求</td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-evaluation" style="padding: 10px;">
            <textarea class="evaluation-content-disabled" readonly>${oaActEmployment.applyReason}</textarea>
        </td>

        <td colspan="2" class="table-td-evaluation" style="padding: 10px;">
            <textarea class="evaluation-content-disabled" readonly>${oaActEmployment.demand}</textarea>
        </td>
    </tr>

    <tr>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">部门负责人</td>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">部门主管</td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 49%;float:left;: ;">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActEmployment.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEmployment.principalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEmployment.principal}" readonly>
                </div>
            </div>

            <div class="opinion-principal" style="width: 49%;float: right">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActEmployment.principalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEmployment.principalDateT}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEmployment.principalT}" readonly>
                </div>
            </div>
        </td>

        <td colspan="2" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-supervisor" style="width: 100%">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActEmployment.supervisorContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEmployment.supervisorDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEmployment.supervisor}" readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">人事主管</td>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">总经理</td>
    </tr>

    <tr>
        <td colspan="2" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActEmployment.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActEmployment.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActEmployment.personnel}" readonly>
            </div>
        </td>

        <td colspan="2" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActEmployment.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActEmployment.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActEmployment.companyPrincipal}" readonly>
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

