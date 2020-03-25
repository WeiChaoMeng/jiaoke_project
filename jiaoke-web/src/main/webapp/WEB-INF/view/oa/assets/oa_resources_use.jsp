<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>领用记录</title>
    <link href="../../../../static/css/oa/resource_management.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="page_head">
    <table>
        <tbody>
        <tr>
            <td>
                <div>
                    <div class="conditional-query cursor_hand">
                        <input type="text" id="logonName" class="search-bar" placeholder="领用人" autocomplete="off">
                        <i onclick="searchButton(1,2)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<table class="simple_table">

    <thead>
    <tr>
        <th style="width: 3%;">序号</th>
        <th style="width: 21%;">资产名字</th>
        <th style="width: 10%;">领用前数量</th>
        <th style="width: 10%;">领用数量</th>
        <th style="width: 10%;">领用后剩余数量</th>
        <th style="width: 13%;">领用部门</th>
        <th style="width: 10%;">领用人</th>
        <th style="width: 13%;">领用时间</th>
        <th style="width: 10%;">保管人</th>
    </tr>
    </thead>

    <tbody id="tbody"></tbody>

</table>

<div id="fenye" class="paging-div">
    <div class="">
        <div class="" style="float: right;">
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

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script>

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    //初始化分页
    $(function () {
        //设置当前页
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

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
                $("#PageSize").val("15");
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
                $("#PageSize").val("15");
                parseResult(assetUses);
                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
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
            assetUse += '<td colspan="9">' + '暂无数据' + '</td>';
            assetUse += '</tr>';
        } else {
            for (let i = 0; i < assetUseList.length; i++) {
                assetUse += '<tr>';
                assetUse += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                assetUse += '<td style="text-align: left;text-indent: 10px;">' + assetUseList[i].assetName + '</td>';
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
