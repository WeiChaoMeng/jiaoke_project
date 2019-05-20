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
                ${oaProductionContract.numbering}
            </td>

            <td class="table-td">合同相对人：</td>
            <td class="table-content">
                ${oaProductionContract.relativePerson}
            </td>
        </tr>

        <tr>
            <td class="table-td">合同名称：</td>
            <td colspan="3" class="table-content">
                ${oaProductionContract.name}
            </td>
        </tr>

        <tr>
            <td class="table-td">合同内容：</td>
            <td colspan="3" class="table-content">
                ${oaProductionContract.content}
            </td>
        </tr>

        <tr>
            <td class="table-td">合同金额：</td>
            <td class="table-content">
                ${oaProductionContract.amount}
            </td>

            <td class="table-td">存放地点：</td>
            <td class="table-content">
                ${oaProductionContract.storageLocation}
            </td>
        </tr>

        <tr>
            <td class="table-td">备注：</td>
            <td colspan="3" class="table-content">
                ${oaProductionContract.remark}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaProductionContract.richText}
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
        window.location.href = '${path}/productionContract/toIndex?page=' + currentPageNum;
    }
</script>
</html>