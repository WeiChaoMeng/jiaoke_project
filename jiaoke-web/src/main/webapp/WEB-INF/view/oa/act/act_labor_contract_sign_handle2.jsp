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
    <title>劳动合同签订审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActLaborContractSign.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActLaborContractSign.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActLaborContractSign.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActLaborContractSign.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActLaborContractSign.annex}" delims="," var="annex">
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

<form id="oaActLaborContractSign">
    <div>
        <div class="notice-content">
            <input type="text" class="notice-personnel-field" value="${oaActLaborContractSign.notifiedPersonStr}"
                   readonly>将与我公司签订劳动合同，请各部门（领导）签署意见。
            <input type="hidden" name="id" value="${oaActLaborContractSign.id}">
            <input type="hidden" name="promoter" value="${oaActLaborContractSign.promoter}">
            <input type="hidden" name="notifiedPerson" value="${oaActLaborContractSign.notifiedPerson}">
            <input type="hidden" name="departmentPrincipal" value="${oaActLaborContractSign.departmentPrincipal}">
        </div>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">所在部门意见</td>
            <td colspan="5" class="approval-content">
                <div style="width: 49%;float: left">
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActLaborContractSign.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActLaborContractSign.principalDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字</label>
                            <input class="approval-signature-input" type="text" value="${oaActLaborContractSign.principal}"
                                   readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div style="width: 49%;float: right">
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContentT"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActLaborContractSign.principalContentT}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActLaborContractSign.principalDateT}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字</label>
                            <input class="approval-signature-input" type="text" value="${oaActLaborContractSign.principalT}"
                                   readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>
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
                              readonly>${oaActLaborContractSign.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActLaborContractSign.supervisorDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActLaborContractSign.supervisor}"
                               readonly>
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
                              readonly>${oaActLaborContractSign.personnelContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActLaborContractSign.personnelDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActLaborContractSign.personnel}"
                               readonly>
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
                              readonly>${oaActLaborContractSign.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActLaborContractSign.companyPrincipalDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActLaborContractSign.companyPrincipal}"
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
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //流程执行步骤
    var laborContractSign = JSON.parse('${oaActLaborContractSignJson}');
    //标记
    var flag = 0;

    if (laborContractSign.state === 0) {
        if (flag === 0) {
            if (laborContractSign.principal === "" || laborContractSign.principal === undefined) {
                $('#principalContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.principalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.principalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.principal}" readonly></div>');
            }
        } else {
            $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.principalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.principalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.principal}" readonly></div>');
        }

        if (flag === 0) {
            if (laborContractSign.principalT === "" || laborContractSign.principalT === undefined) {
                $('#principalContentT').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContentT" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="principalDateT" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="principalT" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#principalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.principalContentT}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.principalDateT}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.principalT}" readonly></div>');
            }
        } else {
            $('#principalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.principalContentT}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.principalDateT}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.principalT}" readonly></div>');
        }

        if (flag === 0) {
            if (laborContractSign.supervisor === "" || laborContractSign.supervisor === undefined) {
                $('#supervisorContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="supervisorContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.supervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.supervisorDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.supervisor}" readonly></div>');
            }
        } else {
            $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.supervisorContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.supervisorDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.supervisor}" readonly></div>');
        }

        if (flag === 0) {
            if (laborContractSign.personnel === "" || laborContractSign.personnel === undefined) {
                $('#personnelContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="personnel" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.personnelContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.personnelDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.personnel}" readonly></div>');
            }
        } else {
            $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.personnelContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.personnelDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.personnel}" readonly></div>');
        }

        if (flag === 0) {
            if (laborContractSign.companyPrincipal === "" || laborContractSign.companyPrincipal === undefined) {
                $('#companyPrincipalContent').append(
                    '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.companyPrincipalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.companyPrincipalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.companyPrincipal}" readonly></div>');
            }
        } else {
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.companyPrincipalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.companyPrincipalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.companyPrincipal}" readonly></div>');
        }

    } else {
        $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.principalContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.principalDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.principal}" readonly></div>');
        $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.supervisorContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.supervisorDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.supervisor}" readonly></div>');
        $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.personnelContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.personnelDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.personnel}" readonly></div>');
        $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActLaborContractSign.companyPrincipalContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
            '<input class="approval-date-input" type="text" value="${oaActLaborContractSign.companyPrincipalDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLaborContractSign.companyPrincipal}" readonly></div>');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/laborContractSign/approvalSubmit',
            data: $('#oaActLaborContractSign').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    window.top.tips("提交成功！", 0, 1, 1000);
                } else if (data === 'backSuccess') {
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
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
        $('#body').css('width', '70%');
    }
</script>
</html>

