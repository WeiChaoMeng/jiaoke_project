<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>职位变动管理</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="personnel-manage-style">
    <div class="top-statistics">
        <div class="top-statistics-style">
            <span>职位变动<h2 id="waitingLeave">0</h2>人</span>
        </div>
    </div>

    <div class="personnel-manage-content">
        <table class="simple-table simple-table-job-change">
            <thead>
            <tr>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>原职务</th>
                <th>现职务</th>
                <th>原岗位</th>
                <th>现岗位</th>
                <th>现岗位任职时间</th>
                <th>转岗时间</th>
                <th>试用期</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody id="tbody"></tbody>

            <div id="paging" class="paging-div">
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
        </table>
    </div>

</div>

</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
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
        $.ajax({
            type: "post",
            url: '/personnel/jobChange',
            data: {'page': page},
            async: false,
            success: function (data) {
                var userInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(userInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(userInfos);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    function exeData(page, type) {
        loadData(page);
        loadPage();
    }

    function loadPage() {
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
                    exeData(page, type);
                }
            }
        });
    }

    //解析list
    function parseResult(userInfos) {
        var sum = 0;
        var count = 0;
        //结果集
        var userInfoList = userInfos.list;
        //当前页
        var pageNum = userInfos.pageNum;
        //插入tbody
        var userInfo = '';
        if (userInfoList.length === 0) {
            userInfo += '<tr>';
            userInfo += '<td colspan="11">' + '暂无数据' + '</td>';
            userInfo += '</tr>';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                sum++;
                userInfo += '<tr>';
                userInfo += '<td>' + userInfoList[i].name + '</td>';
                userInfo += '<td>' + userInfoList[i].sex + '</td>';
                userInfo += '<td>' + userInfoList[i].age + '</td>';
                userInfo += '<td>' + userInfoList[i].originalPosition + '</td>';
                userInfo += '<td>' + userInfoList[i].job + '</td>';
                userInfo += '<td>' + userInfoList[i].viceJob + '</td>';
                userInfo += '<td>' + userInfoList[i].originalPost + '</td>';
                userInfo += '<td>' + userInfoList[i].currentPosition + '</td>';
                userInfo += '<td>' + userInfoList[i].transfer + '</td>';
                userInfo += '<td>' + userInfoList[i].joinedDate + ' ~ ' + userInfoList[i].correctionDate + '</td>';
                userInfo += '<td>';
                userInfo += '<button type="button" class="basic-info-operation" onclick="particulars(\'' + userInfoList[i].id + '\')">详情</button>';
                userInfo += '</td>';
                userInfo += '</tr>';
            }

            $('#waitingLeave').text(sum);
        }
        $('#tbody').html(userInfo);
    }

    function particulars(id) {
        window.top.personnelDetails(id);
    }
</script>
</html>
