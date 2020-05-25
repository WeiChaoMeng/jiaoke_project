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
    <title>领用记录</title>
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
        <a><cite>领用记录</cite></a>
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
                        <input type="text" id="logonName" placeholder="请输入领用人" autocomplete="off"
                               class="layui-input">
                    </div>

                    <div class="layui-input-inline layui-show-xs-block" style="margin-left: 10px;">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="searchButton(1,2)">
                            <i class="layui-icon">&#xe615;</i></button>
                    </div>
                </div>

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-filter="demo">
                        <thead>
                        <tr>
                            <th style="width: 7%;">序号</th>
                            <th style="width: 19%;">资产名字</th>
                            <th style="width: 11%;">领用前数量</th>
                            <th style="width: 10%;">领用数量</th>
                            <th style="width: 10%;">剩余数量</th>
                            <th style="width: 10%;">领用部门</th>
                            <th style="width: 10%;">领用人</th>
                            <th style="width: 13%;">领用时间</th>
                            <th style="width: 10%;">保管人</th>
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
                        <input type="hidden" id="page" value="1"/>
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
    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    var itselfFrameId;

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/assetsManagement/assetUse',
            data: {'page': page},
            async: false,
            success: function (data) {
                var assetUses = JSON.parse(data);
                //总数
                $("#PageCount").val(assetUses.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(assetUses);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //名字搜索
    function searchButton(page, parameter) {
        var assetName = $('#logonName').val();
        $.ajax({
            type: "post",
            url: '/assetsManagement/assetNameFilter',
            data: {'page': page, 'assetName': assetName},
            async: false,
            success: function (data) {
                $('#page').val(1);
                var assetUses = JSON.parse(data);
                //总数
                $("#PageCount").val(assetUses.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(assetUses);
                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //分页
    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //名字搜索
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
            currentPage: currentPageNum,
            first: '<li class="first"><a href="javascript:;">首页</a></li>',
            prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
            next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
            last: '<li class="last"><a href="javascript:;">末页</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (page, type) {
                if (type == "change") {
                    $('#page').val(page);
                    exeData(page, type, parameter);
                }
            }
        });
    }

    //解析list
    function parseResult(assetUses) {
        //结果集
        var assetUseList = assetUses.list;
        //当前页
        var pageNum = assetUses.pageNum;
        //插入tbody
        var assetUse = '';
        if (assetUseList.length === 0) {
            assetUse += '<tr>';
            assetUse += '<td colspan="9"  style="text-align: center;">' + '没有查询到匹配记录' + '</td>';
            assetUse += '</tr>';
        } else {
            for (let i = 0; i < assetUseList.length; i++) {
                assetUse += '<tr>';
                assetUse += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 12 + i + 1) + '</td>';
                assetUse += '<td>' + assetUseList[i].assetName + '</td>';
                assetUse += '<td>' + assetUseList[i].useBeforeNumber + '</td>';
                assetUse += '<td>' + assetUseList[i].useNumber + '</td>';
                assetUse += '<td>' + assetUseList[i].useAfterNumber + '</td>';
                assetUse += '<td>' + assetUseList[i].useDepartment + '</td>';
                assetUse += '<td>' + assetUseList[i].usePerson + '</td>';
                assetUse += '<td>' + assetUseList[i].useDate + '</td>';
                assetUse += '<td>' + assetUseList[i].custodian + '</td>';
                assetUse += '</tr>';
            }
        }
        $('#tbody').html(assetUse);
    }
</script>
</html>