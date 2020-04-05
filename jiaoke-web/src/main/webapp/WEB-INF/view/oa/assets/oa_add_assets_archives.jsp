<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>新增资产档案</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .table-td-content {
            padding: 10px;
        }

        .formTable td {
            line-height: 0;
        }

        .formTable thead tr th {
            line-height: 40px;
            border: solid 1px #e5e5e5;
            text-align: center;
            background: #f6f6f6;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }

        .commit-but-inp {
            border-radius: 5px;
            padding: 8px 21px;
            background: #2ca4f9;
            outline: none;
            color: #ffffff;
            cursor: pointer;
        }

        .commit-but-inp:hover {
            background: #42acf9;
        }

        .return-but-inp {
            border-radius: 5px;
            padding: 7px 20px;
            border: 1px #a5a5a5 solid;
            outline: none;
            background: #ffffff;
            color: #000;
            cursor: pointer;
        }

        .return-but-inp:hover {
            color: #5d5d5d;
        }

        .left-spacing {
            margin-left: 10px;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>添加资产信息</span>
</div>


<form id="oaActOfficeSupplies">

    <div id="addRow" style="float: right;margin-bottom: 10px;">
        <div style="float: right">
            <input type="button" value="添加数据行(10)" onclick="addRow(10)" class="table-tab-send">
        </div>

        <div style="margin-right: 10px;float: right">
            <input type="button" value="添加数据行(3)" onclick="addRow(3)" class="table-tab-send">
        </div>

        <div style="margin-right: 10px;float: right">
            <input type="button" value="添加数据行(1)" onclick="addRow(1)" class="table-tab-send">
        </div>
    </div>

    <table class="formTable" style="margin: 0">
        <thead>
        <tr>
            <th style="width: 7%">序号</th>
            <th style="width: 40%">资产名称</th>
            <th style="width: 16%">数量</th>
            <th style="width: 16%">时间</th>
            <th style="width: 21%">备注</th>
        </tr>
        </thead>

        <tbody id="tbo">
        <tr>
            <td class="table-td-content" style="text-align: center;">1</td>

            <td class="table-td-content">
                <input type="text" class="formInput" id="assetsName"
                       onkeyup="value=value.replace(/\s+/g,'')" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput" id="productQuantity"
                       onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput-readonly" id="createTimeStr"
                       value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput" id="remark" autocomplete="off">
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form_but" style="margin: 20px 0;text-align: center;">
    <input type="button" class="commit-but-inp" value="提交" onclick="send()">
    <input type="button" class="return-but-inp left-spacing" value="返回" onclick="previousPage()">
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //数据行id递增
    let rowId = 1;

    //添加数据行
    function addRow(row) {
        var content = '';
        for (let i = 0; i < row; i++) {
            rowId++;
            content +=
                '<tr>\n' +
                '            <td class="table-td-content" style="text-align: center;">' + rowId + '</td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" id="assetsName" onkeyup="value=value.replace(/\\s+/g,\'\')" autocomplete="off">\n' +
                '            </td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" id="productQuantity" onkeyup="value=value.replace(/^(0+)|[^\\d]+/g,\'\')" autocomplete="off">\n' +
                '            </td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput-readonly" id="createTimeStr" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">\n' +
                '            </td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" id="remark" autocomplete="off">\n' +
                '            </td>\n' +
                '        </tr>';
        }
        $('#tbo').append(content);
    }

    //发送
    function send() {
        var oaAssetManagements = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var na = $(tel[i]).find('td').find('#assetsName').val();
            var nb = $(tel[i]).find('td').find('#productQuantity').val();
            var da = $(tel[i]).find('td').find('#createTimeStr').val();
            var re = $(tel[i]).find('td').find('#remark').val();
            oaAssetManagements.push({
                assetsName: na,
                productQuantity: nb,
                createTimeStr: da,
                remarks: re
            })
        }

        $.ajax({
            type: "POST",
            url: '${path}/assetsManagement/addAssetsArchives',
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(oaAssetManagements),
            error: function (request) {
                window.top.tips("出错！", 6, 2, 1000);
            },
            success: function (result) {
                if (result === "success") {
                    window.location.href = "${path}/assetsManagement/toAssetsArchives?page=1";
                    window.top.tips("提交成功！", 0, 1, 1000);
                } else {
                    window.top.tips("提交失败！", 0, 2, 1000);
                }
            }
        })
    }

    //返回上一页
    function previousPage() {
        window.history.back();
    }

</script>
</html>

