<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>新闻列表</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="page_head">
    <table style="width: 100%;">
        <tbody>
        <tr>
            <td>
                <shiro:hasPermission name="news:add">
                    <div class="head_left_button" style="line-height: 30px">
                        <button type="button" class="cursor_hand" onclick="add()">&#xeb86; 添加</button>
                    </div>
                </shiro:hasPermission>

                <shiro:hasPermission name="news:delete">
                    <div class="head_left_button" style="line-height: 30px">
                        <button type="button" class="cursor_hand" onclick="del()">&#xeaa5; 删除</button>
                    </div>
                </shiro:hasPermission>
            </td>
            <td>
                <div>
                    <div class="conditional-query cursor_hand">
                        <input type="text" id="title" class="search-bar" placeholder="标题" autocomplete="off">
                        <i onclick="searchButton(1,2)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<table class="simpletable">

    <thead>
    <th style="width: 3%;"><input type="checkbox"></th>
    <th style="width: 5%">序号</th>
    <th style="width: 30%">标题</th>
    <th style="width: 14%">发布部门</th>
    <th style="width: 10%">发布人</th>
    <th style="width: 13%">发布时间</th>
    <th style="width: 25%">摘要</th>
    </thead>

    <tbody id="tbody">

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
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //新闻详情
    function particulars(id) {
        window.location.href = '${path}/newsCenter/newsDetails?id=' + id;
    }

    //分页
    $(function () {
        loadData(1);
        loadPage(1);
    });

    //分页
    function exeData(page, type) {
        loadData(page);
        loadPage();
    }

    function loadPage() {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = Math.ceil(myPageCount / myPageSize);
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
                    exeData(page, type);
                }
            }
        });
    }

    //加载数据
    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/newsCenter/newsListData',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaNewsCenters = JSON.parse(data);
                //总数
                $("#PageCount").val(oaNewsCenters.total);
                //每页显示条数
                $("#PageSize").val("15");
                //结果集
                var oaNewsCenterList = oaNewsCenters.list;
                //当前页
                var pageNum = oaNewsCenters.pageNum;
                //插入tbody
                var oaNewsCenter = '';
                if (oaNewsCenterList.length === 0) {
                    oaNewsCenter += '<tr>';
                    oaNewsCenter += '<td colspan="7">' + '暂无数据' + '</td>';
                    oaNewsCenter += '</tr>';
                } else {
                    for (let i = 0; i < oaNewsCenterList.length; i++) {
                        oaNewsCenter += '<tr onclick="particulars(' + oaNewsCenterList[i].id + ')">';
                        oaNewsCenter += '<td><input type="checkbox" value="' + oaNewsCenterList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        oaNewsCenter += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                        oaNewsCenter += '<td style="text-align: left;text-indent: 10px;">' + oaNewsCenterList[i].newsHeadlines + '</td>';
                        oaNewsCenter += '<td>' + oaNewsCenterList[i].releaseDepartment + '</td>';
                        oaNewsCenter += '<td>' + oaNewsCenterList[i].publisher + '</td>';
                        oaNewsCenter += '<td>' + oaNewsCenterList[i].releaseDateStr + '</td>';
                        oaNewsCenter += '<td style="text-align: left;text-indent: 10px;">' + oaNewsCenterList[i].summary + '</td>';
                        oaNewsCenter += '</tr>';
                    }
                }

                $('#tbody').html(oaNewsCenter);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //删除
    function del() {
        let length = $("tbody input:checked").length;
        if (length !== 1) {
            layer.msg('请选择一条数据！');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            //主页fun
            window.top.cultureCorporateDelete('/newsCenter', id, $('#page').val());
        }
    }

    //新增
    function add() {
        window.location.href = '/newsCenter/toNewsRelease';
    }

    function reloadCultureCorporateData() {
        window.location.href = '${path}/newsCenter/toNewsList';
    }
</script>
</html>
