<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>待发事项</title>
    <link href="../../../../static/css/oa/oa_coordination.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="page_head">
    <table>
        <tbody>
        <tr>
            <td>
                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="edit()">&#xe7e9; 编辑</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="del()">&#xeaa5; 删除</button>
                </div>
            </td>

            <td>
                <div>
                    <div class="conditional-query cursor_hand">
                        <input type="text" id="title" class="search-bar" placeholder="标题" autocomplete="off">
                        <i onclick="loadData(1)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<table class="simple_table cursor_hand">

    <thead>
    <th style="width: 3%;"><input type="checkbox"></th>
    <th style="width: 3%;">序号</th>
    <th style="width: 64%;">标题</th>
    <th style="width: 15%;">状态</th>
    <th style="width: 15%;">创建时间</th>
    </thead>

    <tbody id="tbody">

    </tbody>

</table>

<div id="paging" class="paging-div">
    <ul class="pagination" id="pagination" style="margin: 0"></ul>
    <input type="hidden" id="PageCount" runat="server"/>
    <input type="hidden" id="PageSize" runat="server"/>
    <input type="hidden" id="countindex" runat="server"/>
    <!--设置最多显示的页码数 可以手动设置 默认为10-->
    <input type="hidden" id="visiblePages" runat="server" value="10"/>
    <input type="hidden" id="page"/>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
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

    //加载数据
    function loadData(page) {
        var title = $('#title').val();
        $.ajax({
            type: "post",
            url: '/collaboration/loadingWaitSendData',
            data: {'page': page, 'title': title},
            async: false,
            success: function (data) {
                var resultLists = JSON.parse(data);
                //总数
                $("#PageCount").val(resultLists.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(resultLists);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    }

    //搜索
    function searchButton(page, parameter) {
        var projectName = $('#purchaser').val();
        $.ajax({
            type: "post",
            url: '/collaboration/searchFilter',
            data: {'page': page, 'projectName': projectName},
            async: false,
            success: function (data) {
                $('#page').val(1);
                var resultLists = JSON.parse(data);
                //总数
                $("#PageCount").val(resultLists.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(resultLists);
                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //搜索
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
    function parseResult(resultLists) {
        //结果集
        var resultList = resultLists.list;
        //当前页
        var pageNum = resultLists.pageNum;
        //插入tbody
        var result = '';
        if (resultList.length === 0) {
            result += '<tr>';
            result += '<td colspan="5">' + '没有查询到匹配记录' + '</td>';
            result += '</tr>';
        } else {
            for (let i = 0; i < resultList.length; i++) {
                result += '<tr onclick="particulars(\'' + resultList[i].url + '\',\'' + resultList[i].correlationId + '\',\'' + resultList[i].processInstanceId + '\')">';
                result += '<td><input type="checkbox" value="' + resultList[i].url + ',' + resultList[i].correlationId + ',' + resultList[i].table + '" onclick="window.event.cancelBubble=true;"></td>';
                result += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                result += '<td style="text-align:left;text-indent:10px" title="' + resultList[i].title + '">' + resultList[i].title + '</td>';
                if (resultList[i].state === 1) {
                    result += '<td>草稿</td>';
                } else if (resultList[i].state === 2) {
                    result += '<td>撤销</td>';
                } else if (resultList[i].state === 3) {
                    result += '<td>被回退</td>';
                } else {
                    result += '<td>其他</td>';
                }
                result += '<td>' + resultList[i].createTimeStr + '</td>';
                result += '</tr>';
            }
        }
        $('#tbody').html(result);
    }

    //详情
    function particulars(url, correlationId, processInstanceId) {
        url += "/details";
        window.location.href = "${path}" + url + "?id=" + correlationId + "&taskId=" + processInstanceId;
    }

    //编辑
    function edit() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var val = $("#tbody input:checked").val();
            //拼接controller
            var arr = val.split(",");
            var url = arr[0] + "/toEdit";
            window.location.href = "${path}" + url + "?id=" + arr[1];
        }
    }

    //删除
    function del() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var val = $("#tbody input:checked").val();
            var arr = val.split(",");
            //主页fun
            window.top.deleteWaitSend(arr[1], arr[2], $('#page').val());
        }
    }

    //重载页面
    function reloadWaitSendDocument(page) {
        window.location.href = "${path}/collaboration/waitSend?page=" + page;
    }
</script>
</html>
