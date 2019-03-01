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

<div class="replenishment_div_1">

    <div>
        <span class="replenishment_title">资产信息：</span>
    </div>

    <table class="form_table replenishment_table">
        <tbody>
        <tr>
            <td class="table_field">资产名称：</td>
            <td class="table_input_field">
                ${oaAssetManagement.assetsName}
            </td>
        </tr>

        <tr>
            <td class="table_field">资产类别：</td>
            <td class="table_input_field">
                <c:choose>
                    <c:when test="${oaAssetManagement.assetsCategory == 0}">
                        办公用品
                    </c:when>
                    <c:when test="${oaAssetManagement.assetsCategory == 1}">
                        生产设备
                    </c:when>
                </c:choose>
            </td>
        </tr>

        <tr>
            <td class="table_field">规格型号：</td>
            <td class="table_input_field">
                ${oaAssetManagement.productSpecification}
            </td>
        </tr>

        <tr>
            <td class="table_field">剩余数量：</td>
            <td class="table_input_field">
                ${oaAssetManagement.productQuantity}
            </td>
        </tr>

        <tr>
            <td class="table_field">包装清单：</td>
            <td class="table_input_field">
                ${oaAssetManagement.packingList}
            </td>
        </tr>

        <tr>
            <td class="table_field">来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源：</td>
            <td class="table_input_field">
                <c:choose>
                    <c:when test="${oaAssetManagement.productSource == 0}">
                        行政购置
                    </c:when>
                    <c:when test="${oaAssetManagement.productSource == 1}">
                        设备购置
                    </c:when>
                </c:choose>
            </td>
        </tr>

        <tr>
            <td class="table_field">录入人员：</td>
            <td class="table_input_field">
                ${oaAssetManagement.entryPerson}
            </td>
        </tr>

        <tr>
            <td class="table_field">存放地点：</td>
            <td class="table_input_field">
                ${oaAssetManagement.storageLocation}
            </td>
        </tr>

        <tr>
            <td class="table_field">保管人员：</td>
            <td class="table_input_field">
                ${oaAssetManagement.custodian}
            </td>
        </tr>

        <tr>
            <td class="table_field">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
            <td class="table_input_field">
                ${oaAssetManagement.remarks}
            </td>
        </tr>
        </tbody>
    </table>
</div>

<div class="replenishment_div_2">
    <div>
        <span class="replenishment_title">领取记录</span>
    </div>
    <div>
        <table class="simple_table replenishment_table replenishment_table_other">

            <thead>
            <th style="width: 25%;">序号</th>
            <th style="width: 25%;">领用人</th>
            <th style="width: 25%;">领用数量</th>
            <th style="width: 25%;">领用时间</th>
            </thead>

            <tbody id="tbody">
            <tr>
                <td>1</td>
                <td>张三</td>
                <td>2</td>
                <td>2019-01-12 12:24:31</td>
            </tr>

            <tr>
                <td>2</td>
                <td>六三</td>
                <td>2</td>
                <td>2019-01-12 12:24:31</td>
            </tr>

            <tr>
                <td>3</td>
                <td>张三</td>
                <td>2</td>
                <td>2019-01-12 12:24:31</td>
            </tr>

            <tr>
                <td>4</td>
                <td>张三</td>
                <td>2</td>
                <td>2019-01-12 12:24:31</td>
            </tr>

            <tr>
                <td>5</td>
                <td>张三</td>
                <td>2</td>
                <td>2019-01-12 12:24:31</td>
            </tr>

            <tr>
                <td>6</td>
                <td>张三</td>
                <td>2</td>
                <td>2019-01-12 12:24:31</td>
            </tr>
            </tbody>

        </table>
    </div>
</div>

<div class="replenishment_div_3">
    <form id="assetReplenishment">
        <div>
            <span class="replenishment_title">补货信息：</span>
        </div>

        <table class="form_table replenishment_table">

            <tbody>
            <tr>
                <td class="table_field">资产名称：</td>
                <td class="table_input_field">
                    <input type="hidden" id="assetManagementId" name="assetManagementId"
                           value="${oaAssetManagement.id}">
                    <input type="hidden" name="assetsCustodian"
                           value="${oaAssetManagement.custodian}">
                    <input type="text" class="form_input" name="assetsName"
                           value="${oaAssetManagement.assetsName}" readonly="readonly">
                </td>
            </tr>

            <tr>
                <td class="table_field"><i>*</i>补货数量：</td>
                <td class="table_input_field">
                    <input type="text" class="form_input" name="replenishmentQuantity" id="replenishmentQuantity"
                           value="" oninput="value=value.replace(/[^\d]/g,'')" required>
                </td>
            </tr>

            <tr>
                <td class="table_field"><i>*</i>补货人员：</td>
                <td class="table_input_field">
                    <input type="text" class="form_input" name="replenishmentPerson" id="replenishmentPerson" value=""
                           required>
                </td>
            </tr>

            <tr>
                <td class="table_field">存放地点：</td>
                <td class="table_input_field">
                    <input type="text" class="form_input" name="replenishmentStorageLocation"
                           value="" required>
                </td>
            </tr>

            <tr>
                <td class="table_field">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                <td class="table_input_field">
                    <input type="text" class="form_input" name="replenishmentRemarks" value="">
                </td>
            </tr>
            </tbody>
        </table>

        <div class="replenishment_btn">
            <input type="button" value="保存" onclick="submitReplenishment()" class="btn_save">
            <input type="button" value="返回" onclick="previousPage()" class="btn_save">
        </div>

    </form>
</div>


</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script>
    //提交表单
    function submitReplenishment() {
        if ($('#replenishmentQuantity').val() === '') {
            alert("补货数量必填！");
        } else {
            if ($('#replenishmentPerson').val() === '') {
                alert('补货人员必填！');
            } else {
                $.ajax({
                    type: "POST",
                    url: '${path}/assetsManagement/commitAssetReplenishment',
                    data: $('#assetReplenishment').serialize(),
                    async: false,
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (data) {
                        var result = JSON.parse(data);
                        if (result === "success") {
                            alert("成功");
                            window.location.href = "${path}/assetsManagement/toAssetsArchives";
                        } else {
                            alert('失败');
                            var id = $('#assetManagementId').val();
                            window.location.href = "${path}/assetsManagement/toAssetReplenishmentPage?id=" + id;
                        }
                    }
                })
            }
        }
    }

    //返回上一页
    function previousPage() {
        window.history.back();
    }
</script>
</html>
