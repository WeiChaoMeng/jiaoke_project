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
    <title>印章借用审批单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActSealsBorrow.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActSealsBorrow.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActSealsBorrow.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActSealsBorrow.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActSealsBorrow.annex}" delims="," var="annex">
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
        <td class="table-td-content" style="width: 30%;">
            <c:choose>
                <c:when test="${oaActSealsBorrow.seal == 0}">路驰公章</c:when>
                <c:when test="${oaActSealsBorrow.seal == 1}">路驰合同章</c:when>
                <c:when test="${oaActSealsBorrow.seal == 2}">路驰党支部章</c:when>
                <c:when test="${oaActSealsBorrow.seal == 3}">路驰工会章</c:when>
                <c:when test="${oaActSealsBorrow.seal == 4}">路驰法人章</c:when>
                <c:when test="${oaActSealsBorrow.seal == 5}">路驰财务专用章</c:when>
                <c:when test="${oaActSealsBorrow.seal == 6}">大兴公章</c:when>
                <c:when test="${oaActSealsBorrow.seal == 7}">大兴合同章</c:when>
            </c:choose>
        </td>

        <td class="tdLabel">借用时间</td>
        <td class="table-td-content" style="width: 30%;">
            ${oaActSealsBorrow.borrowTime}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">盖章文件内容</td>
        <td class="table-td-content" colspan="3">
            ${oaActSealsBorrow.content}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">借章人</td>
        <td class="table-td-content">
            ${oaActSealsBorrow.borrower}
        </td>

        <td class="tdLabel">部门负责人</td>
        <td class="table-td-content">
            ${oaActSealsBorrow.principal}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">印章主管领导</td>
        <td class="table-td-content" colspan="3">
            ${oaActSealsBorrow.sealManage}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">经办人</td>
        <td class="table-td-content">
            ${oaActSealsBorrow.sealOperator}
        </td>

        <td class="tdLabel">归还时间</td>
        <td class="table-td-content">
            ${oaActSealsBorrow.returnTime}
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
        $('#body,#return').css('width', '70%');
    }
</script>
</html>

