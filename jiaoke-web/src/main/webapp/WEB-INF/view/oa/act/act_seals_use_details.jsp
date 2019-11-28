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
    <title>印章使用审批单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body style="width: 75%" id="body">

<div class="table-title">
    <span>${oaActSealsUse.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActSealsUse.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActSealsUse.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActSealsUse.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActSealsUse.annex}" delims="," var="annex">
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

<div>
    <span class="form-number-left" style="float: right;min-width: 140px;">编号  ${oaActSealsUse.number}</span>
</div>

<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">印章种类</td>
        <td class="table-td-content">
            <c:choose>
                <c:when test="${oaActSealsUse.seal == 0}">路驰公章</c:when>
                <c:when test="${oaActSealsUse.seal == 1}">路驰合同章</c:when>
                <c:when test="${oaActSealsUse.seal == 2}">路驰党支部章</c:when>
                <c:when test="${oaActSealsUse.seal == 3}">路驰工会章</c:when>
                <c:when test="${oaActSealsUse.seal == 4}">路驰法人章</c:when>
                <c:when test="${oaActSealsUse.seal == 5}">路驰财务专用章</c:when>
                <c:when test="${oaActSealsUse.seal == 6}">大兴公章</c:when>
                <c:when test="${oaActSealsUse.seal == 7}">大兴合同章</c:when>
            </c:choose>
        </td>

        <td class="tdLabel">申请人</td>
        <td class="table-td-content">
            ${oaActSealsUse.applicant}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">申请文件名称</td>
        <td class="table-td-content" colspan="3">
            ${oaActSealsUse.name}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">部门负责人</td>
        <td class="table-td-content" style="width: 340px">
            ${oaActSealsUse.principal}
        </td>

        <td class="tdLabel">部门主管领导</td>
        <td class="table-td-content" style="width: 340px">
            ${oaActSealsUse.supervisor}
        </td>
    </tr>

    <tr>
        <td class="tdLabel" style="line-height: 0;padding: 16px 0;text-align: center;">印章管理部门主管领导
            <span style="display: block;padding-top: 15px;">（涉及资金支出以外的文件）</span>
        </td>
        <td class="table-td-content">
            ${oaActSealsUse.sealSupervisor}
        </td>

        <td class="tdLabel">盖章人</td>
        <td class="table-td-content">
            ${oaActSealsUse.sealOperator}
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
        $('#body').css('width', '75%');
    }
</script>
</html>

