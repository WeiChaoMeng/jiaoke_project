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
    <title>砂石料招投标资料详情</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="table-container">
    <div class="table-title">
        <span>砂石料招投标资料详情</span>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td class="table-td-width">招标文件：</td>
            <td colspan="3" class="table-content">
                ${oaMaterialBidding.file}
            </td>
        </tr>

        <tr>
            <td class="table-td-width">标书发放登记表：</td>
            <td class="table-content">
                ${oaMaterialBidding.issue}
            </td>

            <td class="table-td-width">投标登记表：</td>
            <td class="table-content">
                ${oaMaterialBidding.registrationForm}
            </td>
        </tr>

        <tr>
            <td class="table-td-width">投标报价汇总表：</td>
            <td class="table-content">
                ${oaMaterialBidding.quote}
            </td>

            <td class="table-td-width">招标评分标准：</td>
            <td class="table-content">
                ${oaMaterialBidding.tenderingScore}
            </td>
        </tr>

        <tr>
            <td class="table-td-width">招标费：</td>
            <td class="table-content">
                ${oaMaterialBidding.biddingFee}
            </td>

            <td class="table-td-width">评分表：</td>
            <td class="table-content">
                ${oaMaterialBidding.score}
            </td>
        </tr>

        <tr>
            <td class="table-td-width">招标评分汇总表：</td>
            <td class="table-content">
                ${oaMaterialBidding.scoreSummary}
            </td>

            <td class="table-td-width">招标评审意见表：</td>
            <td class="table-content">
                ${oaMaterialBidding.reviewOpinion}
            </td>
        </tr>
    </table>

    <div class="details-editor-container">
        ${oaMaterialBidding.richText}
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
        window.location.href = '${path}/materialBidding/toIndex?page=' + currentPageNum;
    }
</script>
</html>