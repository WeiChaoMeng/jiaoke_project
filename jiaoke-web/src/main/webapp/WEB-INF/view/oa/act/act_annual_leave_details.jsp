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
                                <span class="table-file-title" title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}</span>
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

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">部门</td>
        <td class="table-td-content">
            ${oaActAnnualLeave.department}
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
            ${oaActAnnualLeave.supervisor}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">人事主管</td>
        <td class="table-td-content">
            ${oaActAnnualLeave.personnel}
        </td>

        <td class="tdLabel">总经理</td>
        <td class="table-td-content">
            ${oaActAnnualLeave.companyPrincipal}
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
        $('#body').css('width', '65%');
    }
</script>
</html>

