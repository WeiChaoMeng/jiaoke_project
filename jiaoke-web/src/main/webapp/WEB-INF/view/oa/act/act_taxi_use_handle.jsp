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
    <title>用车审批表(出租车)</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 65%">

<div class="table-title">
    <span>${oaActTaxiUse.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActTaxiUse.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActTaxiUse.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActTaxiUse.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActTaxiUse.annex}" delims="," var="annex">
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

<form id="oaActTaxiUse">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">申请使用人</td>
            <td class="table-td-content" style="width: 35%;">
                ${oaActTaxiUse.applicant}
                <input type="hidden" id="id" name="id" value="${oaActTaxiUse.id}">
                <input type="hidden" id="promoter" name="promoter" value="${oaActTaxiUse.promoter}">
                    <input type="hidden" name="departmentPrincipal" value="${oaActTaxiUse.departmentPrincipal}">
            </td>

            <td class="tdLabel">填表日期</td>
            <td class="table-td-content">
                ${oaActTaxiUse.fillingDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">事由</td>
            <td class="table-td-content" colspan="3" style="padding: 10px">
                <textarea class="approval-content-textarea" readonly>${oaActTaxiUse.reason}</textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用车时间</td>
            <td class="table-td-content">
                ${oaActTaxiUse.useTime}
            </td>

            <td class="tdLabel">目的地</td>
            <td class="table-td-content">
                ${oaActTaxiUse.destination}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审核人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent"></div>

                    <%--<input type="text" class="formInput-readonly" name="principal" value="${oaActTaxiUse.principal} ${nickname}" readonly>--%>
                    <%--<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    ${oaActTaxiUse.principal}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">批准人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent"></div>

                    <%--<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly>--%>
                    <%--<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    ${oaActTaxiUse.supervisor}
                </shiro:lacksPermission>
            </td>
        </tr>

        </tbody>
    </table>
</form>

<div class="notice-tips" style="text-align: left">
    <span class="notice-tips-script" style="display: block">说明：1.审核人为使用人部门负责人，批准人为使用人部门主管领导。</span>
    <span class="notice-tips-script" style="display: block;text-indent: 39px;">2.出租车票连同此审批单一并交综合办公室，通过综合办公室报销。</span>
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
    var taxiUse = JSON.parse('${oaActTaxiUseJson}');
    //标记
    var flag = 0;

    //被回退
    if (taxiUse.state === 0) {
        if (flag === 0) {

            var principalNums = JSON.parse('${principalNum}');
            //单个审批人
            if (principalNums === "noPrincipalNum") {
                if (taxiUse.principal === "" || taxiUse.principal === undefined) {
                    $('#principalContent').append(
                        '<input type="text" class="formInput-readonly" name="principal" value="${oaActTaxiUse.principal} ${nickname}" readonly>\n' +
                        '<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                } else {
                    $('#principalContent').append('${oaActTaxiUse.principal}');
                }
            } else {
                if (taxiUse.principal === undefined) {
                    $('#principalContent').append(
                        '<input type="text" class="formInput-readonly" name="principal" value="${oaActTaxiUse.principal} ${nickname}" readonly>\n' +
                        '<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                } else if ((taxiUse.principal).length === principalNums.length) {
                    $('#principalContent').append('${oaActTaxiUse.principal}');
                } else {
                    $('#principalContent').append(
                        '<input type="text" class="formInput-readonly" name="principal" value="${oaActTaxiUse.principal} ${nickname}" readonly>\n' +
                        '<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                }
            }

        } else {
            $('#principalContent').append('${oaActTaxiUse.principal}');
        }

        if (flag === 0) {
            if (taxiUse.supervisor === "" || taxiUse.supervisor === undefined) {
                $('#supervisorContent').append(
                    '<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly>\n' +
                    '<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#supervisorContent').append('${oaActTaxiUse.supervisor}');
            }
        } else {
            $('#supervisorContent').append('${oaActTaxiUse.supervisor}');
        }

        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    } else {
        $('#principalContent').append('${oaActTaxiUse.principal}');
        $('#supervisorContent').append('${oaActTaxiUse.supervisor}');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/taxiUse/approvalSubmit',
            data: $('#oaActTaxiUse').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '65%');
    }
</script>
</html>

