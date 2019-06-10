<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>饭卡申请单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="table-title">
    <span>${oaActEngineering.title}</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside" style="height: 40px;border-bottom: none;">
        <div style="line-height: 40px;margin: 0 10px;float: left;">
            <span style="float: left;margin-left: 10px;font-size: 13px;">申请时间：${oaActEngineering.createTimeStr}</span>
        </div>

        <div class="head_left_button" style="float: right;line-height: 40px;">
            <button type="button" class="cursor_hand" onclick="addUser()" style="font-size: 13px;">&#xea0e; 打印</button>
        </div>
    </div>
</div>
<!-- -->
<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">变更前工程名称：</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeName}
        </td>

        <td class="tdLabel">变更后工程名称：</td>
        <td class="table-td-content">
            ${oaActEngineering.afterName}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前用料单位：</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeCompany}
        </td>

        <td class="tdLabel">变更后用料单位：</td>
        <td class="table-td-content">
            ${oaActEngineering.afterCompany}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前所用混合料品种：</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeVariety}
        </td>

        <td class="tdLabel">变更后所用混合料品种：</td>
        <td class="table-td-content">
            ${oaActEngineering.afterVariety}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前用料日期：</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeDataStr}
        </td>

        <td class="tdLabel">变更后用料日期：</td>
        <td class="table-td-content">
            ${oaActEngineering.afterDataStr}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">变更前用料数量：</td>
        <td class="table-td-content">
            ${oaActEngineering.beforeNumber}
        </td>

        <td class="tdLabel">变更后用料数量：</td>
        <td class="table-td-content">
            ${oaActEngineering.afterNumber}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">用料单位：</td>
        <td class="table-td-content">
            ${oaActEngineering.useCompany}
        </td>

        <td class="tdLabel">业务员：</td>
        <td class="table-td-content">
            ${oaActEngineering.salesman}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">备注：</td>
        <td colspan="3" class="table-td-content">
            ${oaActEngineering.remark}
        </td>
    </tr>
    </tbody>

</table>

<div class="receipt-container">
    <div class="receipt-title">
        <div class="receipt-script">回执意见（共条）</div>
    </div>

    <c:forEach items="${commentsList}" var="comments">
        <div class="comment-container">
            <div class="comment-style">
                <span class="comment-name">${comments.userName}</span>
                <span class="comment-message">${comments.message}</span>
                <span class="comment-date">${comments.timeStr}</span>
            </div>
        </div>
    </c:forEach>

    <div class="receipt-style"></div>
</div>

<div class="form-but" style="margin-top: 20px;">
    <button type="button" class="return-but" onclick="previousPage()">返回</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //返回上一页
    function previousPage() {
        window.history.back();
    }

</script>
</html>

