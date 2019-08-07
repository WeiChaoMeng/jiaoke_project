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
    <title>确认详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>确认详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">编号：</td>
            <td class="table-content">
                ${oaFinanceConfirm.numbering}
            </td>

            <td class="table-td">确认：</td>
            <td class="table-content">
                ${oaFinanceConfirm.confirm}
            </td>
        </tr>

        <tr>
            <td class="table-td">金额：</td>
            <td class="table-content">
                ${oaFinanceConfirm.amount}
            </td>

            <td class="table-td">客户名称：</td>
            <td class="table-content">
                ${oaFinanceConfirm.name}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaFinanceConfirm.richText}
    </div>

    <div class="form-but">
        <button type="button" class="return-but" onclick="previousPage()">返回</button>
    </div>
</div>
</body>

<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript">
    //记录当前页
    var currentPageNum = JSON.parse('${currentPage}');

    //返回上一页
    function previousPage() {
        window.location.href = '${path}/financeConfirm/toIndex?page=' + currentPageNum;
    }
</script>
</html>