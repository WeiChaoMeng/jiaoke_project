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

<form id="oaActExamination">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">申请人姓名</td>
            <td class="table-td-content" id="personnelCensorContent">
                ${oaActExamination.applicant}
            </td>

            <td class="tdLabel">所在部门及岗位</td>
            <td class="table-td-content">
                ${oaActExamination.department}
                <input type="hidden" name="id" value="${oaActExamination.id}">
                <input type="hidden" name="promoter" value="${oaActExamination.promoter}">
                <input type="hidden" name="departmentPrincipal" value="${oaActExamination.departmentPrincipal}">
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
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;height: 100%;" id="principalContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea class="opinion-column-Juxtaposition" readonly>${oaActExamination.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActExamination.principalDate}" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActExamination.principal}" readonly>
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
                        <textarea class="opinion-column-Juxtaposition" readonly>${oaActExamination.supervisorContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActExamination.supervisorDate}" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActExamination.supervisor}" readonly>
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
                    <textarea class="approval-content-textarea" readonly>${oaActExamination.personnelContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActExamination.personnelDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActExamination.personnel}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>

            <td colspan="2" class="approval-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea" readonly>${oaActExamination.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActExamination.companyPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActExamination.companyPrincipal}" readonly>
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
    var oaActExamination = JSON.parse('${oaActExaminationJson}'.replace(/\r/g,"\\r").replace(/\n/g,"\\n"));
    //标记
    var flag = 0;

    if (oaActExamination.personnelCensor === "" || oaActExamination.personnelCensor === undefined) {
        $('#personnelCensorContent').append('<input type="hidden" name="personnelCensor" value="${nickname}">');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        flag = 1;
    } else {
        if (oaActExamination.state === 0) {
            if (flag === 0) {
                if (oaActExamination.principal === "" || oaActExamination.principal === undefined) {
                    $('#principalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="principalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.principalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActExamination.principalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActExamination.principal}" readonly></div>');
                }
            } else {
                $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.principalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActExamination.principalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActExamination.principal}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActExamination.supervisor === "" || oaActExamination.supervisor === undefined) {
                    $('#supervisorContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="supervisorContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.supervisorContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActExamination.supervisorDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActExamination.supervisor}" readonly></div>');
                }
            } else {
                $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.supervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActExamination.supervisorDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActExamination.supervisor}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActExamination.personnelCensorT === "" || oaActExamination.personnelCensorT === undefined) {
                    $('#personnelCensorContent').append('<input type="hidden" name="personnelCensorT" value="${nickname}">');
                    $('#return').html("");
                    $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
                    flag = 1;
                }
            }

            if (flag === 0) {
                if (oaActExamination.personnel === "" || oaActExamination.personnel === undefined) {
                    $('#personnelContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="personnelContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="personnel" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.personnelContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActExamination.personnelDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActExamination.personnel}" readonly></div>');
                }
            } else {
                $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.personnelContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActExamination.personnelDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActExamination.personnel}" readonly></div>');
            }

            if (flag === 0) {
                if (oaActExamination.companyPrincipal === "" || oaActExamination.companyPrincipal === undefined) {
                    $('#companyPrincipalContent').append(
                        '<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
                    flag = 1;
                } else {
                    $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.companyPrincipalContent}</textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" value="${oaActExamination.companyPrincipalDate}" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                        '<input class="approval-signature-input" type="text" value="${oaActExamination.companyPrincipal}" readonly></div>');
                }
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.companyPrincipalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                    '<input class="approval-date-input" type="text" value="${oaActExamination.companyPrincipalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActExamination.companyPrincipal}" readonly></div>');
            }

            if (flag === 0) {
                $('#return').html("");
                $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
            }

        } else {
            $('#principalContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.principalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActExamination.principalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActExamination.principal}" readonly></div>');
            $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.supervisorContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActExamination.supervisorDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActExamination.supervisor}" readonly></div>');
            $('#personnelContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.personnelContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActExamination.personnelDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActExamination.personnel}" readonly></div>');
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActExamination.companyPrincipalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text" value="${oaActExamination.companyPrincipalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActExamination.companyPrincipal}" readonly></div>');
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
            url: '/examination/approvalSubmit',
            data: $('#oaActExamination').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '70%');
    }
</script>
</html>

