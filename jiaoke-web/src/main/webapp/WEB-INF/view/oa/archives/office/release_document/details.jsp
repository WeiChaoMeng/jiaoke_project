<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
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
    <title>公司发文详情</title>
    <!-- 引用控制层插件样式 -->
    <link href="../../../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
</head>
<body style="padding: 20px 0">

<table class="formtable" style="width: 70%;margin: auto">

    <tbody>

    <tr>
        <td class="tlabel">发文编号</td>
        <td colspan="5">
            ${oaReleaseDocument.documentNumber}
        </td>

        <td class="tlabel">文档类型</td>
        <td colspan="5">
            <c:choose>
                <c:when test="${oaReleaseDocument.documentType == 0}">
                    行政文件
                </c:when>
                <c:when test="${oaReleaseDocument.documentType == 1}">
                    党支部文件
                </c:when>
                <c:when test="${oaReleaseDocument.documentType == 2}">
                    普通文件
                </c:when>
                <c:when test="${oaReleaseDocument.documentType == 3}">
                    上报请示
                </c:when>
                <c:when test="${oaReleaseDocument.documentType == 4}">
                    函文
                </c:when>
            </c:choose>
        </td>
    </tr>

    <tr>
        <td class="tlabel">文件名称</td>
        <td colspan="5">
            ${oaReleaseDocument.documentName}
        </td>

        <td class="tlabel">访问日期</td>
        <td colspan="5">
            ${oaReleaseDocument.visitDateStr}
        </td>
    </tr>

    <tr>
        <td class="tlabel">主送部门</td>
        <td colspan="5">
            ${oaReleaseDocument.mainDeliveryDepartment}
        </td>

        <td class="tlabel">备注</td>
        <td colspan="5">
            ${oaReleaseDocument.remarks}
        </td>
    </tr>

    </tbody>
</table>

<div style="width: 70%;margin:10px auto 0;border: 1px solid #a9a9a9;">
    <div style="padding: 10px 30px;min-height: 350px;">
        ${oaReleaseDocument.richText}
    </div>
</div>

<div style="text-align: center;padding-top: 20px;">
    <input type="button" value="返回" onclick="previousPage()" class="cancel-btn-style">
</div>

</body>

<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script>
    //记录上页
    var prevNum = JSON.parse('${prev}');

    //返回上一页
    function previousPage() {
        window.location.href = '${path}/releaseDocument/toReleaseDocument?page=' + prevNum;
    }
</script>
</html>