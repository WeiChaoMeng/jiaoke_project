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
    <title>确认单审批单审批</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .formTable thead tr th {
            line-height: 40px;
            border: solid 1px #e5e5e5;
            text-align: center;
            background: #f6f6f6;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActConfirm.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActConfirm.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActConfirm.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActConfirm.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActConfirm.annex}" delims="," var="annex">
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

<form id="oaActConfirm">
    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">经办部门</td>
            <td colspan="2" class="table-td-content">
                ${oaActConfirm.department}
                <input type="hidden" name="id" value="${oaActConfirm.id}">
                <input type="hidden" name="promoter" value="${oaActConfirm.promoter}">
            </td>

            <td class="tdLabel">经办人</td>
            <td colspan="2" class="table-td-content">
                ${oaActConfirm.operator}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">确认名称</td>
            <td colspan="2" class="table-td-content">
                ${oaActConfirm.name}
            </td>

            <td class="tdLabel">确认金额（元）</td>
            <td colspan="2" class="table-td-content">
                ${oaActConfirm.total}
            </td>
        </tr>

        </tbody>
    </table>

    <table class="formTable" style="margin: 0">
        <tbody id="tbo">
        <c:forEach items="${oaActConfirm.oaConfirmList}" var="list" varStatus="status">
            <tr>
                <td class="tdLabel" style="width: 10%">品种</td>
                <td class="table-td-content" style="width: 20%">
                        ${list.variety}
                </td>

                <td class="tdLabel" style="width: 10%">单价（元/吨）</td>
                <td class="table-td-content">
                        ${list.univalent}
                </td>

                <td class="tdLabel" style="width: 10%">数量（吨）</td>
                <td class="table-td-content">
                        ${list.number}
                </td>

                <td class="tdLabel" style="width: 10%">金额（元）</td>
                <td class="table-td-content">
                        ${list.money}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">数量是否与ERP一致</td>
            <td colspan="5" class="table-td-content">
                ${oaActConfirm.erp}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">单价是否与合同一致</td>
            <td colspan="5" class="table-td-content">
                ${oaActConfirm.contract}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">单位（全称）</td>
            <td colspan="5" class="table-td-content">
                ${oaActConfirm.unit}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">工程名称（全称）</td>
            <td colspan="5" class="table-td-content">
                ${oaActConfirm.projectName}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审批时间</td>
            <td colspan="5" class="table-td-content">
                ${oaActConfirm.approvalTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="text-align: center">总经理</td>
            <td class="tdLabel" style="text-align: center">经营主管</td>
            <td class="tdLabel" style="text-align: center">财务主管</td>
            <td class="tdLabel" style="text-align: center">财务审核</td>
            <td class="tdLabel" style="text-align: center">经营统计</td>
            <td class="tdLabel" style="text-align: center">业务</td>
        </tr>

        <tr>
            <td class="table-td-content" style="padding: 5px 10px;height: 40px;">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    ${oaActConfirm.companyPrincipal}
                </shiro:lacksPermission>
            </td>

            <td class="table-td-content" style="padding: 5px 10px">
                <shiro:hasPermission name="operating_supervisor">
                    <div style="width: 100%;height: 100%;" id="operatingSupervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="operating_supervisor">
                    ${oaActConfirm.businessSupervisor}
                </shiro:lacksPermission>
            </td>

            <td class="table-td-content" style="padding: 5px 10px">
                <shiro:hasPermission name="finance_principal">
                    <div style="width: 100%;height: 100%;" id="financePrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="finance_principal">
                    ${oaActConfirm.financeSupervisor}
                </shiro:lacksPermission>
            </td>

            <td class="table-td-content" style="padding: 5px 10px">
                <shiro:hasPermission name="finance_review">
                    <div style="width: 100%;height: 100%;" id="financeReviewContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="finance_review">
                    ${oaActConfirm.financialAudit}
                </shiro:lacksPermission>
            </td>

            <td class="table-td-content" style="padding: 5px 10px">
                <shiro:hasPermission name="operating_statistics">
                    <div style="width: 100%;height: 100%;" id="operatingStatisticsContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="operating_statistics">
                    ${oaActConfirm.operatingStatistics}
                </shiro:lacksPermission>
            </td>

            <td class="table-td-content" style="padding: 5px 10px"></td>
        </tr>

        <tr>
            <td class="tdLabel">备注</td>
            <td colspan="5" class="table-td-textarea">
                <textarea class="table-remark" style="background-color: #e8e8e8"
                          readonly>${oaActConfirm.remarks}</textarea>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" style="margin-top: 20px" id="return">
    <shiro:hasAnyPermission
            name="company_principal,operating_supervisor,finance_principal,operating_statistics,finance_review">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var confirm = JSON.parse('${oaActConfirmJson}');
    //标记
    var flag = 0;

    if (confirm.state === 0) {
        if (flag === 0) {
            if (confirm.operatingStatistics === "" || confirm.operatingStatistics === undefined) {
                $('#operatingStatisticsContent').append('<input type="text" class="formInput-readonly" name="operatingStatistics" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="operatingStatisticsDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#operatingStatisticsContent').append(confirm.operatingStatistics);
            }
        } else {
            $('#operatingStatisticsContent').append(confirm.operatingStatistics);
        }

        if (flag === 0) {
            if (confirm.financialAudit === "" || confirm.financialAudit === undefined) {
                $('#financeReviewContent').append('<input type="text" class="formInput-readonly" name="financialAudit" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="financialAuditDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#financeReviewContent').append(confirm.financialAudit);
            }
        } else {
            $('#financeReviewContent').append(confirm.financialAudit);
        }

        if (flag === 0) {
            if (confirm.financeSupervisor === "" || confirm.financeSupervisor === undefined) {
                $('#financePrincipalContent').append('<input type="text" class="formInput-readonly" name="financeSupervisor" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="financeSupervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#financePrincipalContent').append(confirm.financeSupervisor);
            }
        } else {
            $('#financePrincipalContent').append(confirm.financeSupervisor);
        }

        if (flag === 0) {
            if (confirm.businessSupervisor === "" || confirm.businessSupervisor === undefined) {
                $('#operatingSupervisorContent').append('<input type="text" class="formInput-readonly" name="businessSupervisor" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="businessSupervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#operatingSupervisorContent').append(confirm.businessSupervisor);
            }
        } else {
            $('#operatingSupervisorContent').append(confirm.businessSupervisor);
        }

        if (flag === 0) {
            if (confirm.companyPrincipal === "" || confirm.companyPrincipal === undefined) {
                $('#companyPrincipalContent').append('<input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}" readonly="readonly">' +
                    '<input type="hidden" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#companyPrincipalContent').append(confirm.companyPrincipal);
            }
        } else {
            $('#companyPrincipalContent').append(confirm.companyPrincipal);
        }

        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    } else {
        $('#operatingStatisticsContent').append(confirm.operatingStatistics);
        $('#financeReviewContent').append(confirm.financialAudit);
        $('#financePrincipalContent').append(confirm.financeSupervisor);
        $('#operatingSupervisorContent').append(confirm.businessSupervisor);
        $('#companyPrincipalContent').append(confirm.companyPrincipal);
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/confirm/approvalSubmit',
            data: $('#oaActConfirm').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '80%');
    }
</script>
</html>

