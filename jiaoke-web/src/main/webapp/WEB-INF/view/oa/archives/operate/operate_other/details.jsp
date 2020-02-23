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
    <title>其他详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>其他详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">编号：</td>
            <td class="table-content">
                ${oaOperateOther.numbering}
            </td>

            <td class="table-td">文件名称：</td>
            <td class="table-content">
                ${oaOperateOther.fileName}
            </td>
        </tr>

        <tr>
            <td class="table-td">摘要：</td>
            <td colspan="3" class="table-content">
                ${oaOperateOther.summary}
            </td>
        </tr>

        <tr>
            <td class="table-td">签发领导：</td>
            <td class="table-content">
                ${oaOperateOther.issueLeader}
            </td>

            <td class="table-td">发放日期：</td>
            <td class="table-content">
                ${oaOperateOther.releaseDateStr}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaOperateOther.richText}
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
        window.location.href = '${path}/operateOther/toIndex?page=' + currentPageNum;
    }
</script>
</html>