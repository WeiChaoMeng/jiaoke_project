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

    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>图片上传</title>
    <!-- 引用控制层插件样式 -->
    <link href="/static/css/oa/oa_common.css" rel="stylesheet" type="text/css">

</head>
<body style="padding: 20px 0">

<table class="formtable" style="width: 70%;margin: auto">

    <tbody>

    <tr>
        <td class="tlabel">编号：</td>
        <td colspan="5">
            ${oaContractArchives.serialNumber}
        </td>

        <td class="tlabel">标题：</td>
        <td colspan="5">
            ${oaContractArchives.title}
        </td>
    </tr>

    <tr>
        <td class="tlabel">摘要：</td>
        <td colspan="5">
            ${oaContractArchives.archivesAbstract}
        </td>

        <td class="tlabel">经手人：</td>
        <td colspan="5">
            ${oaContractArchives.operator}
        </td>
    </tr>

    <tr>
        <td class="tlabel">签署单位：</td>
        <td colspan="5">
            ${oaContractArchives.signingUnit}
        </td>

        <td class="tlabel">签署时间：</td>
        <td colspan="5">
            ${oaContractArchives.signingDate}
        </td>
    </tr>

    </tbody>
</table>

<div style="width: 70%;margin:10px auto 0;border: 1px solid #a9a9a9;">
    <div style="padding: 10px 30px;min-height: 350px;">
        ${oaContractArchives.richText}
    </div>
</div>

<div style="text-align: center;padding-top: 20px;">
    <input type="button" value="返回" onclick="previousPage()"
           style="padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;">
</div>

</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
    //返回上一页
    function previousPage() {
        window.history.back();
    }
</script>
</html>