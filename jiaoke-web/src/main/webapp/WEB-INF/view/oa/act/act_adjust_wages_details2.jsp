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
    <title>调资审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActAdjustWages.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActAdjustWages.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActAdjustWages.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActAdjustWages.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActAdjustWages.annex}" delims="," var="annex">
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
    <input type="text" class="filling-date-content" value="${oaActAdjustWages.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content">
            ${oaActAdjustWages.name}
        </td>

        <td class="tdLabel">部门</td>
        <td class="table-td-content">
            ${oaActAdjustWages.department}
        </td>

        <td class="tdLabel">职务</td>
        <td class="table-td-content">
            ${oaActAdjustWages.position}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">入职时间</td>
        <td class="table-td-content">
            ${oaActAdjustWages.entryDate}
        </td>

        <td class="tdLabel">目前薪资</td>
        <td class="table-td-content">
            ${oaActAdjustWages.currentSalary}
        </td>

        <td class="tdLabel">期望薪资</td>
        <td class="table-td-content">
            ${oaActAdjustWages.salaryExpectation}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">申请原因</td>
        <td colspan="5" class="table-td-evaluation">
            <textarea class="evaluation-content-disabled" style="height: 90px" readonly>${oaActAdjustWages.reason}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActAdjustWages.createTimeStr}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">本人签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActAdjustWages.promoterStr}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">所在部门意见</td>
        <td colspan="5" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 32%;float: left;">
                <label class="opinion-principal-title">部门负责人 </label>
                <textarea class="opinion-column-Juxtaposition"
                          readonly>${oaActAdjustWages.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActAdjustWages.principalDate}"
                           readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActAdjustWages.principal}"
                           readonly>
                </div>
            </div>

            <div class="opinion-principal" style="width: 32%;float: left;margin: 0 3px">
                <label class="opinion-principal-title">部门负责人 </label>
                <textarea class="opinion-column-Juxtaposition"
                          readonly>${oaActAdjustWages.principalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActAdjustWages.principalDateT}"
                           readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActAdjustWages.principalT}"
                           readonly>
                </div>
            </div>

            <div class="opinion-supervisor" style="width: 34%;float: right;">
                <label class="opinion-principal-title">主管 </label>
                <textarea class="opinion-column-Juxtaposition"
                          readonly>${oaActAdjustWages.supervisorContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActAdjustWages.supervisorDate}"
                           readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActAdjustWages.supervisor}"
                           readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">组织人事部门意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActAdjustWages.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActAdjustWages.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActAdjustWages.personnel}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理审批</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActAdjustWages.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActAdjustWages.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActAdjustWages.companyPrincipal}"
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
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body,#return').css('width', '70%');
    }
</script>
</html>

