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
    <title>印章借用审批单处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActSealsBorrow.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActSealsBorrow.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActSealsBorrow.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActSealsBorrow.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActSealsBorrow.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span  class="table-file-title" title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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

<form id="oaActSealsBorrow">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">印章种类：</td>
            <td class="table-td-content">
                <c:choose>
                    <c:when test="${oaActSealsBorrow.seal == 0}">路驰公章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 1}">路驰合同章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 2}">路驰党支部章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 3}">路驰工会章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 4}">路驰法人章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 5}">路驰财务专用章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 6}">大兴公章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 7}">大兴合同章</c:when>
                </c:choose>
            </td>

            <td class="tdLabel">借用时间：</td>
            <td class="table-td-content">
                ${oaActSealsBorrow.borrowTime}
                <input type="hidden" name="id" value="${oaActSealsBorrow.id}">
                <input type="hidden" name="title" value="${oaActSealsBorrow.title}">
                <input type="hidden" name="seal" value="${oaActSealsBorrow.seal}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">盖章文件内容：</td>
            <td class="table-td-content" colspan="3">
                ${oaActSealsBorrow.content}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">借章人：</td>
            <td class="table-td-content">
                ${oaActSealsBorrow.borrower}
            </td>

            <td class="tdLabel">部门负责人：</td>
            <td class="table-td-content">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent">
                        <%--<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly="readonly">--%>
                        <%--<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    ${oaActSealsBorrow.principal}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">印章主管领导：</td>
            <td class="table-td-content" colspan="3">
                <shiro:hasAnyPermission name="seal_supervisor,specialChapter">
                    <div style="width: 100%;height: 100%;" id="sealSupervisorContent">
                        <%--<input type="text" class="formInput-readonly" name="sealSupervisor" value="${nickname}" readonly="readonly">--%>
                        <%--<input type="hidden" name="sealSupervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasAnyPermission>

                <shiro:lacksPermission name="seal_supervisor">
                    ${oaActSealsBorrow.sealSupervisor}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经办人：</td>
            <td class="table-td-content">
                <shiro:hasAnyPermission name="seal_operator,legalStamp,financeStamp">
                    <div style="width: 100%;height: 100%;" id="sealOperatorContent">
                        <%--<input type="text" class="formInput-readonly" name="sealOperator" value="${nickname}" readonly="readonly">--%>
                    </div>
                </shiro:hasAnyPermission>

                <shiro:lacksPermission name="seal_operator">
                    ${oaActSealsBorrow.sealOperator}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">归还时间：</td>
            <td class="table-td-content">
                <shiro:hasAnyPermission name="seal_operator,legalStamp,financeStamp">
                    <div style="width: 100%;height: 100%;" id="returnTimeContent">
                        <%--<input type="text" class="formInput-readonly" name="returnTime" value="<%=new SimpleDateFormat("yyyy-MM-dd HH").format(new Date())%>" readonly="readonly">--%>
                    </div>
                </shiro:hasAnyPermission>

                <shiro:lacksPermission name="seal_operator">
                    ${oaActSealsBorrow.returnTime}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,seal_supervisor,specialChapter,seal_operator,legalStamp,financeStamp">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var sealsBorrow = JSON.parse('${oaActSealsBorrowJson}');
    //标记
    var flag = 0;
    if (flag === 0) {
        if (sealsBorrow.principal === "" || sealsBorrow.principal === undefined) {
            $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#principalContent').append(sealsBorrow.principal);
        }
    } else {
        $('#principalContent').append(sealsBorrow.principal);
    }

    if (flag === 0) {
        if (sealsBorrow.sealSupervisor === "" || sealsBorrow.sealSupervisor === undefined) {
            $('#sealSupervisorContent').append('<input type="text" class="formInput-readonly" name="sealSupervisor" value="${nickname}" readonly="readonly"><input type="hidden" name="sealSupervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#sealSupervisorContent').append(sealsBorrow.sealSupervisor);
        }
    } else {
        $('#sealSupervisorContent').append(sealsBorrow.sealSupervisor);
    }

    if (flag === 0) {
        if (sealsBorrow.sealOperator === "" || sealsBorrow.sealOperator === undefined) {
            $('#sealOperatorContent').append('<input type="text" class="formInput-readonly" name="sealOperator" value="${nickname}" readonly="readonly">');
            $('#returnTimeContent').append('<input type="text" class="formInput-readonly" name="returnTime" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>" readonly="readonly">');
            flag = 1;
        } else {
            $('#sealOperatorContent').append(sealsBorrow.sealOperator);
            $('#returnTimeContent').append(sealsBorrow.returnTime);
        }
    } else {
        $('#sealOperatorContent').append(sealsBorrow.sealOperator);
        $('#returnTimeContent').append(sealsBorrow.returnTime);
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/sealsBorrow/approvalSubmit',
            data: $('#oaActSealsBorrow').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body,#return').css('width', '70%');
    }
</script>
</html>

