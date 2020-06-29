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
    <title>年休假审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 65%">

<div class="table-title">
    <span>${oaActAnnualLeave.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActAnnualLeave.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActAnnualLeave.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActAnnualLeave.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActAnnualLeave.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}</span>
                                <a class="table-file-download icon"
                                   href="javascript:location.href=encodeURI('/fileDownloadHandle/download?fileName=${annex}')"
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
    <input type="text" class="filling-date-content" value="${oaActAnnualLeave.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<form id="oaActAnnualLeave">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">部门</td>
            <td class="table-td-content" style="width: 315px;">
                ${oaActAnnualLeave.department}
                <input type="hidden" name="id" value="${oaActAnnualLeave.id}">
                <input type="hidden" name="promoter" value="${oaActAnnualLeave.promoter}">
            </td>

            <td class="tdLabel">姓名</td>
            <td class="table-td-content">
                ${oaActAnnualLeave.name}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">享受休假天数</td>
            <td class="table-td-content">
                ${oaActAnnualLeave.total}
            </td>

            <td class="tdLabel">计划休假时间</td>
            <td class="table-td-content">
                ${oaActAnnualLeave.planDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">累计享受休假天数</td>
            <td class="table-td-content">
                ${oaActAnnualLeave.cumulative}
            </td>

            <td class="tdLabel">实际休假时间</td>
            <td class="table-td-content">
                ${oaActAnnualLeave.actualDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">本人签字</td>
            <td class="table-td-content">
                ${oaActAnnualLeave.promoterStr}
            </td>

            <td class="tdLabel">主管</td>
            <td class="table-td-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    ${oaActAnnualLeave.supervisor}
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
                    ${oaActAnnualLeave.personnel}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">总经理</td>
            <td class="table-td-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    ${oaActAnnualLeave.companyPrincipal}
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
    var annualLeave = JSON.parse('${oaActAnnualLeaveJson}');
    //标记
    var flag = 0;

    if (annualLeave.state === 0) {
        if (flag === 0) {
            if (annualLeave.supervisor === "" || annualLeave.supervisor === undefined) {
                $('#supervisorContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#supervisorContent').append(annualLeave.supervisor);
            }
        } else {
            $('#supervisorContent').append(annualLeave.supervisor);
        }

        if (flag === 0) {
            if (annualLeave.personnel === "" || annualLeave.personnel === undefined) {
                $('#personnelContent').append('<input type="text" class="formInput-readonly" name="personnel" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="personnelDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#personnelContent').append(annualLeave.personnel);
            }
        } else {
            $('#personnelContent').append(annualLeave.personnel);
        }

        if (flag === 0) {
            if (annualLeave.companyPrincipal === "" || annualLeave.companyPrincipal === undefined) {
                $('#companyPrincipalContent').append('<input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#companyPrincipalContent').append(annualLeave.companyPrincipal);
            }
        } else {
            $('#companyPrincipalContent').append(annualLeave.companyPrincipal);
        }

        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    } else {
        $('#supervisorContent').append(annualLeave.supervisor);
        $('#companyPrincipalContent').append(annualLeave.companyPrincipal);
        $('#personnelContent').append(annualLeave.personnel);
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/annualLeave/approvalSubmit',
            data: $('#oaActAnnualLeave').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '65%');
    }
</script>
</html>

