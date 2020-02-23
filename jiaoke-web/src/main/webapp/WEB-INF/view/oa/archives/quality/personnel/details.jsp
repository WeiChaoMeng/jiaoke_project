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
    <title>其它文件详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>其它文件详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">姓名：</td>
            <td class="table-content">
                ${oaQualityPersonnel.name}
            </td>

            <td class="table-td">职务：</td>
            <td class="table-content">
                ${oaQualityPersonnel.position}
            </td>
        </tr>

        <tr>
            <td class="table-td">年龄：</td>
            <td class="table-content">
                ${oaQualityPersonnel.age}
            </td>

            <td class="table-td">颁发单位：</td>
            <td class="table-content">
                ${oaQualityPersonnel.issuingUnit}
            </td>
        </tr>

        <tr>
            <td class="table-td">证书编号：</td>
            <td colspan="3" class="table-content">
                ${oaQualityPersonnel.certificate}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaQualityPersonnel.richText}
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
        window.location.href = '${path}/qualityPersonnel/toIndex?page=' + currentPageNum;
    }
</script>
</html>