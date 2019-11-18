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
    <title>证照借用审批单（原件）详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body style="width: 70%" id="body">

<div class="table-title">
    <span>${oaActLicenceBorrow.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActLicenceBorrow.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActLicenceBorrow.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActLicenceBorrow.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActLicenceBorrow.annex}" delims="," var="annex">
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
        <td class="tdLabel">印章种类</td>
        <td class="table-td-content">
            <c:choose>
                <c:when test="${oaActLicenceBorrow.seal == 0}">路驰营业执照正本</c:when>
                <c:when test="${oaActLicenceBorrow.seal == 1}">路驰营业执照副本</c:when>
                <c:when test="${oaActLicenceBorrow.seal == 2}">路驰工会法人资格证书</c:when>
                <c:when test="${oaActLicenceBorrow.seal == 3}">大兴营业执照正本</c:when>
                <c:when test="${oaActLicenceBorrow.seal == 4}">大兴营业执照副本</c:when>
            </c:choose>
        </td>

        <td class="tdLabel">借用时间</td>
        <td class="table-td-content">
            ${oaActLicenceBorrow.borrowTime}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">用途</td>
        <td class="table-td-content" colspan="3">
            ${oaActLicenceBorrow.purpose}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">借用人</td>
        <td class="table-td-content" style="width: 340px">
            ${oaActLicenceBorrow.borrower}
        </td>

        <td class="tdLabel">部门负责人</td>
        <td class="table-td-content" style="width: 340px">
            ${oaActLicenceBorrow.principal}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">证照主管领导</td>
        <td class="table-td-content" colspan="3">
            ${oaActLicenceBorrow.licenceManage}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">经办人</td>
        <td class="table-td-content">
            ${oaActLicenceBorrow.licenceOperator}
        </td>

        <td class="tdLabel">归还时间</td>
        <td class="table-td-content">
            ${oaActLicenceBorrow.returnTime}
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
        $('#tool,#return').show();
        $('#body').css('width', '70%');
    }
</script>
</html>

