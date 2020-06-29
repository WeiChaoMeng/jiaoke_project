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
    <title>确认单审批单详情</title>
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


<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">经办部门</td>
        <td colspan="2" class="table-td-content">
            ${oaActConfirm.department}
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
        <td class="table-td-content" style="padding: 5px 10px;;line-height: 30px">
            ${oaActConfirm.companyPrincipal}
        </td>
        <td class="table-td-content" style="padding: 5px 10px;line-height: 30px">
            ${oaActConfirm.businessSupervisor}
        </td>
        <td class="table-td-content" style="padding: 5px 10px;line-height: 30px">
            ${oaActConfirm.financeSupervisor}
        </td>
        <td class="table-td-content" style="padding: 5px 10px;line-height: 30px">
            ${oaActConfirm.financialAudit}
        </td>
        <td class="table-td-content" style="padding: 5px 10px;line-height: 30px">
            ${oaActConfirm.operatingStatistics}
        </td>
        <td class="table-td-content" style="padding: 5px 10px;line-height: 30px">
            ${nickname}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">备注</td>
        <td colspan="5" class="table-td-textarea">
            <textarea class="table-remark" style="background-color: #e8e8e8" readonly>${oaActConfirm.remarks}</textarea>
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
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

