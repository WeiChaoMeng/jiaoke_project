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
    <title>补货记录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../../../../static/new/css/font.css">
    <script src="../../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../../static/new/css/xadmin.css">
    <link rel="stylesheet" href="../../../../static/new/css/paging.css">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a><cite>主页</cite></a>
        <a><cite>OA系统</cite></a>
        <a><cite>资源管理</cite></a>
        <a><cite>资产档案</cite></a>
        <a><cite>补货记录</cite></a>
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
                        <input type="text" id="datePicker" placeholder="请选择补货时间" autocomplete="off"
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
                            <th style="width: 7%;">序号</th>
                            <th style="width: 15%;">资产名字</th>
                            <th style="width: 8%;">保管人</th>
                            <th style="width: 12%;">补货前剩余数量</th>
                            <th style="width: 10%;">补货数量</th>
                            <th style="width: 10%;">补货人员</th>
                            <th style="width: 11%;">补货存放地点</th>
                            <th style="width: 12%;">备注</th>
                            <th style="width: 15%;">补货时间</th>
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
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script>

    //日期选择器
    jeDate(".je-replenish-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,                    //是否显示节日
        isinitVal: false,                   //是否初始化
        isTime: true,                        //是否开启时间选择
        isClear: true,                       //是否显示清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //记录档案页
    var archivesPage = '${archivesPage}';
    var archivesPageNum = JSON.parse(archivesPage);

    $(function () {
        loadData(1);
        loadPage(1);
    });

    function loadData(page) {
        var assetManagementId = $('#assetManagementId').val();
        $.ajax({
            type: "post",
            url: '/assetsManagement/assetReplenishmentRecord',
            data: {'page': page, 'assetManagementId': assetManagementId},
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

    //时间搜索
    function searchButton(page, parameter) {
        var createTime = $('#datePicker').val();
        var assetManagementId = $('#assetManagementId').val();
        $.ajax({
            type: "post",
            url: '/assetsManagement/replenishmentTimeFilter',
            data: {'page': page, 'createTime': createTime, 'assetManagementId': assetManagementId},
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
            assetReplenishment += '<td colspan="9" style="text-align: center;">' + '没有查询到匹配记录' + '</td>';
            assetReplenishment += '</tr>';
        } else {
            for (let i = 0; i < oaAssetReplenishmentList.length; i++) {
                assetReplenishment += '<tr>';
                assetReplenishment += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 12 + i + 1) + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].assetsName + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].assetsCustodian + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentBeforeQuantity + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentQuantity + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentPerson + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentStorageLocation + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentRemarks + '</td>';
                assetReplenishment += '<td>' + oaAssetReplenishmentList[i].createTimeStr + '</td>';
                assetReplenishment += '</tr>';
            }
        }
        $('#tbody').html(assetReplenishment);
    }
</script>
</html>