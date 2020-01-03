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
    <title>离职会签表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 60%">

<div class="table-title">
    <span>${oaActDeparture.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActDeparture.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActDeparture.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActDeparture.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActDeparture.annex}" delims="," var="annex">
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

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content" style="width: 35%">
            ${oaActDeparture.name}
        </td>

        <td class="tdLabel">离职日期</td>
        <td class="table-td-content">
            ${oaActDeparture.departureDate}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">部门</td>
        <td class="tdLabel" style="text-align: center;">签字(部长、主管)</td>
        <td class="tdLabel" colspan="2" style="text-align: center;">备注</td>
    </tr>

    <tr>
        <td class="tdLabel">综合办公室</td>
        <td class="table-td-content" style="padding: 5px 10px;">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;" value="${oaActDeparture.officePrincipal}" readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.officeSupervisor}" readonly>
        </td>

        <td class="tdLabel">备注</td>
        <td class="table-td-content">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;" value="${oaActDeparture.officePrincipalRemark}" readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.officeSupervisorRemark}" readonly>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">经营开发部</td>
        <td class="table-td-content" style="padding: 5px 10px;">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.operatingPrincipal}" readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.operatingSupervisor}"
                   readonly>
        </td>

        <td class="tdLabel">备注</td>
        <td class="table-td-content">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.operatingPrincipalRemark}"
                   readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.operatingSupervisorRemark}"
                   readonly>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">生产管理部</td>
        <td class="table-td-content" style="padding: 5px 10px;">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.producePrincipal}" readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.produceSupervisor}" readonly>
        </td>

        <td class="tdLabel">备注</td>
        <td class="table-td-content">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.producePrincipalRemark}"
                   readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.produceSupervisorRemark}"
                   readonly>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">质量技术部</td>
        <td class="table-td-content" style="padding: 5px 10px;">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.qualityPrincipal}" readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.qualitySupervisor}" readonly>
        </td>

        <td class="tdLabel">备注</td>
        <td class="table-td-content">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.qualityPrincipalRemark}"
                   readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.qualitySupervisorRemark}"
                   readonly>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">物资管理部</td>
        <td class="table-td-content" style="padding: 5px 10px;">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.materialPrincipal}" readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.materialSupervisor}" readonly>
        </td>

        <td class="tdLabel">备注</td>
        <td class="table-td-content">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.materialPrincipalRemark}"
                   readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.materialSupervisorRemark}"
                   readonly>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">财务管理部</td>
        <td class="table-td-content" style="padding: 5px 10px;">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.financePrincipal}" readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.financeSupervisor}" readonly>
        </td>

        <td class="tdLabel">备注</td>
        <td class="table-td-content">
            <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                   value="${oaActDeparture.financePrincipalRemark}"
                   readonly>
            <input type="text" class="formInput-readonly" value="${oaActDeparture.financeSupervisorRemark}"
                   readonly>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理</td>
        <td class="table-td-content" style="padding: 5px 10px;">
            <input type="text" class="formInput-readonly" value="${oaActDeparture.companyPrincipal}" readonly>
        </td>

        <td class="tdLabel">备注</td>
        <td class="table-td-content">
            <input type="text" class="formInput-readonly" value="${oaActDeparture.companyPrincipalRemark}"
                   readonly>
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
        $('#body,#return').css('width', '60%');
    }
</script>
</html>

