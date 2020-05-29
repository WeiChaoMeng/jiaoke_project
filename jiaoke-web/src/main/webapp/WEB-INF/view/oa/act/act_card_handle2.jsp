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
    <title>饭卡申请单审批处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActCard.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActCard.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActCard.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActCard.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActCard.annex}" delims="," var="annex">
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

<form id="oaActCard">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">申请人</td>
            <td class="table-td-content">
                ${oaActCard.applicant}
                <input type="hidden" name="id" value="${oaActCard.id}">
                <input type="hidden" name="title" value="${oaActCard.title}">
                <input type="hidden" name="promoter" value="${oaActCard.promoter}">
                <input type="hidden" name="departmentPrincipal" value="${oaActCard.departmentPrincipal}">
            </td>

            <td class="tdLabel">申请时间</td>
            <td class="table-td-content">
                ${oaActCard.applyTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">所属单位</td>
            <td class="table-td-content" style="padding: 10px;width: 30%;">
                ${oaActCard.company}
            </td>

            <td class="tdLabel">事由</td>
            <td class="table-td-content" style="padding: 10px;width: 30%;">
                ${oaActCard.reason}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">拟使用期限(开始)</td>
            <td class="table-td-content">
                ${oaActCard.startTime}
            </td>


            <td class="tdLabel">拟使用期限(结束)</td>
            <td class="table-td-content">
                ${oaActCard.endTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">关联部门负责人</td>
            <td colspan="5" class="approval-content">
                <div style="width: 49%;float: left">
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;" id="principalContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea readonly class="approval-content-textarea">${oaActCard.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期</label>
                            <input class="approval-date-input" type="text" value="${oaActCard.principalDate}" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字</label>
                            <input class="approval-signature-input" type="text" value="${oaActCard.principal}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div style="width: 49%;float: right">
                    <shiro:hasPermission name="principal">
                        <div style="width: 100%;" id="principalContentT"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="principal">
                        <textarea readonly class="approval-content-textarea">${oaActCard.principalContentT}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期</label>
                            <input class="approval-date-input" type="text" value="${oaActCard.principalDateT}" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字</label>
                            <input class="approval-signature-input" type="text" value="${oaActCard.principalT}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">关联部门领导主管</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    <textarea readonly class="approval-content-textarea">${oaActCard.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActCard.supervisorDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActCard.supervisor}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">主管部门负责人</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="card_approval">
                    <div style="width: 100%;height: 100%;" id="cardApprovalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="card_approval">
                    <textarea readonly class="approval-content-textarea">${oaActCard.cardApprovalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActCard.cardApprovalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActCard.cardApproval}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,supervisor,card_approval">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //流程执行步骤
    var card = JSON.parse('${oaActCardJson}');
    //标记
    var flag = 0;

    if (card.state === 0) {
        if (flag === 0) {
            if (card.principal === "" || card.principal === undefined) {
                $('#principalContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" style="background-color: #ffffff" name="principalContent"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                    '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#principalContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.principalContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                    '<input class="approval-date-input" type="text" value="${oaActCard.principalDate}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActCard.principal}" readonly></div>');
            }
        } else {
            $('#principalContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.principalContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                '<input class="approval-date-input" type="text" value="${oaActCard.principalDate}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                '<input class="approval-signature-input" type="text" value="${oaActCard.principal}" readonly></div>');
        }

        if (flag === 0) {
            if (card.principalT === "" || card.principalT === undefined) {
                $('#principalContentT').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" style="background-color: #ffffff" name="principalContentT"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                    '<input class="approval-date-input" type="text" name="principalDateT" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" name="principalT" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#principalContentT').append('<textarea readonly class="approval-content-textarea">${oaActCard.principalContentT}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                    '<input class="approval-date-input" type="text" value="${oaActCard.principalDateT}" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActCard.principalT}" readonly></div>');
            }
        } else {
            $('#principalContentT').append('<textarea readonly class="approval-content-textarea">${oaActCard.principalContentT}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                '<input class="approval-date-input" type="text" value="${oaActCard.principalDateT}" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                '<input class="approval-signature-input" type="text" value="${oaActCard.principalT}" readonly></div>');
        }

        if (flag === 0) {
            if (card.supervisor === "" || card.supervisor === undefined) {
                $('#supervisorContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" style="background-color: #ffffff" name="supervisorContent"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                    '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#supervisorContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.supervisorContent}</textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期</label><input class="approval-date-input" type="text" value="${oaActCard.supervisorDate}" readonly>' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActCard.supervisor}"readonly></div>');
            }
        } else {
            $('#supervisorContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.supervisorContent}</textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期</label><input class="approval-date-input" type="text" value="${oaActCard.supervisorDate}" readonly>' +
                '</div><div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                '<input class="approval-signature-input" type="text" value="${oaActCard.supervisor}"readonly></div>');

        }

        if (flag === 0) {
            if (card.cardApproval === "" || card.cardApproval === undefined) {
                $('#cardApprovalContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" style="background-color: #ffffff" name="cardApprovalContent"></textarea>' +
                    '<div class="approval-date"><label class="approval-date-label">日期</label><input class="approval-date-input" type="text" name="cardApprovalDate"' +
                    'value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>"readonly></div>' +
                    '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" name="cardApproval"value="${nickname}" readonly></div>');
                flag = 1;
            } else {
                $('#cardApprovalContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.cardApprovalContent}</textarea><div class="approval-date">' +
                    '<label class="approval-date-label">日期</label><input class="approval-date-input" type="text" value="${oaActCard.cardApprovalDate}" readonly>' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                    '<input class="approval-signature-input" type="text" value="${oaActCard.cardApproval}" readonly></div>');
            }
        } else {
            $('#cardApprovalContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.cardApprovalContent}</textarea><div class="approval-date">' +
                '<label class="approval-date-label">日期</label><input class="approval-date-input" type="text" value="${oaActCard.cardApprovalDate}" readonly>' +
                '</div><div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                '<input class="approval-signature-input" type="text" value="${oaActCard.cardApproval}" readonly></div>');

        }
        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    } else {
        $('#principalContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.principalContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期</label>' +
            '<input class="approval-date-input" type="text" value="${oaActCard.principalDate}" readonly></div>' +
            '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
            '<input class="approval-signature-input" type="text" value="${oaActCard.principal}" readonly></div>');
        $('#supervisorContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.supervisorContent}</textarea>' +
            '<div class="approval-date"><label class="approval-date-label">日期</label><input class="approval-date-input" type="text" value="${oaActCard.supervisorDate}" readonly>' +
            '</div><div class="approval-signature"><label class="approval-signature-label">签字</label>' +
            '<input class="approval-signature-input" type="text" value="${oaActCard.supervisor}"readonly></div>');
        $('#cardApprovalContent').append('<textarea readonly class="approval-content-textarea">${oaActCard.cardApprovalContent}</textarea><div class="approval-date">' +
            '<label class="approval-date-label">日期</label><input class="approval-date-input" type="text" value="${oaActCard.cardApprovalDate}" readonly>' +
            '</div><div class="approval-signature"><label class="approval-signature-label">签字</label>' +
            '<input class="approval-signature-input" type="text" value="${oaActCard.cardApproval}" readonly></div>');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }


    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/card/approvalSubmit',
            data: $('#oaActCard').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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

