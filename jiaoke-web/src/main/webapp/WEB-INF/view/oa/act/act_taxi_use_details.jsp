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
    <title>用车审批表(出租车)详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
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
                                <span class="table-file-title" title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
                                <a class="table-file-download icon"
                                   <%--href="/fileDownloadHandle/download?fileName=${annex}"--%>
                                   href="/fileDownloadHandle/download?fileName=${fn:substring(annex,0,annex.indexOf("_"))}${fn:substring(annex,annex.lastIndexOf("."),annex.length())}"
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
        <td class="tdLabel">申请使用人</td>
        <td class="table-td-content" style="width: 35%;">
            ${oaActTaxiUse.applicant}
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
            ${oaActTaxiUse.principal}
        </td>

        <td class="tdLabel">批准人</td>
        <td class="table-td-content">
            ${oaActTaxiUse.supervisor}
        </td>
    </tr>
    </tbody>
</table>

<div class="notice-tips" style="text-align: left">
    <span class="notice-tips-script" style="display: block">说明：1.审核人为使用人部门负责人，批准人为使用人部门主管领导。</span>
    <span class="notice-tips-script" style="display: block;text-indent: 39px;">2.出租车票连同此审批单一并交综合办公室，通过综合办公室报销。</span>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //打印
    function printContent() {
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '65%');
    }
</script>
</html>

