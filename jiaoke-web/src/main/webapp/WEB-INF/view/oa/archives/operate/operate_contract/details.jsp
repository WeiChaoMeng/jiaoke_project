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
    <title>合同详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>合同详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">合同编号：</td>
            <td class="table-content">
                ${oaOperateDevelop.numbering}
            </td>

            <td class="table-td">购买方：</td>
            <td class="table-content">
                ${oaOperateDevelop.purchaser}
            </td>
        </tr>

        <tr>
            <td class="table-td">签订日期：</td>
            <td class="table-content">
                ${oaOperateDevelop.signingDateStr}
            </td>

            <td class="table-td">业务员：</td>
            <td class="table-content">
                ${oaOperateDevelop.salesman}
            </td>
        </tr>

        <tr>
            <td class="table-td">合同金额：</td>
            <td class="table-content">
                ${oaOperateDevelop.amount}
            </td>

            <td class="table-td">结清日期：</td>
            <td class="table-content">
                ${oaOperateDevelop.settlementDateStr}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaOperateDevelop.richText}
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
        window.location.href = '${path}/operate/toOperateContract?page=' + currentPageNum;
    }
</script>
</html>