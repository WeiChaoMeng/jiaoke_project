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
    <title>解除劳动合同审批表审批</title>
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

<form id="oaActRelieveLaborContract">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content" id="name">
                ${oaActRelieveLaborContract.name}
                <input type="hidden" name="id" value="${oaActRelieveLaborContract.id}">
                <input type="hidden" name="promoter" value="${oaActRelieveLaborContract.promoter}">
                <input type="hidden" name="departmentPrincipal"
                       value="${oaActRelieveLaborContract.departmentPrincipal}">
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
                <div class="opinion-principal">
                    <label class="opinion-principal-title">部门负责人 </label>
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition"
                                  readonly>${oaActRelieveLaborContract.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text"
                                   value="${oaActRelieveLaborContract.principalDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActRelieveLaborContract.principal}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div class="opinion-supervisor">
                    <label class="opinion-principal-title">部门主管领导 </label>
                    <shiro:hasPermission name="supervisor">
                        <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="supervisor">
                        <textarea class="opinion-column-Juxtaposition"
                                  readonly>${oaActRelieveLaborContract.supervisorContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text"
                                   value="${oaActRelieveLaborContract.supervisorDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActRelieveLaborContract.supervisor}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">人事部门审批意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="personnel">
                    <div style="width: 100%;height: 100%;" id="personnelContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActRelieveLaborContract.personnelContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActRelieveLaborContract.personnelDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActRelieveLaborContract.personnel}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理审批意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActRelieveLaborContract.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text"
                               value="${oaActRelieveLaborContract.companyPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text"
                               value="${oaActRelieveLaborContract.companyPrincipal}" readonly>
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
    var relieveLaborContract = JSON.parse('${oaActRelieveLaborContractJson}');
    //标记
    var flag = 0;

    if (relieveLaborContract.personnelCensor === "" || relieveLaborContract.personnelCensor === undefined) {
        $('#name').append('<input type="hidden" name="personnelCensor" value="${nickname}">');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        flag = 1;
    } else {
        if (relieveLaborContract.state === 0) {
            if (flag === 0) {
                if (relieveLaborContract.principal === "" || relieveLaborContract.principal === undefined) {
                    $('#principalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.principalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.principalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.principal}" readonly></div>');
                }
            } else {
                $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.principalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.principalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.principal}" readonly></div>');
            }

            if (flag === 0) {
                if (relieveLaborContract.supervisor === "" || relieveLaborContract.supervisor === undefined) {
                    $('#supervisorContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="supervisorContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.supervisorContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.supervisorDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.supervisor}" readonly></div>');
                }
            } else {
                $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.supervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.supervisorDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.supervisor}" readonly></div>');
            }

            if (flag === 0) {
                if (relieveLaborContract.personnel === "" || relieveLaborContract.personnel === undefined) {
                    $('#personnelContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="personnel" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.personnelContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.personnelDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.personnel}" readonly></div>');
                }
            } else {
                $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.personnelContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.personnelDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.personnel}" readonly></div>');
            }

            if (flag === 0) {
                if (relieveLaborContract.companyPrincipal === "" || relieveLaborContract.companyPrincipal === undefined) {
                    $('#companyPrincipalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.companyPrincipalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.companyPrincipalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.companyPrincipal}" readonly></div>');
                }
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.companyPrincipalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.companyPrincipalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.companyPrincipal}" readonly></div>');
            }

            if (flag === 0) {
                $('#return').html("");
                $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
            }
        } else {
            $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.principalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.principalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.principal}" readonly></div>');
            $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.supervisorContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.supervisorDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.supervisor}" readonly></div>');
            $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.personnelContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.personnelDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.personnel}" readonly></div>');
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRelieveLaborContract.companyPrincipalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActRelieveLaborContract.companyPrincipalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActRelieveLaborContract.companyPrincipal}" readonly></div>');
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
            url: '/relieveLaborContract/approvalSubmit',
            data: $('#oaActRelieveLaborContract').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '70%');
    }
</script>
</html>

