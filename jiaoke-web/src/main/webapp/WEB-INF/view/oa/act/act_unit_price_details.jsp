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
    <title>单价审批单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .tdLabel {
            text-align: right;
            padding-left: 10px;
        }

        .table-td-content {
            line-height: 35px;
            padding: 0 10px;
        }

        .formTable thead tr th {
            line-height: 40px;
            border: solid 1px #e5e5e5;
            text-align: center;
            background: #f6f6f6;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }

        .checked-box-style {
            vertical-align: middle;
            margin: 0 10px 0 5px;
            zoom: 120%;
        }
    </style>
</head>

<body id="body" style="width: 70%;">

<div class="table-title">
    <span>${oaActUnitPrice.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActUnitPrice.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActUnitPrice.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActUnitPrice.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActUnitPrice.annex}" delims="," var="annex">
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

<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">客户名称</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.customer}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">工程名称</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.engineering}
        </td>
    </tr>
    </tbody>
</table>

<table class="formTable" style="margin: 0">
    <thead>
    <tr>
        <th style="width: 55%">产品名称</th>
        <th style="width: 15%">数量</th>
        <th style="width: 15%">单价</th>
        <th style="width: 15%">金额(元)</th>
    </tr>
    </thead>

    <tbody id="tbo">
    <c:forEach items="${oaActUnitPrice.oaUnitPriceList}" var="list" varStatus="status">
        <tr>
            <td class="table-td-content">${list.item}</td>
            <td class="table-td-content" style="text-align: center;">${list.number}</td>
            <td class="table-td-content" style="text-align: center;">${list.price}</td>
            <td class="table-td-content" style="text-align: center;">${list.money}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel" rowspan="6">定价依据（文号）</td>
    </tr>

    <tr id="creditRating">
        <td class="table-td-content" colspan="3">
            信用等级：
            <c:choose>
                <c:when test="${oaActUnitPrice.creditRating == 0}">
                    一级客户<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    一级客户<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActUnitPrice.creditRating == 1}">
                    二级客户<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    二级客户<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActUnitPrice.creditRating == 2}">
                    三级客户<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    三级客户<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

    <tr id="unitNature">
        <td class="table-td-content" colspan="3">
            单位性质：
            <c:choose>
                <c:when test="${oaActUnitPrice.unitNature == 0}">
                    内部单位<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    内部单位<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActUnitPrice.unitNature == 1}">
                    外部单位<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    外部单位<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

    <tr id="paymentMethod">
        <td class="table-td-content" colspan="3">
            支付方式：
            <c:choose>
                <c:when test="${oaActUnitPrice.paymentMethod == 0}">
                    预付全款<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    预付全款<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActUnitPrice.paymentMethod == 1}">
                    当年支付全款<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    当年支付全款<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActUnitPrice.paymentMethod == 2}">
                    当年支付80%及以上<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    当年支付80%及以上<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

    <tr id="number">
        <td class="table-td-content" colspan="3">
            数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：
            <c:choose>
                <c:when test="${oaActUnitPrice.number == 0}">
                    50000吨以上<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    50000吨以上<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActUnitPrice.number == 1}">
                    10000吨-50000吨<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    10000吨-50000吨<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActUnitPrice.number == 2}">
                    5000吨-10000吨<input type="checkbox" checked class="checked-box-style" disabled>
                </c:when>
                <c:otherwise>
                    5000吨-10000吨<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

    <tr>
        <td class="table-td-content" colspan="3">
            投&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标：
            <c:choose>
                <c:when test="${oaActUnitPrice.tender == 0}">
                    重大工程<input type="checkbox" class="checked-box-style" checked disabled>
                </c:when>
                <c:otherwise>
                    重大工程<input type="checkbox" class="checked-box-style" disabled>
                </c:otherwise>
            </c:choose>

        </td>
    </tr>

    <tr>
        <td class="tdLabel">合同总价¥</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.contractValue}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">结清时间</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.settleTime}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">预付款¥</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.advanceCharge}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">联系人及电话</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.contactNumber}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">利润中心</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.profitCenter}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">运输方式及运距</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.modeShipping}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">经营部长审核</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.businessPrincipal}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">经营主管审核</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.businessSupervisor}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.companyPrincipal}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">备注</td>
        <td class="table-td-content" colspan="3">
            ${oaActUnitPrice.remarks}
        </td>
    </tr>
    </tbody>
</table>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
    //打印
    function printContent() {
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '70%');
    }
</script>
</html>

