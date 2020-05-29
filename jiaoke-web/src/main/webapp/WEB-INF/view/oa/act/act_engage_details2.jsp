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
    <title>职称（技术等级）评聘申请表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActEngage.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActEngage.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActEngage.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActEngage.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActEngage.annex}" delims="," var="annex">
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
            ${oaActEngage.applicant}
        </td>

        <td class="tdLabel">所在部门及岗位</td>
        <td class="table-td-content">
            ${oaActEngage.department}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">
            <span style="display: block;line-height: 20px;font-size: 13px;">拟评聘职称</span>
            <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
        </td>
        <td class="table-td-content">
            ${oaActEngage.undoutedly}
        </td>

        <td class="tdLabel">考试时间</td>
        <td class="table-td-content">
            ${oaActEngage.examTime}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">证书取得时间</td>
        <td class="table-td-content">
            ${oaActEngage.certificate}
        </td>

        <td class="tdLabel">本人签字</td>
        <td class="table-td-content">
            ${oaActEngage.signature}
        </td>
    </tr>

    <tr>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;width: 50%">部门负责人意见</td>
        <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">部门主管意见</td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 49%;float:left;: ;">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActEngage.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEngage.principalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEngage.principal}" readonly>
                </div>
            </div>

            <div class="opinion-principal" style="width: 49%;float: right">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActEngage.principalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEngage.principalDateT}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEngage.principalT}" readonly>
                </div>
            </div>
        </td>

        <td colspan="2" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-supervisor" style="width: 100%">
                <textarea class="opinion-column-Juxtaposition" readonly>${oaActEngage.supervisorContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActEngage.supervisorDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActEngage.supervisor}" readonly>
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
            <textarea class="approval-content-textarea" readonly>${oaActEngage.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActEngage.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActEngage.personnel}" readonly>
            </div>
        </td>

        <td colspan="2" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActEngage.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActEngage.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActEngage.companyPrincipal}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel" colspan="4" style="text-align: left;text-indent: 20px;">评聘小组意见</td>
    </tr>

    <tr>
        <td colspan="5" class="approval-content" style="padding: 10px;">
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
        <td class="tdLabel" style="padding: 10px;">
            <span style="display: block;line-height: 20px;font-size: 13px;">聘用职称</span>
            <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
        </td>
        <td class="table-td-content">
            ${oaActEngage.rankName}
        </td>

        <td class="tdLabel" style="padding: 10px;">
            <span style="display: block;line-height: 20px;font-size: 13px;">享受职称</span>
            <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）津贴时间</span>
        </td>
        <td class="table-td-content">
            ${oaActEngage.rankAllowance}
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

