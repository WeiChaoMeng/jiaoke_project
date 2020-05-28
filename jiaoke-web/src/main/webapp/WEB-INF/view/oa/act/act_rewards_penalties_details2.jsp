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
    <title>奖罚意见表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActRewardsPenalties.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRewardsPenalties.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRewardsPenalties.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRewardsPenalties.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRewardsPenalties.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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
        <td class="tdLabel" style="padding: 0;text-align: center">奖罚月份</td>
        <td colspan="2" class="table-td-content" style="text-align: center">
            ${oaActRewardsPenalties.month}
        </td>
    </tr>

    <tr>
        <td colspan="2" class="tdLabel" style="padding: 0;text-align: center">奖罚事项</td>
        <td class="tdLabel" style="padding: 0;text-align: center">主管签字</td>
    </tr>

    <tr>
        <shiro:hasAnyPermission name="personnel">
            <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px"
                      readonly>${oaActRewardsPenalties.officeContent}</textarea>
            </td>

            <td class="table-td-textarea">
                    ${oaActRewardsPenalties.office}
            </td>
        </shiro:hasAnyPermission>

        <shiro:lacksPermission name="personnel">
            <td colspan="2" class="table-td-textarea" id="officeContentXQ">
                <textarea class="approval-content-textarea" style="height: 75px" readonly></textarea>
            </td>

            <td class="table-td-textarea" id="officeXQ">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </shiro:lacksPermission>
    </tr>

    <tr>
        <shiro:hasAnyPermission name="quality_supervisor">

            <td colspan="2" class="table-td-textarea">
                <textarea class="approval-content-textarea" style="height: 75px"
                          readonly>${oaActRewardsPenalties.qualityContent}</textarea>
            </td>

            <td class="table-td-textarea">
                    ${oaActRewardsPenalties.quality}
            </td>

        </shiro:hasAnyPermission>

        <shiro:lacksPermission name="quality_supervisor">
            <td colspan="2" class="table-td-textarea">
                <textarea class="approval-content-textarea" style="height: 75px" readonly></textarea>
            </td>

            <td class="table-td-textarea">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </shiro:lacksPermission>
    </tr>

    <tr>
        <shiro:hasAnyPermission name="produce_supervisor">
            <td colspan="2" class="table-td-textarea">
                <textarea class="approval-content-textarea" style="height: 75px"
                          readonly>${oaActRewardsPenalties.productionContent}</textarea>
            </td>

            <td class="table-td-textarea">
                    ${oaActRewardsPenalties.production}
            </td>
        </shiro:hasAnyPermission>

        <shiro:lacksPermission name="produce_supervisor">
            <td colspan="2" class="table-td-textarea" id="productionContent">
                <textarea class="approval-content-textarea" style="height: 75px" readonly></textarea>
            </td>

            <td class="table-td-textarea" id="production">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </shiro:lacksPermission>
    </tr>

    <tr>
        <shiro:hasAnyPermission name="operating_supervisor">
            <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px"
                      readonly>${oaActRewardsPenalties.businessContent}</textarea>
            </td>

            <td class="table-td-textarea">
                    ${oaActRewardsPenalties.business}
            </td>
        </shiro:hasAnyPermission>

        <shiro:lacksPermission name="operating_supervisor">
            <td colspan="2" class="table-td-textarea" id="businessContent">
                <textarea class="approval-content-textarea" style="height: 75px" readonly></textarea>
            </td>

            <td class="table-td-textarea" id="business">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </shiro:lacksPermission>
    </tr>

    <tr>
        <shiro:hasAnyPermission name="finance_principal">
            <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px"
                      readonly>${oaActRewardsPenalties.financialContent}</textarea>
            </td>

            <td class="table-td-textarea">
                    ${oaActRewardsPenalties.financial}
            </td>
        </shiro:hasAnyPermission>

        <shiro:lacksPermission name="finance_principal">
            <td colspan="2" class="table-td-textarea" id="financialContent">
                <textarea class="approval-content-textarea" style="height: 75px" readonly></textarea>
            </td>

            <td class="table-td-textarea" id="financial">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </shiro:lacksPermission>
    </tr>

    <tr>
        <td class="tdLabel">人事专员</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea"
                      readonly>${oaActRewardsPenalties.personnelCensorContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRewardsPenalties.personnelCensorDate}"
                       readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnelCensor}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">人事主管领导</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRewardsPenalties.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnel}"
                       readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理审批</td>
        <td colspan="5" class="approval-content">
            <textarea class="approval-content-textarea"
                      readonly>${oaActRewardsPenalties.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRewardsPenalties.companyPrincipalDate}"
                       readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.companyPrincipal}"
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

