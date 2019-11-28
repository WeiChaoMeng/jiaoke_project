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
    <title>印章使用审批单处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body style="width: 75%" id="body">
<div class="table-title">
    <span>${oaActSealsUse.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details" style="border: solid 1px #eaeaea;">
        <div class="top-info-bar-user">
            <span>${oaActSealsUse.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActSealsUse.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActSealsUse.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details" style="border: solid 1px #eaeaea;">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActSealsUse.annex}" delims="," var="annex">
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

<form id="oaActSealsUse">
    <div>
        <span class="form-number-left" style="float: right;min-width: 140px;">编号 ${oaActSealsUse.number}</span>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">印章种类：</td>
            <td class="table-td-content">
                <c:choose>
                    <c:when test="${oaActSealsUse.seal == 0}">路驰公章</c:when>
                    <c:when test="${oaActSealsUse.seal == 1}">路驰合同章</c:when>
                    <c:when test="${oaActSealsUse.seal == 2}">路驰党支部章</c:when>
                    <c:when test="${oaActSealsUse.seal == 3}">路驰工会章</c:when>
                    <c:when test="${oaActSealsUse.seal == 4}">路驰法人章</c:when>
                    <c:when test="${oaActSealsUse.seal == 5}">路驰财务专用章</c:when>
                    <c:when test="${oaActSealsUse.seal == 6}">大兴公章</c:when>
                    <c:when test="${oaActSealsUse.seal == 7}">大兴合同章</c:when>
                </c:choose>
            </td>

            <td class="tdLabel">申请人：</td>
            <td class="table-td-content">
                ${oaActSealsUse.applicant}
                <input type="hidden" name="id" value="${oaActSealsUse.id}">
                <input type="hidden" name="seal" value="${oaActSealsUse.seal}">
                <input type="hidden" name="title" value="${oaActSealsUse.title}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">申请文件名称：</td>
            <td class="table-td-content" colspan="3">
                ${oaActSealsUse.name}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门负责人</td>
            <td class="table-td-content" style="width: 340px">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent">
                            <%--<input type="text" class="formInput-readonly" name="principal" value="${nickname}"--%>
                            <%--readonly="readonly">--%>
                            <%--<input type="hidden" name="principalDate"--%>
                            <%--value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    ${oaActSealsUse.principal}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">部门主管领导</td>
            <td class="table-td-content" style="width: 340px">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent">
                            <%--<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly">--%>
                            <%--<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasPermission>


                <shiro:lacksPermission name="supervisor">
                    ${oaActSealsUse.supervisor}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="line-height: 0;padding: 16px 0;text-align: center;">印章管理部门主管领导
                <span style="display: block;padding-top: 15px;">（涉及资金支出以外的文件）</span>
            </td>
            <td class="table-td-content">
                <shiro:hasAnyPermission name="seal_supervisor,specialChapter">
                    <div style="width: 100%;height: 100%;" id="sealSupervisorContent">
                            <%--<input type="text" class="formInput-readonly" name="sealManage" value="${nickname}" readonly="readonly">--%>
                            <%--<input type="hidden" name="sealManageDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasAnyPermission>
                <shiro:lacksPermission name="sealOperator">
                    ${oaActSealsUse.sealSupervisor}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">盖章人</td>
            <td class="table-td-content">
                <shiro:hasAnyPermission name="seal_operator,legalStamp,financeStamp">
                    <div style="width: 100%;height: 100%;" id="sealOperatorContent">
                            <%--<input type="text" class="formInput-readonly" name="sealOperator" value="${nickname}" readonly="readonly">--%>
                            <%--<input type="hidden" name="sealOperatorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                    </div>
                </shiro:hasAnyPermission>

                <shiro:lacksPermission name="sealOperator">
                    ${oaActSealsUse.sealOperator}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission
            name="principal,supervisor,seal_supervisor,specialChapter,seal_operator,legalStamp,financeStamp">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var sealsUse = JSON.parse('${oaActSealsUseJson}');
    //标记
    var flag = 0;
    if (flag === 0) {
        if (sealsUse.principal === "" || sealsUse.principal === undefined) {
            $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#principalContent').append(sealsUse.principal);
        }
    } else {
        $('#principalContent').append(sealsUse.principal);
    }


    if (flag === 0) {
        if (sealsUse.supervisor === "" || sealsUse.supervisor === undefined) {
            $('#supervisorContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly"><input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#supervisorContent').append(sealsUse.supervisor);
        }
    } else {
        $('#supervisorContent').append(sealsUse.supervisor);
    }

    if (flag === 0) {
        if (sealsUse.sealSupervisor === "" || sealsUse.sealSupervisor === undefined) {
            $('#sealSupervisorContent').append('<input type="text" class="formInput-readonly" name="sealSupervisor" value="${nickname}" readonly="readonly"><input type="hidden" name="sealSupervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#sealSupervisorContent').append(sealsUse.sealSupervisor);
        }
    } else {
        $('#sealSupervisorContent').append(sealsUse.sealSupervisor);
    }

    if (flag === 0) {
        if (sealsUse.sealOperator === "" || sealsUse.sealOperator === undefined) {
            $('#sealOperatorContent').append('<input type="text" class="formInput-readonly" name="sealOperator" value="${nickname}" readonly="readonly"><input type="hidden" name="sealOperatorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#sealOperatorContent').append(sealsUse.sealOperator);
        }
    } else {
        $('#sealOperatorContent').append(sealsUse.sealOperator);
    }


    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/sealsUse/approvalSubmit',
            data: $('#oaActSealsUse').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#tool,#return').show();
        $('#body').css('width', '75%');
    }
</script>
</html>

