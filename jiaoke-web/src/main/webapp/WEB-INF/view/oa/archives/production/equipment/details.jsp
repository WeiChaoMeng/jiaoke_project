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
    <title>设备档案技术资料详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>设备档案技术资料详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">年份：</td>
            <td class="table-content">
                ${oaProductionEquipment.yearStr}
            </td>

            <td class="table-td">固定资产编号：</td>
            <td class="table-content">
                ${oaProductionEquipment.fixedAssets}
            </td>
        </tr>

        <tr>
            <td class="table-td">设备名称：</td>
            <td class="table-content">
                ${oaProductionEquipment.name}
            </td>

            <td class="table-td">设备型号：</td>
            <td class="table-content">
                ${oaProductionEquipment.type}
            </td>
        </tr>

        <tr>
            <td class="table-td">厂家：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEquipment.manufacturer}
            </td>
        </tr>

        <tr>
            <td class="table-td">原值：</td>
            <td class="table-content">
                ${oaProductionEquipment.originalValue}
            </td>

            <td class="table-td">购入日期：</td>
            <td class="table-content">
                ${oaProductionEquipment.buyDateStr}
            </td>
        </tr>

        <tr>
            <td class="table-td">存放地点：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEquipment.storageLocation}
            </td>
        </tr>

        <tr>
            <td class="table-td">资料存放地点：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEquipment.material}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaProductionEquipment.richText}
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
        window.location.href = '${path}/productionEquipment/toIndex?page=' + currentPageNum;
    }
</script>
</html>