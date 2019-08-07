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
    <title>客户满意度详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>客户满意度详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">编号：</td>
            <td class="table-content">
                ${oaOperateOffer.numbering}
            </td>

            <td class="table-td">客户名称：</td>
            <td class="table-content">
                ${oaOperateOffer.customerName}
            </td>
        </tr>

        <tr>
            <td class="table-td">工程名称：</td>
            <td colspan="3" class="table-content">
                ${oaOperateOffer.projectName}
            </td>
        </tr>

        <tr>
            <td class="table-td">业务员：</td>
            <td class="table-content">
                ${oaOperateOffer.salesman}
            </td>

            <td class="table-td">报价日期：</td>
            <td class="table-content">
                ${oaOperateOffer.quoteDateStr}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaOperateOffer.richText}
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
        window.location.href = '${path}/operateOffer/toIndex?page=' + currentPageNum;
    }
</script>
</html>