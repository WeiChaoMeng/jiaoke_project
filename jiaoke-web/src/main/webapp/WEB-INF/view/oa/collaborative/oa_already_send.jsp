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
    <title>已发事项</title>
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
        <a><cite>协同工作</cite></a>
        <a><cite>已发事项</cite></a>
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
                <div class="layui-card-body ">
                    <button class="layui-btn layui-btn-danger" data-type="getid" onclick="delAll()">
                        <i class="layui-icon"></i>批量删除
                    </button>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;margin-left: 10px;">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="loadData(1)">
                            <i class="layui-icon">&#xe615;</i></button>
                    </div>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;">
                        <input type="text" id="title" placeholder="请输入标题" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-filter="demo">
                        <thead>
                        <tr>
                            <th style="width: 3%;">
                                <input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose">
                            </th>
                            <th style="width: 7%">序号</th>
                            <th style="width: 41%">标题</th>
                            <th style="width: 15%">发起时间</th>
                            <th style="width: 15%">当前待办人</th>
                            <th style="width: 19%">操作</th>
                        </thead>

                        <tbody id="tbody">
                        <tr>
                            <td colspan="6" style="text-align: center;">没有查询到匹配记录</td>
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
    var currentPage = '${currentPage}';
    var currentPageNum = JSON.parse(currentPage);

    var itselfFrameId;

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //加载数据
    function loadData(page) {
        var title = $('#title').val();
        $.ajax({
            type: "post",
            url: '/collaboration/loadingAlreadySendData',
            data: {'page': page,'title':title},
            async: false,
            success: function (data) {
                var resultLists = JSON.parse(data);
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
        var result = '';

        if (resultLists === 'noData') {
            result += '<tr>';
            result += '<td colspan="6" style="text-align: center">' + '没有查询到匹配记录' + '</td>';
            result += '</tr>';
            $("#PageCount").val(0);
            //每页显示条数
            $("#PageSize").val("12");
        } else {
            //当前页
            var pageNum = resultLists.pageNum;
            //总数
            $("#PageCount").val(resultLists.total);
            //每页显示条数
            $("#PageSize").val("12");
            //结果集
            var resultList = resultLists.list;

            for (let i = 0; i < resultList.length; i++) {
                result += '<tr>';
                result += '<td><input type="checkbox" name="show" lay-skin="primary" lay-filter="choose" value="' + resultList[i].table + ',' + resultList[i].correlationId + ',' + resultList[i].processInstanceId + '">' +
                    '<div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div></td>';
                result += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 12 + i + 1) + '</td>';
                result += '<td title="' + resultList[i].title + '">' + resultList[i].title + '</td>';
                result += '<td>' + resultList[i].startTimeStr + '</td>';
                result += '<td style="color: #2196F3;font-weight: 600;">' + resultList[i].currentExecutor + '</td>';
                result +=
                    '<td class="td-manage" style="white-space: nowrap;">\n' +
                    '<button class="layui-btn layui-btn layui-btn-xs" onclick="rescind(\'' + resultList[i].url + '\',\'' + resultList[i].processInstanceId + '\',\'' + resultList[i].correlationId + '\')"><i class="layui-icon">&#xe642;</i>撤销流程</button>\n' +
                    '<button class="layui-btn-danger layui-btn layui-btn-xs" onclick="del(\'' + resultList[i].url + '\',\'' + resultList[i].processInstanceId + '\',\'' + resultList[i].correlationId + '\')"><i class="layui-icon">&#xe640;</i>删除</button>\n' +
                    '<button class="layui-btn layui-btn-normal layui-btn-xs" onclick="particulars(\'' + resultList[i].url + '\',\'' + resultList[i].correlationId + '\',\'' + resultList[i].processInstanceId + '\')"><i class="layui-icon">&#xe63c;</i>详情</button>\n' +
                    '</td>';
                result += '</tr>';
            }
        }
        $('#tbody').html(result);
        renderCheckBox();
    }

    //详情
    function particulars(url, correlationId, processInstanceId) {
        if (url.indexOf('.do') !== -1) {
            window.location.href = "${path}details" + url + "?id=" + correlationId + "&taskId=" + processInstanceId;
        } else {
            url += "/details";
            window.location.href = "${path}" + url + "?id=" + correlationId + "&taskId=" + processInstanceId;
        }
    }

    //撤销流程
    function rescind(url,correlationId, processInstanceId) {
        if (url.indexOf('.do') !== -1) {
            url = "/rescind" + url;
        }else {
            url = "/" + url + "/rescind";
        }

        //主页fun
        window.top.rescindAlreadySend(url, processInstanceId, correlationId, $('#page').val(),itselfFrameId);
    }

    //删除
    function del(url,correlationId, processInstanceId) {
        if (url.indexOf('.do') !== -1) {
            url = "/delete" + url;
        }else {
            url = "/" + url + "/delete";
        }

        //主页fun
        window.top.deleteAlreadySend(url, processInstanceId , correlationId, $('#page').val(),itselfFrameId);
    }

    //重载页面
    function reloadAlreadySendDocument(page) {
        window.location.href = "${path}/collaboration/alreadySend?page=" + page;
    }

    //批量删除全选
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        // 监听全选
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

        //通过判断机构是否全部选中来确定全选按钮是否选中
        form.on("checkbox(choose)", function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:checked')
            if (childChecked.length == child.length) {
                $(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
            } else {
                $(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
            }
            form.render('checkbox');
        });
    });

    function delAll() {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).val())
            }
        });

        window.top.batchDeleteData("/collaboration/batchDeleteAlreadySend", ids, itselfFrameId);
    }

    //重载页面（批量删除）
    function batchDeletePageReload(page) {
        window.location.href = "${path}/collaboration/alreadySend?page=" + page;
    }

    //重新渲染checkbox
    function renderCheckBox() {
        layui.use(['laydate', 'form'], function () {
            var form = layui.form;
            form.render('checkbox');
        })
    }
</script>
</html>