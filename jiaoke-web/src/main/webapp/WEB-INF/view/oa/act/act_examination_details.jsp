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
    <title>职称（技术等级）考试申请表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActExamination.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActExamination.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActExamination.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActExamination.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActExamination.annex}" delims="," var="annex">
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
        <td class="tdLabel">申请人姓名</td>
        <td class="table-td-content">
            ${oaActExamination.applicant}
        </td>

        <td class="tdLabel">所在部门及岗位</td>
        <td class="table-td-content">
            ${oaActExamination.department}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">
            <span style="display: block;line-height: 20px;font-size: 13px;">拟考试职称</span>
            <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
        </td>
        <td class="table-td-content">
            ${oaActExamination.techLevel}
        </td>

        <td class="tdLabel">拟考试时间</td>
        <td class="table-td-content">
            ${oaActExamination.examTime}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">职级</td>
        <td class="table-td-content">
            ${oaActExamination.positionLevel}
        </td>

        <td class="tdLabel">申请人签字</td>
        <td class="table-td-content">
            ${oaActExamination.applicantSignature}
        </td>
    </tr>

    <tr>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;width: 50%">部门负责人意见</td>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">部门主管意见</td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 100%">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActExamination.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActExamination.principalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActExamination.principal}" readonly>
                </div>
            </div>
        </td>

        <td colspan="2" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-supervisor" style="width: 100%">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActExamination.supervisorContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActExamination.supervisorDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActExamination.supervisor}" readonly>
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
            <textarea class="approval-content-textarea" readonly>${oaActExamination.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActExamination.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActExamination.personnel}" readonly>
            </div>
        </td>

        <td colspan="2" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActExamination.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActExamination.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActExamination.companyPrincipal}" readonly>
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
        $('#body').css('width', '70%');
    }
</script>
</html>

