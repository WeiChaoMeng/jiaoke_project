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
    <meta charset="utf-8">
    <title>资产补货</title>
    <link href="../../../../static/css/oa/resource_management.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body>
<form id="resourceManagement">
    <table class="form_table">

        <tbody>
        <tr>
            <td class="table_field"><i>*</i>资产名称：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="assetsName" id="assetsName"
                       value="${oaAssetManagement.assetsName}" disabled="disabled" onblur="verification(this)" required>
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>资产类别：</td>
            <td class="table_input_field">
                <select class="form_select" name="assetsCategory" required>
                    <c:choose>
                        <c:when test="${oaReleaseDocument.documentType == 0}">
                            <option value="0" selected="selected">办公用品</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">办公用品</option>
                            >
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReleaseDocument.documentType == 1}">
                            <option value="1" selected="selected">办公用品</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">生产设备</option>
                            >
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>
        </tr>

        <tr>
            <td class="table_field">规格型号：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="productSpecification"
                       value="${oaAssetManagement.productSpecification}">
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>剩余数量：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="productQuantity"
                       value="${oaAssetManagement.productQuantity}" required>
            </td>
        </tr>

        <tr>
            <td class="table_field">包装清单：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="packingList" value="${oaAssetManagement.packingList}">
            </td>
        </tr>

        <tr>
            <td class="table_field">来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源：</td>
            <td class="table_input_field">
                <select class="form_select" name="productSource" required>
                    <c:choose>
                        <c:when test="${oaReleaseDocument.documentType == 0}">
                            <option value="0" selected="selected">行政购置</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">行政购置</option>
                            >
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReleaseDocument.documentType == 1}">
                            <option value="1" selected="selected">设备购置</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">设备购置</option>
                            >
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>录入人员：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="entryPerson" value="${oaAssetManagement.entryPerson}"
                       required>
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>存放地点：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="storageLocation"
                       value="${oaAssetManagement.storageLocation}" required>
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>保管人员：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="custodian" value="${oaAssetManagement.custodian}" required>
            </td>
        </tr>

        <tr>
            <td class="table_field">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="remarks" value="${oaAssetManagement.remarks}">
            </td>
        </tr>
        </tbody>
    </table>

    <div class="form_btn">
        <input type="submit" value="保存" id="submit" class="btn_save">
    </div>

</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script>
    //提交表单
    $('#resourceManagement').submit(function () {
        $.ajax({
            type: "POST",
            url: '${path}/assetsManagement/add',
            data: $('#resourceManagement').serialize(),
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                var result = JSON.parse(data);
                if (result === "success") {
                    alert('成功');
                } else {
                    alert('错误');
                }
                location.reload();
            }
        })
    });
</script>
</html>

