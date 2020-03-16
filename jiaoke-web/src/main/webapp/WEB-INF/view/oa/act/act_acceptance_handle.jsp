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
    <title>验收单处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActAcceptance.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActAcceptance.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActAcceptance.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActAcceptance.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActAcceptance.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title" title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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

<form id="oaActAcceptance">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">维修厂家：</td>
            <td colspan="5" class="table-td-content">
                ${oaActAcceptance.factory}
                <input type="hidden" name="id" value="${oaActAcceptance.id}">
                <input type="hidden" name="title" value="${oaActAcceptance.title}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">维修内容：</td>
            <td colspan="5" class="table-td-content">
                ${oaActAcceptance.content}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总计：</td>
            <td colspan="2" class="table-td-content">
                ${oaActAcceptance.amount}
            </td>

            <td class="tdLabel">申请人</td>
            <td colspan="2" class="table-td-content" colspan="2">
                ${oaActAcceptance.applicant}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">验收人</td>
            <td class="table-td-content" colspan="2">
                <shiro:hasPermission name="accepter">
                    <div style="width: 100%;height: 100%;" id="accepterContent">
                            <%--<input type="text" class="formInput-readonly" name="accepter" value="${nickname}" readonly>--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="accepter">
                    ${oaActAcceptance.accepter}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">日期</td>
            <td class="table-td-content" colspan="2">
                <shiro:hasPermission name="accepter">
                    <div style="width: 100%;height: 100%;" id="acceptanceDateContent">
                            <%--<input type="text" class="formInput-readonly" name="acceptanceDate" value="${nickname}" readonly>--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="accepter">
                    ${oaActAcceptance.acceptanceDate}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门负责人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent">
                            <%--<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly="readonly">--%>
                            <%--<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    ${oaActAcceptance.principal}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">部门主管</td>
            <td class="table-td-content" style="width: 18.5%;">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent">
                            <%--<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly">--%>
                            <%--<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    ${oaActAcceptance.supervisor}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">总经理</td>
            <td class="table-td-content" style="width: 18.5%;">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent">
                            <%--<input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}" readonly="readonly">--%>
                            <%--<input type="hidden" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    ${oaActAcceptance.companyPrincipal}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="accepter,principal,supervisor,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var acceptance = JSON.parse('${oaActAcceptanceJson}');
    //标记
    var flag = 0;
    if (flag === 0) {
        if (acceptance.accepter === "" || acceptance.accepter === undefined) {
            $('#accepterContent').append('<input type="text" class="formInput-readonly" name="accepter" value="${nickname}" readonly="readonly">');
            $('#acceptanceDateContent').append('<input type="text" class="formInput-readonly" name="acceptanceDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>');
            flag = 1;
        } else {
            $('#accepterContent').append(acceptance.accepter);
            $('#acceptanceDateContent').append(acceptance.acceptanceDate);
        }
    } else {
        $('#accepterContent').append(acceptance.accepter);
        $('#acceptanceDateContent').append(acceptance.acceptanceDate);
    }

    if (flag === 0) {
        if (acceptance.principal === "" || acceptance.principal === undefined) {
            $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#principalContent').append(acceptance.principal);
        }
    } else {
        $('#principalContent').append(acceptance.principal);
    }

    if (flag === 0) {
        if (acceptance.supervisor === "" || acceptance.supervisor === undefined) {
            $('#supervisorContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly"><input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#supervisorContent').append(acceptance.supervisor);
        }
    } else {
        $('#supervisorContent').append(acceptance.supervisor);
    }

    if (flag === 0) {
        if (acceptance.companyPrincipal === "" || acceptance.companyPrincipal === undefined) {
            $('#companyPrincipalContent').append('<input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}" readonly="readonly"><input type="hidden" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#companyPrincipalContent').append(acceptance.companyPrincipal);
        }
    } else {
        $('#companyPrincipalContent').append(acceptance.companyPrincipal);
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/acceptance/approvalSubmit',
            data: $('#oaActAcceptance').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body,#return').css('width', '80%');
    }
</script>
</html>

