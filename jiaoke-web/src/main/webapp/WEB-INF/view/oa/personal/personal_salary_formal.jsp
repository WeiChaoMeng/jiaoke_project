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
    <title>个人工资</title>
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
        <a><cite>个人事务</cite></a>
        <a><cite>个人工资</cite></a>
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
                    <table class="layui-table layui-form" lay-filter="demo">
                        <thead>
                        <tr>
                            <th style="width: 7%;">序号</th>
                            <th style="width: 9%;">结算月份</th>
                            <th style="width: 9%;">岗位工资</th>
                            <th style="width: 7%;">月奖</th>
                            <th style="width: 8%;">加班费</th>
                            <th style="width: 10%;">应发工资</th>
                            <th style="width: 15%;">应扣三险一金合计</th>
                            <th style="width: 11%;">个人所得税</th>
                            <th style="width: 8%;">会费</th>
                            <th style="width: 10%;">实发金额</th>
                            <th style="width: 6%">操作</th>
                        </tr>
                        </thead>

                        <tbody id="tbody">
                        <tr>
                            <td colspan="11" style="text-align: center;">没有查询到匹配记录</td>
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
<script type="text/javascript" src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //设置当前页
    var currentPage = '${currentPage}';
    var currentPageNum = JSON.parse(currentPage);

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

    //加载数据
    function loadData(page) {
        var title = $('#title').val();
        $.ajax({
            type: "post",
            url: '/wageStatistics/loadingPersonalSalaryFormalData',
            data: {'page': page},
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
            // url: '/meeting/searchFilter',
            data: {'page': page, 'projectName': projectName},
            async: false,
            success: function (data) {
                $('#page').val(1);
                var resultLists = JSON.parse(data);
                //总数
                $("#PageCount").val(resultLists.total);
                //每页显示条数
                $("#PageSize").val("13");
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

        if (resultLists === 'noData' || resultLists.total === 0) {
            result += '<tr>';
            result += '<td colspan="11" style="text-align: center;">' + '没有查询到匹配记录' + '</td>';
            result += '</tr>';
            $("#PageCount").val(0);
            //每页显示条数
            $("#PageSize").val("13");
        } else {
            //当前页
            var pageNum = resultLists.pageNum;
            //总数
            $("#PageCount").val(resultLists.total);
            //每页显示条数
            $("#PageSize").val("13");
            //结果集
            var resultList = resultLists.list;

            for (let i = 0; i < resultList.length; i++) {
                result += '<tr>';
                result += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 13 + i + 1) + '</td>';
                result += '<td>' + resultList[i].settlementDate + '</td>';
                result += '<td>' + resultList[i].positionSalary + '</td>';
                result += '<td>' + resultList[i].monthlyAward + '</td>';
                result += '<td>' + resultList[i].overtimePay + '</td>';
                result += '<td>' + resultList[i].wagesPayable + '</td>';
                result += '<td>' + resultList[i].deductibleExpenses + '</td>';
                result += '<td>' + resultList[i].individualIncomeTax + '</td>';
                result += '<td>' + resultList[i].membershipFee + '</td>';
                result += '<td>' + resultList[i].actualAmount + '</td>';
                result +=
                    '<td class="td-manage" style="white-space: nowrap;">\n' +
                    '<button class="layui-btn layui-btn layui-btn-xs" onclick="particulars(\'' + resultList[i].id + '\')"><i class="layui-icon">&#xe642;</i>详情</button>\n' +
                    '</td>';
                result += '</tr>';
            }
        }
        $('#tbody').html(result);
    }

    //审批
    function particulars(id) {
        window.location.href = "${path}/wageStatistics/personalSalaryDetails?id=" + id;
    }
</script>
</html>