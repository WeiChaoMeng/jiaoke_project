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
    <title>工程名称变更记录表详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActEngineering.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActEngineering.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActEngineering.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActEngineering.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActEngineering.annex}" delims="," var="annex">
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

<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">变更前工程名称</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeName}
        </td>

        <td class="tdLabel">变更后工程名称</td>
        <td class="table-td-content">
            ${oaActEngineering.afterName}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前用料单位</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeCompany}
        </td>

        <td class="tdLabel">变更后用料单位</td>
        <td class="table-td-content">
            ${oaActEngineering.afterCompany}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前所用混合料品种</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeVariety}
        </td>

        <td class="tdLabel">变更后所用混合料品种</td>
        <td class="table-td-content">
            ${oaActEngineering.afterVariety}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前用料日期</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeData}
        </td>

        <td class="tdLabel">变更后用料日期</td>
        <td class="table-td-content">
            ${oaActEngineering.afterData}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前用料数量</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeNumber}
        </td>

        <td class="tdLabel">变更后用料数量</td>
        <td class="table-td-content">
            ${oaActEngineering.afterNumber}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">用料单位</td>
        <td class="table-td-content">
            ${oaActEngineering.useCompany}
        </td>

        <td class="tdLabel">业务员</td>
        <td class="table-td-content">
            ${oaActEngineering.salesman}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">经营部长</td>
        <td class="table-td-content">
            ${oaActEngineering.minister}
        </td>

        <td class="tdLabel">经营负责人</td>
        <td class="table-td-content">
            ${oaActEngineering.principal}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">备注</td>
        <td colspan="3" class="table-td-content" style="height: 60px">
            ${oaActEngineering.remark}
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
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

