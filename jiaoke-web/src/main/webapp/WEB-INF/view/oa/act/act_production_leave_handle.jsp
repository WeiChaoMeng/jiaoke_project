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
    <title>生产假审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 65%">

<div class="table-title">
    <span>${oaActProductionLeave.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActProductionLeave.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActProductionLeave.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActProductionLeave.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActProductionLeave.annex}" delims="," var="annex">
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
    <input type="text" class="filling-date-content" value="${oaActProductionLeave.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<form id="oaActProductionLeave">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">部门</td>
            <td class="table-td-content" style="width: 34%">
                ${oaActProductionLeave.department}
                <input type="hidden" name="id" value="${oaActProductionLeave.id}">
                <input type="hidden" name="promoter" value="${oaActProductionLeave.promoter}">
            </td>

            <td class="tdLabel">姓名</td>
            <td class="table-td-content">
                ${oaActProductionLeave.name}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">生育假天数</td>
            <td class="table-td-content">
                ${oaActProductionLeave.maternityLeave}
            </td>

            <td class="tdLabel">申请休假时间</td>
            <td class="table-td-content">
                ${oaActProductionLeave.applyDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">晚育假天数</td>
            <td class="table-td-content">
                ${oaActProductionLeave.lateChildbirth}
            </td>

            <td class="tdLabel">实际休假时间</td>
            <td class="table-td-content">
                ${oaActProductionLeave.actualDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">本人签字</td>
            <td class="table-td-content">
                ${oaActProductionLeave.promoterStr}
            </td>

            <td class="tdLabel">主管</td>
            <td class="table-td-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    ${oaActProductionLeave.supervisor}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">人事主管</td>
            <td class="table-td-content">
                <shiro:hasPermission name="personnel">
                    <div style="width: 100%;height: 100%;" id="personnelContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel">
                    ${oaActProductionLeave.personnel}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">总经理</td>
            <td class="table-td-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    ${oaActProductionLeave.companyPrincipal}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="supervisor,personnel,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var productionLeave = JSON.parse('${oaActProductionLeaveJson}');
    //标记
    var flag = 0;

    if (productionLeave.state === 0) {
        if (flag === 0) {
            if (productionLeave.supervisor === "" || productionLeave.supervisor === undefined) {
                $('#supervisorContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#supervisorContent').append(productionLeave.supervisor);
            }
        } else {
            $('#supervisorContent').append(productionLeave.supervisor);
        }

        if (flag === 0) {
            if (productionLeave.personnel === "" || productionLeave.personnel === undefined) {
                $('#personnelContent').append('<input type="text" class="formInput-readonly" name="personnel" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#personnelContent').append(productionLeave.personnel);
            }
        } else {
            $('#personnelContent').append(productionLeave.personnel);
        }

        if (flag === 0) {
            if (productionLeave.companyPrincipal === "" || productionLeave.companyPrincipal === undefined) {
                $('#companyPrincipalContent').append('<input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#companyPrincipalContent').append(productionLeave.companyPrincipal);
            }
        } else {
            $('#companyPrincipalContent').append(productionLeave.companyPrincipal);
        }

        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }

    } else {
        $('#supervisorContent').append(productionLeave.supervisor);
        $('#companyPrincipalContent').append(productionLeave.companyPrincipal);
        $('#personnelContent').append(productionLeave.personnel);
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/productionLeave/approvalSubmit',
            data: $('#oaActProductionLeave').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '65%');
    }
</script>
</html>

