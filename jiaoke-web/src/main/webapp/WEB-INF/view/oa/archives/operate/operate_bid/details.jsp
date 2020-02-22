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
    <title>投标管理</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>投标管理</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td">招标单位：</td>
            <td colspan="3" class="table-content">
                ${oaOperateBid.tenderee}
            </td>
        </tr>

        <tr>
            <td class="table-td">工程名称：</td>
            <td colspan="3" class="table-content">
                ${oaOperateBid.projectName}
            </td>
        </tr>

        <tr>
            <td class="table-td">竞标单位：</td>
            <td colspan="3" class="table-content">
                ${oaOperateBid.biddingUnit}
            </td>
        </tr>

        <tr>
            <td class="table-td">业主：</td>
            <td colspan="3" class="table-content">
                ${oaOperateBid.proprietor}
            </td>
        </tr>

        <tr>
            <td class="table-td">投标价格：</td>
            <td class="table-content">
                ${oaOperateBid.tenderPrice}
            </td>

            <td class="table-td">年度：</td>
            <td class="table-content">
                ${oaOperateBid.yearStr}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaOperateBid.richText}
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
        window.location.href = '${path}/operateBid/toIndex?page=' + currentPageNum;
    }
</script>
</html>