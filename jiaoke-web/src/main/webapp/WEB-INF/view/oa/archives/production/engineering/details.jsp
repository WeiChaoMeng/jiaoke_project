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
    <title>工程基建类资料详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>工程基建类资料详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">编号：</td>
            <td class="table-content">
                ${oaProductionEngineering.numbering}
            </td>

            <td class="table-td">工程名称：</td>
            <td class="table-content">
                ${oaProductionEngineering.projectName}
            </td>
        </tr>

        <tr>
            <td class="table-td">项目内容：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEngineering.content}
            </td>
        </tr>

        <tr>
            <td class="table-td">请示文号：</td>
            <td class="table-content">
                ${oaProductionEngineering.please}
            </td>

            <td class="table-td">批复文号：</td>
            <td class="table-content">
                ${oaProductionEngineering.reply}
            </td>
        </tr>

        <tr>
            <td class="table-td">合同编号：</td>
            <td class="table-content">
                ${oaProductionEngineering.contractNumber}
            </td>

            <td class="table-td">合同金额：</td>
            <td class="table-content">
                ${oaProductionEngineering.contractAmount}
            </td>
        </tr>

        <tr>
            <td class="table-td">结算金额：</td>
            <td class="table-content">
                ${oaProductionEngineering.settlementAmount}
            </td>

            <td class="table-td">竣工日期：</td>
            <td class="table-content">
                ${oaProductionEngineering.completionDateStr}
            </td>
        </tr>

        <tr>
            <td class="table-td">资料存放地点：</td>
            <td colspan="3" class="table-content">
                ${oaProductionEngineering.storageLocation}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaProductionEngineering.richText}
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
        window.location.href = '${path}/productionEngineering/toIndex?page=' + currentPageNum;
    }
</script>
</html>