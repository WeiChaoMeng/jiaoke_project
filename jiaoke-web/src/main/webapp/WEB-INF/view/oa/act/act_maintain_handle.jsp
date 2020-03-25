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
    <title>设备维修申请单审批</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActMaintain.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActMaintain.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActMaintain.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActMaintain.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActMaintain.annex}" delims="," var="annex">
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

<form id="oaActMaintain">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">单位</td>
            <td class="table-td-content" colspan="2">
                <c:choose>
                    <c:when test="${oaActMaintain.company == 0}">
                        北京市政路桥建材集团有限公司路驰分公司
                    </c:when>
                </c:choose>
            </td>

            <td class="tdLabel">申请日期</td>
            <td class="table-td-content" colspan="2">
                ${oaActMaintain.applyTime}
                <input type="hidden" name="id" value="${oaActMaintain.id}">
                <input type="hidden" name="title" value="${oaActMaintain.title}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">申请部门</td>
            <td class="table-td-content" colspan="2">
                ${oaActMaintain.department}
            </td>

            <td class="tdLabel">申请人</td>
            <td class="table-td-content" colspan="2">
                ${oaActMaintain.applicant}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">设备名称</td>
            <td class="table-td-content" colspan="2">
                ${oaActMaintain.deviceName}
            </td>

            <td class="tdLabel">规格型号</td>
            <td class="table-td-content" colspan="2">
                ${oaActMaintain.specification}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">故障描述</td>
            <td colspan="5" class="table-td-content" style="padding: 10px;height: 60px">
                ${oaActMaintain.faultDescription}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">维修内容</td>
            <td colspan="5" class="table-td-content" style="padding: 10px;height: 60px">
                ${oaActMaintain.content}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">预估金额</td>
            <td colspan="5" class="table-td-content">
                ${oaActMaintain.amount}
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
                    ${oaActMaintain.principal}
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
                    ${oaActMaintain.supervisor}
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
                    ${oaActMaintain.companyPrincipal}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,supervisor,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var maintain = JSON.parse('${oaActMaintainJson}');
    //标记
    var flag = 0;
    if (flag === 0) {
        if (maintain.principal === "" || maintain.principal === undefined) {
            $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#principalContent').append(maintain.principal);
        }
    } else {
        $('#principalContent').append(maintain.principal);
    }

    if (flag === 0) {
        if (maintain.supervisor === "" || maintain.supervisor === undefined) {
            $('#supervisorContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly"><input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#supervisorContent').append(maintain.supervisor);
        }
    } else {
        $('#supervisorContent').append(maintain.supervisor);
    }

    if (flag === 0) {
        if (maintain.companyPrincipal === "" || maintain.companyPrincipal === undefined) {
            $('#companyPrincipalContent').append('<input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}" readonly="readonly"><input type="hidden" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#companyPrincipalContent').append(maintain.companyPrincipal);
        }
    } else {
        $('#companyPrincipalContent').append(maintain.companyPrincipal);
    }

    //知会
    if(flag === 0){
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/maintain/approvalSubmit',
            data: $('#oaActMaintain').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '80%');
    }
</script>
</html>

