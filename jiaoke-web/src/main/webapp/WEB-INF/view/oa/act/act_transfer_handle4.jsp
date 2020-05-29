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
    <title>转岗审批表审批</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
    <style>
        .tdLabel {
            width: 10%;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActTransfer.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActTransfer.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActTransfer.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActTransfer.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActTransfer.annex}" delims="," var="annex">
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

<div style="margin-top: 10px">
    <input type="text" class="filling-date-content" value="${oaActTransfer.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<form id="oaActTransfer">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content" colspan="2">
                ${oaActTransfer.name}
                <input type="hidden" name="id" value="${oaActTransfer.id}">
                <input type="hidden" name="promoter" value="${oaActTransfer.promoter}">
                <input type="hidden" name="newDepartment" value="${oaActTransfer.newDepartment}">
                <input type="hidden" name="departmentPrincipal" value="${oaActTransfer.departmentPrincipal}">
            </td>

            <td class="tdLabel">年龄</td>
            <td class="table-td-content" colspan="2">
                ${oaActTransfer.age}
            </td>

            <td class="tdLabel">入职时间</td>
            <td class="table-td-content" id="personnelCensorContent">
                ${oaActTransfer.entryDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">现部门</td>
            <td class="table-td-content">
                ${oaActTransfer.presentDepartment}
            </td>

            <td class="tdLabel">现岗位</td>
            <td class="table-td-content" style="width: 15%">
                ${oaActTransfer.presentPost}
            </td>

            <td class="tdLabel">拟转入部门</td>
            <td class="table-td-content">
                ${oaActTransfer.newDepartmentStr}
            </td>

            <td class="tdLabel">拟转入岗位</td>
            <td class="table-td-content">
                ${oaActTransfer.newPost}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">转岗事由</td>
            <td colspan="7" class="table-td-evaluation">
                <textarea class="evaluation-content-disabled" style="height: 73px"
                          disabled>${oaActTransfer.cause}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActTransfer.createTimeStr}" disabled>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">本人签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActTransfer.promoterStr}" disabled>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">所在部门评价</td>
            <td colspan="7" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal" style="width: 32%;float: left">
                    <label class="opinion-principal-title">部长</label>
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition"
                                  disabled>${oaActTransfer.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActTransfer.principalDate}"
                                   disabled>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActTransfer.principal}"
                                   disabled>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div class="opinion-principal" style="width: 32%;float: left;margin: 0 3px">
                    <label class="opinion-principal-title">部长</label>
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContentT"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition"
                                  disabled>${oaActTransfer.principalContentT}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActTransfer.principalDateT}"
                                   disabled>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActTransfer.principalT}"
                                   disabled>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div class="opinion-supervisor" style="width: 34%;float: right;">
                    <label class="opinion-principal-title">主管</label>
                    <shiro:hasPermission name="supervisor">
                        <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="supervisor">
                        <textarea class="opinion-column-Juxtaposition"
                                  disabled>${oaActTransfer.supervisorContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActTransfer.supervisorDate}"
                                   disabled>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActTransfer.supervisor}"
                                   disabled>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">转入部门意见</td>
            <td colspan="7" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal" style="width: 32%;float: left">
                    <label class="opinion-principal-title">部长</label>
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="transferPrincipalContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition"
                                  disabled>${oaActTransfer.transferPrincipalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text"
                                   value="${oaActTransfer.transferPrincipalDate}"
                                   disabled>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActTransfer.transferPrincipal}"
                                   disabled>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div class="opinion-principal" style="width: 32%;float: left;margin: 0 3px">
                    <label class="opinion-principal-title">部长</label>
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="transferPrincipalContentT"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition"
                                  disabled>${oaActTransfer.transferPrincipalContentT}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text"
                                   value="${oaActTransfer.transferPrincipalDateT}"
                                   disabled>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActTransfer.transferPrincipalT}"
                                   disabled>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div class="opinion-supervisor" style="width: 34%;float: right;">
                    <label class="opinion-principal-title">主管</label>
                    <shiro:hasPermission name="supervisor">
                        <div style="width: 100%;height: 100%;" id="transferSupervisorContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="supervisor">
                        <textarea class="opinion-column-Juxtaposition"
                                  disabled>${oaActTransfer.transferSupervisorDate}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text"
                                   value="${oaActTransfer.transferSupervisorDate}"
                                   disabled>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActTransfer.transferSupervisor}"
                                   disabled>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">组织人事部意见</td>
            <td colspan="7" class="approval-content">
                <shiro:hasPermission name="personnel">
                    <div style="width: 100%;height: 100%;" id="personnelContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel">
                    <textarea class="approval-content-textarea" disabled>${oaActTransfer.personnelContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActTransfer.personnelDate}" disabled>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActTransfer.personnel}" disabled>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理审批</td>
            <td colspan="7" class="approval-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea"
                              disabled>${oaActTransfer.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActTransfer.companyPrincipalDate}"
                               disabled>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActTransfer.companyPrincipal}"
                               disabled>
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
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var transfer = JSON.parse('${oaActTransferJson}');
    //标记
    var flag = 0;

    if (transfer.personnelCensor === "" || transfer.personnelCensor === undefined) {
        $('#personnelCensorContent').append('<input type="hidden" name="personnelCensor" value="${nickname}">');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        flag = 1;
    } else {
        if (transfer.state === 0) {
            if (flag === 0) {
                if (transfer.principal === "" || transfer.principal === undefined) {
                    $('#principalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.principalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.principalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.principal}" readonly></div>');
                }
            } else {
                $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.principalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.principalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.principal}" readonly></div>');
            }

            if (flag === 0) {
                if (transfer.principalT === "" || transfer.principalT === undefined) {
                    $('#principalContentT').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContentT" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="principalDateT" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="principalT" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#principalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.principalContentT}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.principalDateT}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.principalT}" readonly></div>');
                }
            } else {
                $('#principalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.principalContentT}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.principalDateT}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.principalT}" readonly></div>');
            }

            if (flag === 0) {
                if (transfer.supervisor === "" || transfer.supervisor === undefined) {
                    $('#supervisorContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="supervisorContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.supervisorContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.supervisorDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.supervisor}" readonly></div>');
                }
            } else {
                $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.supervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.supervisorDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.supervisor}" readonly></div>');
            }

            if (flag === 0) {
                if (transfer.transferPrincipal === "" || transfer.transferPrincipal === undefined) {
                    $('#transferPrincipalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="transferPrincipalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="transferPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="transferPrincipal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#transferPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.transferPrincipalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.transferPrincipalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.transferPrincipal}" readonly></div>');
                }
            } else {
                $('#transferPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.transferPrincipalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.transferPrincipalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.transferPrincipal}" readonly></div>');
            }

            if (flag === 0) {
                if (transfer.transferPrincipalT === "" || transfer.transferPrincipalT === undefined) {
                    $('#transferPrincipalContentT').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="transferPrincipalContentT" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="transferPrincipalDateT" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="transferPrincipalT" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#transferPrincipalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.transferPrincipalContentT}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.transferPrincipalDateT}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.transferPrincipalT}" readonly></div>');
                }
            } else {
                $('#transferPrincipalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.transferPrincipalContentT}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.transferPrincipalDateT}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.transferPrincipalT}" readonly></div>');
            }

            if (flag === 0) {
                if (transfer.transferSupervisor === "" || transfer.transferSupervisor === undefined) {
                    $('#transferSupervisorContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="transferSupervisorContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="transferSupervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="transferSupervisor" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#transferSupervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.transferSupervisorContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.transferSupervisorDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.transferSupervisor}" readonly></div>');
                }
            } else {
                $('#transferSupervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.transferSupervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.transferSupervisorDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.transferSupervisor}" readonly></div>');
            }

            if (flag === 0) {
                if (transfer.personnel === "" || transfer.personnel === undefined) {
                    $('#personnelContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="personnel" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.personnelContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.personnelDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.personnel}" readonly></div>');
                }
            } else {
                $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.personnelContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.personnelDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.personnel}" readonly></div>');
            }

            if (flag === 0) {
                if (transfer.companyPrincipal === "" || transfer.companyPrincipal === undefined) {
                    $('#companyPrincipalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.companyPrincipalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActTransfer.companyPrincipalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActTransfer.companyPrincipal}" readonly></div>');
                }
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActTransfer.companyPrincipalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActTransfer.companyPrincipalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActTransfer.companyPrincipal}" readonly></div>');
            }

            if (flag === 0) {
                $('#return').html("");
                $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
            }

        } else {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    }


    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/transfer/approvalSubmit',
            data: $('#oaActTransfer').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '80%');
    }
</script>
</html>

