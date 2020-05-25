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

<form id="oaActEngage">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">申请人姓名</td>
            <td class="table-td-content" id="personnelCensorContent">
                ${oaActEngage.applicant}
            </td>

            <td class="tdLabel">所在部门及岗位</td>
            <td class="table-td-content">
                ${oaActEngage.department}
                <input type="hidden" name="id" value="${oaActEngage.id}">
                <input type="hidden" name="promoter" value="${oaActEngage.promoter}">
                <input type="hidden" name="departmentPrincipal" value="${oaActEngage.departmentPrincipal}">
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
                <div class="opinion-principal" style="width: 49%;float:left;">
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContent">

                        </div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition"
                                  readonly>${oaActEngage.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActEngage.principalDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActEngage.principal}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div class="opinion-principal" style="width: 49%;float:right;">
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContentT"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition"
                                  readonly>${oaActEngage.principalContentT}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActEngage.principalDateT}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActEngage.principalT}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>

            <td colspan="2" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-supervisor" style="width: 100%">
                    <shiro:hasPermission name="supervisor">
                        <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="supervisor">
                        <textarea class="opinion-column-Juxtaposition" readonly>${oaActEngage.supervisorContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActEngage.supervisorDate}" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActEngage.supervisor}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">人事主管意见</td>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">总经理意见</td>
        </tr>

        <tr>
            <td colspan="2" class="approval-content">
                <shiro:hasPermission name="personnel">
                    <div style="width: 100%;height: 100%;" id="personnelContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel">
                    <textarea class="approval-content-textarea" readonly>${oaActEngage.personnelContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActEngage.personnelDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActEngage.personnel}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>

            <td colspan="2" class="approval-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea" readonly>${oaActEngage.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActEngage.companyPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActEngage.companyPrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="4" style="text-align: left;text-indent: 20px;">评聘小组意见</td>
        </tr>

        <tr>
            <td colspan="4" class="approval-content" style="padding: 10px">
                <c:choose>
                    <c:when test="${commentsListSize == 0}">
                        <textarea class="approval-content-textarea" readonly></textarea>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${commentsList}" var="comments">
                            <div class="comment-container" style="padding: 5px 0;">
                                <div class="comment-style">
                                    <span class="comment-name">${comments.userName}</span>
                                    <span class="comment-message">${comments.message}</span>
                                    <span class="comment-date">${comments.timeStr}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="padding: 10px;">
                <span style="display: block;line-height: 20px;font-size: 13px;">聘用职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
            </td>
            <td class="table-td-content">
                <shiro:hasPermission name="personnel_censor">
                    <div style="width: 100%;height: 100%;" id="personnelCensorContentO"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel_censor">
                    ${oaActEngage.rankName}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel" style="padding: 10px;">
                <span style="display: block;line-height: 20px;font-size: 13px;">享受职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）津贴时间</span>
            </td>
            <td class="table-td-content">
                <shiro:hasPermission name="personnel_censor">
                    <div style="width: 100%;height: 100%;" id="personnelCensorContentT"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel_censor">
                    ${oaActEngage.rankAllowance}
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
    var oaActEngage = JSON.parse('${oaActEngageJson}'.replace(/\r/g,"\\r").replace(/\n/g,"\\n"));
    //标记
    var flag = 0;

    if (oaActEngage.personnelCensor === "" || oaActEngage.personnelCensor === undefined) {
        $('#personnelCensorContent').append('<input type="hidden" name="personnelCensor" value="${nickname}">');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        flag = 1;
    } else {
        if (oaActEngage.state === 0) {
            if (flag === 0) {
                if (oaActEngage.principal === "" || oaActEngage.principal === undefined) {
                    $('#principalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.principalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActEngage.principalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActEngage.principal}" readonly></div>');
                }
            } else {
                $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.principalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActEngage.principalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActEngage.principal}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActEngage.principalT === "" || oaActEngage.principalT === undefined) {
                    $('#principalContentT').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContentT" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="principalDateT" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="principalT" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#principalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.principalContentT}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActEngage.principalDateT}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActEngage.principalT}" readonly></div>');
                }
            } else {
                $('#principalContentT').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.principalContentT}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActEngage.principalDateT}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActEngage.principalT}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActEngage.supervisor === "" || oaActEngage.supervisor === undefined) {
                    $('#supervisorContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="supervisorContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.supervisorContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActEngage.supervisorDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActEngage.supervisor}" readonly></div>');
                }
            } else {
                $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.supervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActEngage.supervisorDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActEngage.supervisor}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActEngage.personnelCensorT === "" || oaActEngage.personnelCensorT === undefined) {
                    $('#personnelCensorContent').append('<input type="hidden" name="personnelCensorT" value="${nickname}">');
                    $('#return').html("");
                    $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
                    flag = 1;
                }
            }

            if (flag === 0) {
                if (oaActEngage.personnel === "" || oaActEngage.personnel === undefined) {
                    $('#personnelContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="personnel" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.personnelContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActEngage.personnelDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActEngage.personnel}" readonly></div>');
                }
            } else {
                $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.personnelContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActEngage.personnelDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActEngage.personnel}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActEngage.companyPrincipal === "" || oaActEngage.companyPrincipal === undefined) {
                    $('#companyPrincipalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.companyPrincipalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActEngage.companyPrincipalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActEngage.companyPrincipal}" readonly></div>');
                }
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.companyPrincipalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActEngage.companyPrincipalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActEngage.companyPrincipal}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActEngage.rankName === "" || oaActEngage.rankName === undefined) {
                    $('#personnelCensorContentO').append('<input type="text" class="formInput" name="rankName" autocomplete="off">' +
                        '<input type="hidden" name="rankDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">' +
                        '<input type="hidden" name="personnelCommissioner" value="${nickname}">');
                    $('#personnelCensorContentT').append('<input type="text" class="formInput" name="rankAllowance" autocomplete="off">');
                    flag = 1;
                } else {
                    $('#personnelCensorContentO').append('${oaActEngage.rankName}');
                    $('#personnelCensorContentT').append('${oaActEngage.rankAllowance}');
                }
            } else {
                $('#personnelCensorContentO').append('${oaActEngage.rankName}');
                $('#personnelCensorContentT').append('${oaActEngage.rankAllowance}');
            }

            if (flag === 0) {
                $('#return').html("");
                $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
            }

        } else {
            $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.principalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActEngage.principalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActEngage.principal}" readonly></div>');
            $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.supervisorContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActEngage.supervisorDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActEngage.supervisor}" readonly></div>');
            $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.personnelContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActEngage.personnelDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActEngage.personnel}" readonly></div>');
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActEngage.companyPrincipalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActEngage.companyPrincipalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActEngage.companyPrincipal}" readonly></div>');
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
            url: '/engage/approvalSubmit',
            data: $('#oaActEngage').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    <%--window.location.href = '${path}/oaHomePage/toOaHomePage';--%>
                    window.history.back();
                    layer.msg('提交成功！');
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

