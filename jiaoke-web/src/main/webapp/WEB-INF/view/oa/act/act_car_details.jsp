<!DOCTYPE html>
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
    <title>用车审批单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActCar.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActCar.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActCar.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActCar.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActCar.annex}" delims="," var="annex">
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

<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">使用人</td>
        <td class="table-td-content">
            ${oaActCar.user}
        </td>

        <td class="tdLabel">事由</td>
        <td colspan="5" class="table-td-reason">
            ${oaActCar.cause}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">车牌号</td>
        <td class="table-td-content">
            ${oaActCar.licensePlate}
        </td>

        <td class="tdLabel">车辆性质</td>
        <td class="table-td-content">
            <div>
                <c:choose>
                    <c:when test="${oaActCar.properties == 0}">
                        <input type="radio" style="vertical-align: middle;margin-right: 5px;" checked disabled>
                        <span style="margin-right: 10px;">私家车</span>
                    </c:when>

                    <c:otherwise>
                        <input type="radio" style="vertical-align: middle;margin-right: 5px;" disabled>
                        <span style="margin-right: 10px;">私家车</span>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${oaActCar.properties == 1}">
                        <input type="radio" style="vertical-align: middle;margin-right: 5px;" checked disabled>
                        <span>享车补车</span>
                    </c:when>

                    <c:otherwise>
                        <input type="radio" style="vertical-align: middle;margin-right: 5px;" disabled>
                        <span>享车补车</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">用车时间</td>
        <td class="table-td-content">
            ${oaActCar.startTime}
        </td>

        <td class="tdLabel">目的地</td>
        <td class="table-td-content">
            ${oaActCar.destination}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">公里基数</td>
        <td class="table-td-content">
            ${oaActCar.cardinalNumber}
        </td>

        <td class="tdLabel">使用后数</td>
        <td class="table-td-content">
            ${oaActCar.after}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">行驶数</td>
        <td class="table-td-content">
            ${oaActCar.drivingNumber}
        </td>

        <td class="tdLabel">计费(元)</td>
        <td class="table-td-content">
            ${oaActCar.billing}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">审核人</td>
        <td class="table-td-content" colspan="3">
            ${oaActCar.principal}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">查表计数人</td>
        <td class="table-td-content">
            ${oaActCar.lookup}
        </td>

        <td class="tdLabel">交车时间</td>
        <td class="table-td-content">
            ${oaActCar.endTime}
        </td>
    </tr>
    </tbody>
</table>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script">说明：1.每公里2元。使用的车辆为享受车补待遇的，每公里1.2元。2.审核人为使用部门负责人。3.多人同时使用时费用均摊。4.费用按月报销或扣除。</span>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
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

