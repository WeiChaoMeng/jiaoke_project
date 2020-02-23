<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>签认详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>签认详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">签认编号：</td>
            <td class="table-content">
                ${oaOperateSign.numbering}
            </td>

            <td class="table-td">签人日期：</td>
            <td class="table-content">
                ${oaOperateSign.signingDateStr}
            </td>
        </tr>

        <tr>
            <td class="table-td">购买方：</td>
            <td colspan="3" class="table-content">
                ${oaOperateSign.purchaser}
            </td>
        </tr>

        <tr>
            <td class="table-td">业务员：</td>
            <td class="table-content">
                ${oaOperateSign.salesman}
            </td>

            <td class="table-td">签认金额：</td>
            <td class="table-content">
                ${oaOperateSign.amount}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaOperateSign.richText}
    </div>

    <div class="form-but">
        <button type="button" class="cancel-btn-style" onclick="previousPage()">返回</button>
    </div>
</div>
</body>

<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript">
    //记录当前页
    var currentPageNum = JSON.parse('${currentPage}');

    //返回上一页
    function previousPage() {
        window.location.href = '${path}/operateSign/toIndex?page=' + currentPageNum;
    }
</script>
</html>