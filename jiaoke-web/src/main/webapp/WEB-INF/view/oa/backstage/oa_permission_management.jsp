<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>权限管理</title>
    <link rel="stylesheet" href="../../../../static/tree/assets/layui/css/layui.css">
</head>

<body>

<div class="cursor_hand layui-container layui-text" style="width: 80%">
    <table id="table1" class="layui-table" lay-filter="table1"></table>
</div>

</body>
<script src="../../../../static/tree/assets/layui/layui.js"></script>
<script>
    layui.config({
        base: '../../../../static/tree/module/'
    }).extend({
        treetable: 'treetable-lay/treetable'
    }).use(['layer', 'table', 'treetable'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var treetable = layui.treetable;

        // 渲染表格
        var renderTable = function () {
            //加载层
            layer.load(2);
            treetable.render({
                treeColIndex: 1,
                treeSpid: -1,
                treeIdName: 'id',
                treePidName: 'pid',
                treeDefaultClose: true,
                treeLinkage: false,
                elem: '#table1',
                // url: '../../../../static/tree/newdata.json',
                url: '${path}/backstageManagement/permissionManager',
                page: false,
                cols: [[
                    {type: 'numbers'},
                    {field: 'description', title: '权限名称'},
                    {field: 'url', title: '权限标识'},
                    {field: 'createTime', title: '创建日期'}
                ]],
                done: function () {
                    layer.closeAll('loading');
                }
            });
        };

        renderTable();
    });
</script>
</html>