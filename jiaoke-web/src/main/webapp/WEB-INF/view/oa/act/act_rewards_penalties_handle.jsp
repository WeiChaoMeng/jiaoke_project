<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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

<body id="body" style="width: 60%">

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

<form id="oaActRewardsPenalties">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel" style="padding: 0;text-align: center">奖罚月份</td>
            <td colspan="2" class="table-td-content" style="text-align: center">
                ${oaActRewardsPenalties.month}
                <input type="hidden" name="id" value="${oaActRewardsPenalties.id}">
                <input type="hidden" name="promoter" value="${oaActRewardsPenalties.promoter}">
            </td>
        </tr>

        <tr>
            <td colspan="2" class="tdLabel" style="padding: 0;text-align: center">奖罚事项</td>
            <td class="tdLabel" style="padding: 0;text-align: center">主管签字</td>
        </tr>

        <tr>
            <shiro:hasPermission name="office_supervisor">
                <td colspan="2" class="table-td-textarea">
                    <div style="width: 100%;height: 100%;" id="officeContent"></div>
                </td>

                <td class="table-td-textarea">
                    <div style="width: 100%;height: 100%;display: inline;" id="office"></div>
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="office_supervisor">
                <td colspan="2" class="table-td-textarea" id="officeContentXQ">
                    <textarea class="approval-content-textarea" style="height: 75px" readonly></textarea>
                </td>

                <td class="table-td-textarea" id="officeXQ">
                    <input type="text" class="formInput-readonly" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <shiro:hasPermission name="quality_supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="write-approval-content-textarea" oninput="value=value.replace(/\s+/g,'')"
                              style="height: 75px" name="qualityContent"></textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" name="quality" value="${nickname}" readonly>
                    <input type="hidden" name="qualityDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="quality_supervisor">
                <td colspan="2" class="table-td-textarea" id="qualityContent">
                    <textarea class="approval-content-textarea" style="height: 75px" readonly></textarea>
                </td>

                <td class="table-td-textarea"  id="quality">
                    <input type="text" class="formInput-readonly" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <shiro:hasPermission name="produce_supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="write-approval-content-textarea" oninput="value=value.replace(/\s+/g,'')"
                              style="height: 75px" name="productionContent"></textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" name="production" value="${nickname}" readonly>
                    <input type="hidden" name="productionDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
                </td>
            </shiro:hasPermission>

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
            <shiro:hasPermission name="operating_supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="write-approval-content-textarea" oninput="value=value.replace(/\s+/g,'')"
                              style="height: 75px" name="businessContent"></textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" name="business" value="${nickname}" readonly>' +
                    '<input type="hidden" name="businessDate"
                            value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
                </td>
            </shiro:hasPermission>

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
            <shiro:hasPermission name="finance_principal">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="write-approval-content-textarea" oninput="value=value.replace(/\s+/g,'')"
                              style="height: 75px" name="financialContent"></textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" name="financial" value="${nickname}" readonly>
                    <input type="hidden" name="financialDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
                </td>
            </shiro:hasPermission>

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
            <td class="tdLabel" style="padding: 0;text-align: center">人事专员</td>
            <td colspan="5" class="table-td-textarea">
                <shiro:hasPermission name="personnel_censor">
                    <div style="width: 100%;height: 100%;" id="personnelCensorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel_censor">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActRewardsPenalties.personnelCensorContent}</textarea>
                    <div class="approval-date"><label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActRewardsPenalties.personnelCensorDate}" readonly></div>
                    <div class="approval-signature"><label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActRewardsPenalties.personnelCensor}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="padding: 0;text-align: center">人事主管</td>
            <td colspan="5" class="table-td-textarea">
                <shiro:hasPermission name="personnel">
                    <div style="width: 100%;height: 100%;" id="personnelContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActRewardsPenalties.personnelContent}</textarea>
                    <div class="approval-date"><label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActRewardsPenalties.personnelDate}" readonly></div>
                    <div class="approval-signature"><label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActRewardsPenalties.personnel}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="padding: 0;text-align: center">总经理意见</td>
            <td colspan="5" class="table-td-textarea">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActRewardsPenalties.companyPrincipalContent}</textarea>
                    <div class="approval-date"><label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActRewardsPenalties.companyPrincipalDate}" readonly></div>
                    <div class="approval-signature"><label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActRewardsPenalties.companyPrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="operating_supervisor,quality_supervisor,office_supervisor,finance_principal,produce_supervisor,personnel_censor,personnel,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>

    //流程执行步骤
    var reward = JSON.parse('${oaActRewardsPenaltiesJson}');
    //标记
    var flag = 0;

    if (reward.state === 0) {
        if (flag === 0) {
            if (reward.office === "" || reward.office === undefined) {
                $('#officeContent').append('<textarea class="write-approval-content-textarea" oninput="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="officeContent"></textarea>');
                $('#office').append('<input type="text" class="formInput-readonly" name="office" value="${nickname}" readonly> <input type="hidden" name="officeDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#officeContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
                $('#office').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');
            }
        } else {
            $('#officeContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
            $('#office').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');
        }

        if (reward.office !== "" & reward.quality !== "" & reward.business !== "" & reward.production !== "" & reward.financial !== "") {
            if (flag === 0) {
                if (reward.personnelCensor === "" || reward.personnelCensor === undefined) {
                    $('#personnelCensorContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelCensorContent" style="background-color: #ffffff"></textarea>\n' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" name="personnelCensorDate"\n' +
                        'value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="personnelCensor" value="${nickname}" readonly></div>');

                    $('#officeContentXQ').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
                    $('#officeXQ').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');

                    $('#qualityContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>');
                    $('#quality').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>');

                    $('#productionContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>');
                    $('#production').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>');

                    $('#businessContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>');
                    $('#business').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>');

                    $('#financialContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>');
                    $('#financial').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>');
                    flag = 1;
                } else {
                    $('#personnelCensorContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelCensorContent}</textarea>\n' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
                        'value="${oaActRewardsPenalties.personnelCensorDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnelCensor}" readonly></div>');
                }
            } else {
                $('#personnelCensorContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelCensorContent}</textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
                    'value="${oaActRewardsPenalties.personnelCensorDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnelCensor}" readonly></div>');
            }

            if (flag === 0) {
                if (reward.personnel === "" || reward.personnel === undefined) {
                    $('#personnelContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelContent" style="background-color: #ffffff"></textarea>\n' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" name="personnelDate"\n' +
                        'value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="personnel" value="${nickname}" readonly></div>');

                    $('#officeContentXQ').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
                    $('#officeXQ').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');

                    $('#qualityContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>');
                    $('#quality').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>');

                    $('#productionContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>');
                    $('#production').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>');

                    $('#businessContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>');
                    $('#business').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>');

                    $('#financialContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>');
                    $('#financial').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>');
                    flag = 1;
                } else {
                    $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelContent}</textarea>\n' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
                        'value="${oaActRewardsPenalties.personnelDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnel}" readonly></div>');
                }
            } else {
                $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelContent}</textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
                    'value="${oaActRewardsPenalties.personnelDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnel}" readonly></div>');
            }

            if (flag === 0) {
                if (reward.companyPrincipal === "" || reward.companyPrincipal === undefined) {
                    $('#companyPrincipalContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>\n' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" name="companyPrincipalDate"\n' +
                        'value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');

                    $('#officeContentXQ').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
                    $('#officeXQ').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');

                    $('#qualityContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>');
                    $('#quality').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>');

                    $('#productionContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>');
                    $('#production').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>');

                    $('#businessContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>');
                    $('#business').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>');

                    $('#financialContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>');
                    $('#financial').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>');
                    flag = 1;
                } else {
                    $('#companyPrincipalContent').append('<textarea class="approval-content-textarea"readonly>${oaActRewardsPenalties.companyPrincipalContent}</textarea>\n' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
                        'value="${oaActRewardsPenalties.companyPrincipalDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.companyPrincipal}" readonly></div>');
                }
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.companyPrincipalContent}</textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" value="${oaActRewardsPenalties.companyPrincipalDate}" readonly></div>\n' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label><input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.companyPrincipal}" readonly></div>');
            }

            if (flag === 0) {
                $('#officeContentXQ').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
                $('#officeXQ').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');

                $('#qualityContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>');
                $('#quality').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>');

                $('#productionContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>');
                $('#production').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>');

                $('#businessContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>');
                $('#business').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>');

                $('#financialContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>');
                $('#financial').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>');

                $('#return').html("");
                $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
            }
        }else{
            $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelContent}</textarea>\n' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
                'value="${oaActRewardsPenalties.personnelDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnel}" readonly></div>');
        }
    } else {
        $('#officeContentXQ').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
        $('#officeXQ').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');

        $('#qualityContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>');
        $('#quality').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>');

        $('#productionContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>');
        $('#production').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>');

        $('#businessContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>');
        $('#business').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>');

        $('#financialContent').html('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>');
        $('#financial').html('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>');

        $('#personnelCensorContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelCensorContent}</textarea>\n' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
            'value="${oaActRewardsPenalties.personnelCensorDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
            '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnelCensor}" readonly></div>');

        $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelContent}</textarea>\n' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
            'value="${oaActRewardsPenalties.personnelDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
            '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnel}" readonly></div>');

        $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRewardsPenalties.personnelContent}</textarea>\n' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label><input class="approval-date-input" type="text"\n' +
            'value="${oaActRewardsPenalties.personnelDate}" readonly></div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
            '<input class="approval-signature-input" type="text" value="${oaActRewardsPenalties.personnel}" readonly></div>');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/rewardsPenalties/approvalSubmit',
            data: $('#oaActRewardsPenalties').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    layer.msg('提交成功！');
                } else if (data === 'backSuccess') {
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    window.top.tips("提交成功,并将数据转存到待发事项中！", 6, 1, 2000);
                } else {
                    layer.msg('提交失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //打印
    function printContent() {
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#return').show();
        $('#body').css('width', '60%');
    }
</script>
</html>

