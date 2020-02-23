<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>环评监测报告</title>
    <link href="../../../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="padding:15px 8px 0px 8px;">

    <div class="page-head">
        <table>
            <tbody>
            <tr>
                <td>
                    <div class="head-left-button">
                        <button type="button" class="cursor_hand" onclick="add()">&#xeb86; 新建</button>
                    </div>

                    <div class="separation_line"></div>

                    <div class="head-left-button">
                        <button type="button" class="cursor_hand" onclick="edit()">&#xe7e9; 编辑</button>
                    </div>

                    <div class="separation_line"></div>

                    <div class="head-left-button">
                        <button type="button" class="cursor_hand" onclick="remove()">&#xeaa5; 删除</button>
                    </div>
                </td>

                <td>
                    <div>
                        <div class="conditional-query cursor_hand">
                            <input type="text" id="fileName" class="search-bar" placeholder="文件名称" autocomplete="off">
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
        <th style="width: 3%;">序号</th>
        <th style="width: 20%;">报告编号</th>
        <th style="width: 28%;">样品名称</th>
        <th style="width: 28%;">检测单位</th>
        <th style="width: 18%;">检测日期</th>
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
            <input type="hidden" id="page"/>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../../../../static/js/oa/layer/layer.js"></script>
<script>

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/eiaMonitor/index',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaEiaMonitors = JSON.parse(data);
                //总数
                $("#PageCount").val(oaEiaMonitors.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaEiaMonitors);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //搜索按钮
    function searchButton(page, parameter) {
        var sampleName = $('#fileName').val();
        currentPageNum = page;

        $.ajax({
            type: 'POST',
            url: '/eiaMonitor/sampleNameFilter',
            data: {'sampleName': sampleName, 'page': page},
            async: false,
            success: function (result) {
                $('#tbody').empty();
                var oaEiaMonitors = JSON.parse(result);
                //总数
                $("#PageCount").val(oaEiaMonitors.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaEiaMonitors);
                loadPage(parameter);
            },
            error: function () {
                alert("Connection error");
            }
        })
    }

    //解析筛选后的list
    function parseList(oaEiaMonitors) {
        //结果集
        var oaEiaMonitorList = oaEiaMonitors.list;
        //当前页
        var pageNum = oaEiaMonitors.pageNum;

        var oaEiaMonitor = '';
        if (oaEiaMonitorList.length === 0) {
            oaEiaMonitor += '<tr>';
            oaEiaMonitor += '<td colspan="6">' + '暂无数据' + '</td>';
            oaEiaMonitor += '</tr>';
        } else {
            for (let i = 0; i < oaEiaMonitorList.length; i++) {
                oaEiaMonitor += '<tr onclick="particulars(' + oaEiaMonitorList[i].id + ')">';
                oaEiaMonitor += '<td><input type="checkbox" value="' + oaEiaMonitorList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                oaEiaMonitor += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                oaEiaMonitor += '<td>' + oaEiaMonitorList[i].reportNumber + '</td>';
                oaEiaMonitor += '<td>' + oaEiaMonitorList[i].sampleName + '</td>';
                oaEiaMonitor += '<td>' + oaEiaMonitorList[i].testingCompany + '</td>';
                oaEiaMonitor += '<td>' + oaEiaMonitorList[i].testingDateStr + '</td>';
                oaEiaMonitor += '</tr>';
            }
        }
        $('#tbody').html(oaEiaMonitor);
    }

    //内容列表选中颜色
    $("#tbody").on('click', 'tr', function () {
        if ($(this).hasClass("clickColor")) {
            $(this).removeClass("clickColor");
        } else {
            var trs = $(this).parent().find("tr");
            trs.removeClass("clickColor");
            $(this).addClass("clickColor");
        }
    });

    //分页
    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //搜索
        }  else if (parameter === 2) {
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

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

    //新建
    function add(){
        var prev = $('#page').val();
        window.location.href = '${path}/eiaMonitor/toNewEiaMonitor?prev=' + prev;
    }

    //详情
    function particulars(id) {
        var prev = $('#page').val();
        window.location.href = "${path}/eiaMonitor/details?id=" + id + "&prev=" + prev;
    }

    //修改
    function edit() {
        let length = $("tbody input:checked").length;
        if (length != 1) {
            layer.msg('请选择一条数据！');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            var prev = $('#page').val();
            window.location.href = "${path}/eiaMonitor/toEdit?id=" + id + "&prev=" + prev;
        }
    }

    //删除
    function remove(){
        let length = $("tbody input:checked").length;
        if (length !== 1) {
            layer.msg('请选择一条数据！');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            //主页fun
            window.top.deleteArchivesData('/eiaMonitor', id, $('#page').val());
        }
    }

    //重载页面
    function reloadArchivesData(page) {
        window.location.href = "${path}/eiaMonitor/toEiaMonitor?page=" + page;
    }
</script>
</html>
