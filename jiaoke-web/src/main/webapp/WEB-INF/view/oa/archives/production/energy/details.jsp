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
    <title>能源、碳排放统计详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>能源、碳排放统计详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td-special">年份：</td>
            <td class="table-content">
                ${oaProductionEnergy.yearStr}
            </td>

            <td class="table-td-special">产量(吨)：</td>
            <td class="table-content">
                ${oaProductionEnergy.yield}
            </td>
        </tr>

        <tr>
            <td class="table-td-special">产值(万元)：</td>
            <td class="table-content">
                ${oaProductionEnergy.outputValue}
            </td>

            <td class="table-td-special">万元产值能耗(吨标准煤/万元)：</td>
            <td class="table-content">
                ${oaProductionEnergy.productionConsume}
            </td>
        </tr>

        <tr>
            <td class="table-td-special">单位产品能耗(千克标准煤/吨)：</td>
            <td class="table-content">
                ${oaProductionEnergy.productConsume}
            </td>

            <td class="table-td-special">天然气消耗量(万立方米)：</td>
            <td class="table-content">
                ${oaProductionEnergy.gasConsume}
            </td>
        </tr>

        <tr>
            <td class="table-td-special">耗电量(万千瓦时)：</td>
            <td class="table-content">
                ${oaProductionEnergy.powerConsumption}
            </td>

            <td class="table-td-special">单位产品碳排放量(千克二氧化碳/吨)：</td>
            <td class="table-content">
                ${oaProductionEnergy.carbonEmission}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaProductionEnergy.richText}
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
        window.location.href = '${path}/productionEnergy/toIndex?page=' + currentPageNum;
    }
</script>
</html>