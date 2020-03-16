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
    <title>奖罚意见表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 60%">

<div class="table-title">
    <span>${oaActRewardsPenalties.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRewardsPenalties.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRewardsPenalties.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRewardsPenalties.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRewardsPenalties.annex}" delims="," var="annex">
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
        <td class="tdLabel" style="padding: 0;text-align: center">奖罚月份</td>
        <td colspan="2" class="table-td-content" style="text-align: center">
            ${oaActRewardsPenalties.month}
        </td>
    </tr>

    <tr>
        <td colspan="2" class="tdLabel" style="padding: 0;text-align: center">奖罚事项</td>
        <td class="tdLabel" style="padding: 0;text-align: center">主管签字</td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>
        </td>

        <td class="table-td-textarea">
            ${oaActRewardsPenalties.office}
        </td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>
        </td>

        <td class="table-td-textarea">
            ${oaActRewardsPenalties.quality}
        </td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>
        </td>

        <td class="table-td-textarea">
            ${oaActRewardsPenalties.business}
        </td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>
        </td>

        <td class="table-td-textarea">
            ${oaActRewardsPenalties.production}
        </td>
    </tr>

    <tr>
        <td colspan="2" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.suppliesContent}</textarea>
        </td>

        <td class="table-td-textarea">
            ${oaActRewardsPenalties.supplies}
        </td>
    </tr>

    <tr>
        <td class="tdLabel" style="padding: 0;text-align: center">总经理意见</td>
        <td colspan="5" class="table-td-textarea">
            <textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>
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

