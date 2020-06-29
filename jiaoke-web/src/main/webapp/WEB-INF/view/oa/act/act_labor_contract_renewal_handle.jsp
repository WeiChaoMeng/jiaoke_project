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
    <title>劳动合同签订、续订、变更、终止审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
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
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}</span>
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

<form id="oaActLaborContractRenewal">
    <div>
        <div class="notice-content">
            <input type="text" class="notice-personnel-field" value="${oaActLaborContractRenewal.notifiedPersonStr}"
                   readonly>与我公司签订的劳动合同将于
            <input class="agreement-start-end start-date" type="text" value="${oaActLaborContractRenewal.startDate}"
                   readonly>到期，请各部门（领导）于
            <input class="agreement-start-end end-date" type="text" value="${oaActLaborContractRenewal.endDate}"
                   readonly>前签署意见。
            <input type="hidden" name="id" value="${oaActLaborContractRenewal.id}">
            <input type="hidden" name="promoter" value="${oaActLaborContractRenewal.promoter}">
            <input type="hidden" name="notifiedPerson" value="${oaActLaborContractRenewal.notifiedPerson}">
            <input type="hidden" name="departmentPrincipal" value="${oaActLaborContractRenewal.departmentPrincipal}">
        </div>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">所在部门意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActLaborContractRenewal.principalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActLaborContractRenewal.principalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActLaborContractRenewal.principal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">主管领导意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActLaborContractRenewal.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActLaborContractRenewal.supervisorDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActLaborContractRenewal.supervisor}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">组织人事部门意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="personnel">
                    <div style="width: 100%;height: 100%;" id="personnelContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActLaborContractRenewal.personnelContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActLaborContractRenewal.personnelDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActLaborContractRenewal.personnel}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActLaborContractRenewal.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActLaborContractRenewal.companyPrincipalDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActLaborContractRenewal.companyPrincipal}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,supervisor,personnel,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
    //流程执行步骤
    var laborContractRenewal = JSON.parse('${oaActLaborContractRenewalJson}');
    //标记
    var flag = 0;

    if (laborContractRenewal.state === 0) {
        if (flag === 0) {
            if (laborContractRenewal.principal === "" || laborContractRenewal.principal === undefined) {
                $('#principalContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.principalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.principalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.principal}" readonly></div>');
            }
        } else {
            $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.principalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.principalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.principal}" readonly></div>');
        }

        if (flag === 0) {
            if (laborContractRenewal.supervisor === "" || laborContractRenewal.supervisor === undefined) {
                $('#supervisorContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="supervisorContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.supervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.supervisorDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.supervisor}" readonly></div>');
            }
        } else {
            $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.supervisorContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.supervisorDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.supervisor}" readonly></div>');
        }

        if (flag === 0) {
            if (laborContractRenewal.personnel === "" || laborContractRenewal.personnel === undefined) {
                $('#personnelContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="personnel" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.personnelContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.personnelDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.personnel}" readonly></div>');
            }
        } else {
            $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.personnelContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.personnelDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.personnel}" readonly></div>');
        }

        if (flag === 0) {
            if (laborContractRenewal.companyPrincipal === "" || laborContractRenewal.companyPrincipal === undefined) {
                $('#companyPrincipalContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.companyPrincipalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.companyPrincipalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.companyPrincipal}" readonly></div>');
            }
        } else {
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.companyPrincipalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.companyPrincipalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.companyPrincipal}" readonly></div>');
        }

    } else {
        $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.principalContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.principalDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.principal}" readonly></div>');
        $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.supervisorContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.supervisorDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.supervisor}" readonly></div>');
        $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.personnelContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.personnelDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.personnel}" readonly></div>');
        $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractRenewal.companyPrincipalContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractRenewal.companyPrincipalDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractRenewal.companyPrincipal}" readonly></div>');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/laborContractRenewal/approvalSubmit',
            data: $('#oaActLaborContractRenewal').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    <%--window.location.href = '${path}/oaHomePage/toOaHomePage';--%>
                    window.history.back();
                    window.top.tips("提交成功！", 0, 1, 1000);
                } else if (data === 'backSuccess') {
                    <%--window.location.href = '${path}/oaHomePage/toOaHomePage';--%>
                    window.history.back();
                    window.top.tips("提交成功,并将数据转存到待发事项中！", 6, 1, 2000);
                } else {
                    window.top.tips("提交失败！", 0, 2, 1000);
                }
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
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
        $('#body').css('width', '80%');
    }
</script>
</html>

