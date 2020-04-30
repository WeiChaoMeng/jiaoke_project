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
    <title>解除劳动合同审批表详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActRelieveLaborContract.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRelieveLaborContract.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRelieveLaborContract.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRelieveLaborContract.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRelieveLaborContract.annex}" delims="," var="annex">
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

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content">
            ${oaActRelieveLaborContract.name}
        </td>

        <td class="tdLabel">入职日期</td>
        <td class="table-td-content">
            ${oaActRelieveLaborContract.entryDate}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">部门及职位</td>
        <td class="table-td-content">
            ${oaActRelieveLaborContract.departmentPosition}
        </td>

        <td class="tdLabel">申请离职日期</td>
        <td class="table-td-content">
            ${oaActRelieveLaborContract.applyDepartureDate}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">解除类型</td>
        <td colspan="5" class="table-td-content">
            <c:choose>
                <c:when test="${oaActRelieveLaborContract.relieveType == 0}">
                    <span>个人提出辞职
                    <input type="checkbox" style="vertical-align: middle;margin-left: 5px" checked disabled>
                </span>
                </c:when>
                <c:otherwise>
                    <span>个人提出辞职
                    <input type="checkbox" style="vertical-align: middle;margin-left: 5px" disabled>
                </span>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActRelieveLaborContract.relieveType == 1}">
                    <span style="margin-left: 50px">单位解除劳动合同
                    <input type="checkbox" style="vertical-align: middle;margin-left: 5px" checked disabled>
                </span>
                </c:when>
                <c:otherwise>
                    <span style="margin-left: 50px">单位解除劳动合同
                    <input type="checkbox" style="vertical-align: middle;margin-left: 5px" disabled>
                </span>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActRelieveLaborContract.relieveType == 2}">
                    <span style="margin-left: 50px">协商一致解除劳动合同
                    <input type="checkbox" style="vertical-align: middle;margin-left: 5px" checked disabled>
                </span>
                </c:when>
                <c:otherwise>
                    <span style="margin-left: 50px">协商一致解除劳动合同
                    <input type="checkbox" style="vertical-align: middle;margin-left: 5px" disabled>
                </span>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">解除劳动合同原因</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" style="height: 90px"
                      readonly>${oaActRelieveLaborContract.reason}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.createTimeStr}"
                       readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">职工本人(签字) </label>
                <input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.promoterStr}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">主管部门审批意见</td>
        <td colspan="5" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 32%;float: left;">
                <label class="opinion-principal-title">部门负责人</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActRelieveLaborContract.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.principalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.principal}" readonly>
                </div>
            </div>

            <div class="opinion-supervisor" style="width: 32%;float: left;margin: 0 3px;">
                <label class="opinion-principal-title">部门负责人</label>
                    <textarea class="opinion-column-Juxtaposition" readonly>${oaActRelieveLaborContract.principalContentT}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.principalDateT}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.principalT}" readonly>
                    </div>
            </div>

            <div class="opinion-supervisor" style="width: 34%;float: right;">
                <label class="opinion-principal-title">部门主管领导</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActRelieveLaborContract.supervisorContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.supervisorDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.supervisor}" readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">人事部门审批意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.personnel}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理审批意见</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.companyPrincipal}" readonly>
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

