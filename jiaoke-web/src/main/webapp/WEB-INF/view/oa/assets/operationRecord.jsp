<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>操作记录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../../../../static/new/css/font.css">
    <script src="../../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../../static/new/css/xadmin.css">
    <link rel="stylesheet" href="../../../../static/new/css/paging.css">
</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a><cite>主页</cite></a>
        <a><cite>OA系统</cite></a>
        <a><cite>资源管理</cite></a>
        <a><cite>资产档案</cite></a>
        <a><cite>操作记录</cite></a>
    </span>

    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body" style="text-align: right">
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="text" id="operatorPerson" placeholder="请输入操作人" autocomplete="off"
                               class="layui-input je-replenish-date">
                    </div>

                    <div class="layui-input-inline layui-show-xs-block" style="margin-left: 10px;">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="searchButton(1,2)">
                            <i class="layui-icon">&#xe615;</i></button>
                    </div>
                </div>

                <input type="hidden" value="${assetManagementId}" id="assetManagementId">

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-filter="demo">
                        <thead>
                        <tr>
                            <th style="width: 6%;">序号</th>
                            <th style="width: 15%;">操作前资产名字</th>
                            <th style="width: 15%;">操作后资产名字</th>
                            <th style="width: 12%;">操作前资产数量</th>
                            <th style="width: 12%;">操作后资产数量</th>
                            <th style="width: 8%;">操作类型</th>
                            <th style="width: 10%;">操作说明</th>
                            <th style="width: 7%;">操作人</th>
                            <th style="width: 15%;">操作时间</th>
                        </thead>

                        <tbody id="tbody">
                        <tr>
                            <td colspan="9" style="text-align: center;">没有查询到匹配记录</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="layui-card-body">
                    <div class="" style="text-align: right;">
                        <ul class="pagination" id="pagination" style="margin: 0"></ul>
                        <input type="hidden" id="PageCount" runat="server"/>
                        <input type="hidden" id="PageSize" runat="server"/>
                        <input type="hidden" id="countindex" runat="server"/>
                        <!--设置最多显示的页码数 可以手动设置 默认为10-->
                        <input type="hidden" id="visiblePages" runat="server" value="10"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script type="text/javascript" src="../../../../static/new/js/xadmin.js"></script>
<script>
    $(function () {
        loadData(1);
        loadPage(1);
    });

    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/assetsManagement/assetOperatingRecord',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaAssetReplenishment = JSON.parse(data);
                //总数
                $("#PageCount").val(oaAssetReplenishment.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(oaAssetReplenishment);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //搜索
    function searchButton(page, parameter) {
        var operatorPerson = $('#operatorPerson').val();
        $.ajax({
            type: "post",
            url: '/assetsManagement/operatorPersonFilter',
            data: {'page': page, 'operatorPerson': operatorPerson},
            async: false,
            success: function (data) {
                var oaAssetReplenishment = JSON.parse(data);
                //总数
                $("#PageCount").val(oaAssetReplenishment.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(oaAssetReplenishment);
                loadPage(parameter);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //分页
    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //时间搜索
        } else if (parameter === 2) {
            searchButton(page);
            loadPage(parameter);
        }
    }

    function loadPage(parameter) {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = myPageCount === 0 ? 1 : Math.ceil(myPageCount / myPageSize);
        $("#countindex").val(countindex);

        $.jqPaginator('#pagination', {
            totalPages: parseInt($("#countindex").val()),
            visiblePages: parseInt($("#visiblePages").val()),
            currentPage: 1,
            first: '<li class="first"><a href="javascript:;">首页</a></li>',
            prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
            next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
            last: '<li class="last"><a href="javascript:;">末页</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (page, type) {
                if (type == "change") {
                    exeData(page, type, parameter);
                }
            }
        });
    }

    //解析list
    function parseResult(oaAssetReplenishment) {
        //结果集
        var oaAssetReplenishmentList = oaAssetReplenishment.list;
        //当前页
        var pageNum = oaAssetReplenishment.pageNum;
        //插入tbody
        var assetReplenishment = '';
        if (oaAssetReplenishmentList.length === 0) {
            assetReplenishment += '<tr>';
            assetReplenishment += '<td colspan="9" style="text-align: center">' + '没有查询到匹配记录' + '</td>';
            assetReplenishment += '</tr>';
        } else {
            for (let i = 0; i < oaAssetReplenishmentList.length; i++) {
                assetReplenishment += '<tr>';
                assetReplenishment += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 12 + i + 1) + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].beforeAssetsName + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].afterAssetsName + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].beforeAssetsNumber + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].afterAssetsNumber + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].operatorType + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].operatorDescription + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].operatorPerson + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].operatorTime + '</td>';
                assetReplenishment += '</tr>';
            }
        }
        $('#tbody').html(assetReplenishment);
    }
</script>
</html>