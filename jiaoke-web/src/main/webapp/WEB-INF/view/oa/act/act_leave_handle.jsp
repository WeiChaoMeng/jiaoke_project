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
    <title>请假审批表处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 65%">

<div class="table-title">
    <span>${oaActLeave.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActLeave.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActLeave.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActLeave.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActLeave.annex}" delims="," var="annex">
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
    <input type="text" class="filling-date-content" value="${oaActLeave.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<form id="oaActLeave">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content">
                ${oaActLeave.name}
                <input type="hidden" name="id" value="${oaActLeave.id}">
                <input type="hidden" name="title" value="${oaActLeave.title}">
                <input type="hidden" name="promoter" value="${oaActLeave.promoter}">
            </td>

            <td class="tdLabel">申请时间</td>
            <td class="table-td-content">
                ${oaActLeave.applyDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">事由</td>
            <td colspan="5" class="table-td-evaluation">
                <textarea class="evaluation-content-disabled" style="height: 58px"
                          readonly>${oaActLeave.reason}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActLeave.applicantSignatureDate}"
                           readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">本人签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActLeave.applicantSignature}"
                           readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门负责人</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    <textarea readonly class="approval-content-textarea">${oaActLeave.principalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActLeave.principalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActLeave.principal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">主管领导</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    <textarea readonly class="approval-content-textarea">${oaActLeave.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActLeave.supervisorDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActLeave.supervisor}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script"> 注：每周五上交</span>
</div>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,supervisor">
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
    var leave = JSON.parse('${oaActLeaveJson}');
    //标记
    var flag = 0;
    if (flag === 0) {
        if (leave.principal === "" || leave.principal === undefined) {
            $('#principalContent').append('<textarea onkeyup="value=value.replace(/\\s+/g,\'\')" style="background-color: #ffffff;" class="approval-content-textarea" name="principalContent"></textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text"  name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
            flag = 1;
        } else {
            $('#principalContent').append('<textarea readonly class="approval-content-textarea">${oaActLeave.principalContent}</textarea><div class="approval-date">' +
                '<label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" value="${oaActLeave.principalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLeave.principal}" readonly></div>');
        }
    } else {
        $('#principalContent').append('<textarea readonly class="approval-content-textarea">${oaActLeave.principalContent}</textarea><div class="approval-date">' +
            '<label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" value="${oaActLeave.principalDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLeave.principal}" readonly></div>');
    }

    if (flag === 0) {
        if (leave.supervisor === "" || leave.supervisor === undefined) {
            $('#supervisorContent').append('<textarea onkeyup="value=value.replace(/\\s+/g,\'\')" style="background-color: #ffffff;" class="approval-content-textarea" name="supervisorContent"></textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                '<input class="approval-date-input" type="text"  name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
            flag = 1;
        } else {
            $('#supervisorContent').append('<textarea readonly class="approval-content-textarea">${oaActLeave.supervisorContent}</textarea><div class="approval-date">' +
                '<label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" value="${oaActLeave.supervisorDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
                '<input class="approval-signature-input" type="text" value="${oaActLeave.supervisor}" readonly></div>');
        }
    } else {
        $('#supervisorContent').append('<textarea readonly class="approval-content-textarea">${oaActLeave.supervisorContent}</textarea><div class="approval-date">' +
            '<label class="approval-date-label">日期 </label><input class="approval-date-input" type="text" value="${oaActLeave.supervisorDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>' +
            '<input class="approval-signature-input" type="text" value="${oaActLeave.supervisor}" readonly></div>');
    }


    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/leave/approvalSubmit',
            data: $('#oaActLeave').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    window.top.tips("提交成功！", 0, 1, 1000);
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
        $('#tool').show();
        $('#body,#return').css('width', '65%');
    }
</script>
</html>

