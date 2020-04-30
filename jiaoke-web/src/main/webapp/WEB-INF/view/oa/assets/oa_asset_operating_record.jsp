<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>操作记录</title>
    <link href="../../../../static/css/oa/resource_management.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body>

<div class="page_head">
    <table>
        <tbody>
        <tr>
            <td>
                <div>
                    <div class="conditional-query cursor_hand">
                        <input type="text" id="operatorPerson" class="search-bar cursor_hand" placeholder="操作人" autocomplete="off">
                        <i onclick="searchButton(1,2)" class="iconfont search-icon-size">&#xe7e7;</i>
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
        <th style="width: 15%;">操作前资产名字</th>
        <th style="width: 15%;">操作后资产名字</th>
        <th style="width: 10%;">操作前资产数量</th>
        <th style="width: 10%;">操作后资产数量</th>
        <th style="width: 10%;">操作类型</th>
        <th style="width: 17%;">操作说明</th>
        <th style="width: 10%;">操作人</th>
        <th style="width: 10%;">操作时间</th>
    </tr>
    </thead>

    <tbody id="tbody">
    <tr>
        <td colspan="9">暂无数据</td>
    </tr>
    </tbody>
</table>

<div id="fenye" style="right: 10px;height: 35px;position: absolute;bottom: 10px;">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
            <input type="hidden" id="PageCount" runat="server"/>
            <input type="hidden" id="PageSize" runat="server"/>
            <input type="hidden" id="countindex" runat="server"/>
            <!--设置最多显示的页码数 可以手动设置 默认为10-->
            <input type="hidden" id="visiblePages" runat="server" value="10"/>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
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
                $("#PageSize").val("15");
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
                $("#PageSize").val("15");
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
            assetReplenishment += '<td colspan="9">' + '暂无数据' + '</td>';
            assetReplenishment += '</tr>';
        } else {
            for (let i = 0; i < oaAssetReplenishmentList.length; i++) {
                assetReplenishment += '<tr>';
                assetReplenishment += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
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