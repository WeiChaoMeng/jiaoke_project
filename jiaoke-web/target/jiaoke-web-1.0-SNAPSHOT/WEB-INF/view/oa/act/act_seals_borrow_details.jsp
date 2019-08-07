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
    <title>印章借用审批单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="table-title">
    <span>${oaActSealsBorrow.title}</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside" style="height: 40px;border-bottom: none;">
        <div style="line-height: 40px;margin: 0 10px;float: left;">
            <span style="float: left;margin-left: 10px;font-size: 13px;">申请时间：${oaActSealsBorrow.createTimeStr}</span>
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
        <td class="tdLabel">印章种类：</td>
        <td class="table-td-content">
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
    </tr>

    <tr>
        <td class="tdLabel">借用时间：</td>
        <td class="table-td-content">
            ${oaActSealsBorrow.borrowTimeStr}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">盖章文件内容：</td>
        <td class="table-td-content">
            ${oaActSealsBorrow.content}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">借章人：</td>
        <td class="table-td-content">
            ${oaActSealsBorrow.borrower}
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

