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
    <title>原材料采购合同详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>原材料采购合同详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">合同编号：</td>
            <td class="table-content">
                ${oaMaterialPurchase.numbering}
            </td>

            <td class="table-td">合同名称：</td>
            <td class="table-content">
                ${oaMaterialPurchase.name}
            </td>
        </tr>

        <tr>
            <td class="table-td">供货商名称：</td>
            <td class="table-content">
                ${oaMaterialPurchase.supplier}
            </td>

            <td class="table-td">材料名称：</td>
            <td class="table-content">
                ${oaMaterialPurchase.material}
            </td>
        </tr>

        <tr>
            <td class="table-td">合同数量：</td>
            <td class="table-content">
                ${oaMaterialPurchase.number}
            </td>

            <td class="table-td">合同单价：</td>
            <td class="table-content">
                ${oaMaterialPurchase.unitPrice}
            </td>
        </tr>

        <tr>
            <td class="table-td">备注：</td>
            <td class="table-content">
                ${oaMaterialPurchase.remarks}
            </td>

            <td class="table-td">签订日期：</td>
            <td class="table-content">
                ${oaMaterialPurchase.signingDateStr}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaMaterialPurchase.richText}
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
        window.location.href = '${path}/materialPurchase/toIndex?page=' + currentPageNum;
    }
</script>
</html>