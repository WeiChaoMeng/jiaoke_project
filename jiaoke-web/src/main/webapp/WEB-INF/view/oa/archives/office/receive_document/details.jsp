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
    <title>公司收文详情</title>
    <!-- 引用控制层插件样式 -->
    <link href="../../../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">

</head>
<body style="padding: 20px 0">

<table class="formtable" style="width: 70%;margin: auto">

    <tbody>

    <tr>
        <td class="tlabel">收文时间</td>
        <td colspan="5">
            ${oaReceiveDocument.receiveDateStr}
        </td>

        <td class="tlabel">收文编号</td>
        <td colspan="5">
            ${oaReceiveDocument.documentNumber}
        </td>
    </tr>

    <tr>
        <td class="tlabel">来文字号</td>
        <td colspan="5">
            ${oaReceiveDocument.documentReceivedNumber}
        </td>

        <td class="tlabel">标题</td>
        <td colspan="5">
            ${oaReceiveDocument.documentName}
        </td>
    </tr>

    <tr>
        <td class="tlabel">备注</td>
        <td colspan="5">
            ${oaReceiveDocument.remarks}
        </td>

        <td class="tlabel">发文部门</td>
        <td colspan="5">
            <c:choose>
                <c:when test="${oaReceiveDocument.publishingDepartment == 0}">
                    安全管理部
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 1}">
                    办公室
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 2}">
                    财务管理部
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 3}">
                    纪检监察部
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 4}">
                    企业管理部
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 5}">
                    生产经营部
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 6}">
                    组织人事部
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 7}">
                    建材集团党发
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 8}">
                    建材集团工会发
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 9}">
                    共青团发
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 10}">
                    市政路桥集团发
                </c:when>
                <c:when test="${oaReceiveDocument.publishingDepartment == 11}">
                    其他收文
                </c:when>
            </c:choose>
        </td>
    </tr>

    </tbody>
</table>

<div style="width: 70%;margin:10px auto 0;border: 1px solid #a9a9a9;">
    <div style="padding: 10px 30px;min-height: 350px;">
        ${oaReceiveDocument.richText}
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
        window.location.href = '${path}/receiveDocument/toReceiveDocument?page=' + prevNum;
    }
</script>
</html>