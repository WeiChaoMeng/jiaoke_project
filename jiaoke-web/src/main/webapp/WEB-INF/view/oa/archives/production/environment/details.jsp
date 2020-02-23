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
    <title>环保改造台账详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>环保改造台账详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">编号：</td>
            <td class="table-content">
                ${oaProductionEnvironment.numbering}
            </td>

            <td class="table-td">年份：</td>
            <td class="table-content">
                ${oaProductionEnvironment.yearStr}
            </td>
        </tr>

        <tr>
            <td class="table-td">项目名称：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEnvironment.projectName}
            </td>
        </tr>

        <tr>
            <td class="table-td">施工单位：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEnvironment.constructionUnit}
            </td>
        </tr>

        <tr>
            <td class="table-td">治理措施：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEnvironment.controlMeasures}
            </td>
        </tr>

        <tr>
            <td class="table-td">数量：</td>
            <td class="table-content">
                ${oaProductionEnvironment.number}
            </td>

            <td class="table-td">型号：</td>
            <td class="table-content">
                ${oaProductionEnvironment.type}
            </td>
        </tr>

        <tr>
            <td class="table-td">改造费用：</td>
            <td class="table-content">
                ${oaProductionEnvironment.retrofitCost}
            </td>

            <td class="table-td">对应合同编号：</td>
            <td class="table-content">
                ${oaProductionEnvironment.correspondingContract}
            </td>
        </tr>

        <tr>
            <td class="table-td">污染物去向：</td>
            <td class="table-content">
                ${oaProductionEnvironment.contaminants}
            </td>

            <td class="table-td">资料存放地点：</td>
            <td class="table-content">
                ${oaProductionEnvironment.storageLocation}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaProductionEnvironment.richText}
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
        window.location.href = '${path}/productionEnvironment/toIndex?page=' + currentPageNum;
    }
</script>
</html>