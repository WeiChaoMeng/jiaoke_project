<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>

<html>
<head>
    <meta charset="utf-8">
    <title>资产入库</title>
    <link href="../../../../static/css/oa/resource_management.css" rel="stylesheet" type="text/css">
</head>

<body>
<form id="resourceManagement">
    <table class="form_table">
        <tbody>
        <tr>
            <td class="table_field"><i>*</i>资产名称</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="assetsName" id="assetsName" value=""
                       onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" onblur="verification()"
                       autocomplete="off" required>
            </td>
        </tr>

        <tr>
            <td class="table_field">资产类别</td>
            <td class="table_input_field">
                <select class="form_select" name="assetsCategory" required>
                    <option value="0">办公用品</option>
                    <option value="1">生产设备</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="table_field">规格型号</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="productSpecification" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>购买数量</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="productQuantity" id="productQuantity" autocomplete="off"
                       required onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')">
            </td>
        </tr>

        <tr>
            <td class="table_field">包装清单</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="packingList" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="table_field">来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源</td>
            <td class="table_input_field">
                <select class="form_select" name="productSource" required>
                    <option value="0">行政购置</option>
                    <option value="1">设备购置</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="table_field">录入人员</td>
            <td class="table_input_field">
                <input type="text" class="form-input-readonly" name="entryPerson" value="${nickname}" readonly>
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>存放地点</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="storageLocation" id="storageLocation" autocomplete="off"
                       onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" required>
            </td>
        </tr>

        <tr>
            <td class="table_field"><i>*</i>保管人员</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="custodian" id="custodian" autocomplete="off"
                       onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" required>
            </td>
        </tr>

        <tr>
            <td class="table_field">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</td>
            <td class="table_input_field">
                <input type="text" class="form_input" name="remarks" autocomplete="off">
            </td>
        </tr>
        </tbody>
    </table>

    <div class="form_btn">
        <input type="button" value="确定" onclick="confirm()" class="btn_save">
    </div>

</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //确定新增
    function confirm() {
        if ($.trim($("#assetsName").val()) === '') {
            top.window.tips("资产名称为必填项", 6, 5, 1500);
        } else {
            if ($.trim($("#productQuantity").val()) === '') {
                top.window.tips("购买数量为必填项", 6, 5, 1500);
            } else {
                if ($.trim($("#storageLocation").val()) === '') {
                    top.window.tips("存放地点为必填项", 6, 5, 1500);
                } else {
                    if ($.trim($("#custodian").val()) === '') {
                        top.window.tips("保管人员为必填项", 6, 5, 1500);
                    } else {
                        //校验资产名称是否存在
                        var assetsName = $('#assetsName').val();
                        $.ajax({
                            type: "POST",
                            url: '${path}/assetsManagement/selectByName',
                            data: {'assetsName': assetsName},
                            error: function (request) {
                                layer.msg("Connection error");
                            },
                            success: function (data) {
                                var result = JSON.parse(data);
                                //未存在
                                if (result === "none") {
                                    $.ajax({
                                        type: "POST",
                                        url: '${path}/assetsManagement/add',
                                        data: $('#resourceManagement').serialize(),
                                        error: function (request) {
                                            window.top.tips("出错！", 6, 2, 1000);
                                        },
                                        success: function (data) {
                                            var result = JSON.parse(data);
                                            if (result === "success") {
                                                window.top.tips("提交成功！", 0, 1, 1000);
                                                location.reload();
                                            } else {
                                                window.top.tips("提交失败！", 0, 2, 1000);
                                            }
                                        }
                                    })
                                } else {
                                    //资产名称存在
                                    window.top.tips('"' + assetsName + '"' + '  已经存在！', 6, 5, 2000);
                                }
                            }
                        });
                    }
                }
            }
        }
    }

    //验证资产名是否存在
    function verification() {
        var assetsName = $('#assetsName').val();
        $.ajax({
            type: "POST",
            url: '${path}/assetsManagement/selectByName',
            data: {'assetsName': assetsName},
            error: function (request) {
                layer.msg("Connection error");
            },
            success: function (data) {
                var result = JSON.parse(data);
                if (result === "none") {
                    return false;
                } else {
                    window.top.tips('"' + assetsName + '"' + '  已经存在！', 6, 5, 2000);
                }
            }
        });
    }
</script>
</html>

