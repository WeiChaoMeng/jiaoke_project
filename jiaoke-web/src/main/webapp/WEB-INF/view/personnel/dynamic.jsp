<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-8
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>动态管理</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div id="category" style="padding-top: 20px;text-align: center;">
    <div id="entryBorder" style="width: 100px;display: inline-block;cursor: pointer;height: 30px;line-height: 20px;">
        <span style="font-size: 14px">入职管理</span>
    </div>

    <div id="quitBorder" style="width: 100px;display: inline-block;cursor: pointer;height: 30px;line-height: 20px;">
        <span style="font-size: 14px">离职管理</span>
    </div>
</div>

<%--入职--%>
<div id="entry" style="display: none">
    <div style="width: 97%;margin: 0 auto;display: table;">
        <div style="text-align: center;float: left;width: 130px;height: 60px;line-height: 70px;">
            <span>试用期<h2
                    style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">${probation}</h2>人</span>
        </div>

        <div style="text-align: center;float: left;height: 60px;line-height: 70px;width: 130px;">
            <span>即将转正<h2 id="expire"
                          style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">1</h2>人</span>
        </div>
    </div>

    <div class="table-margin" style="background-color: #ffffff">
        <div style="display: table;">
            <span style="font-size: 13px;">试用期</span>
        </div>

        <div style="padding: 10px 25px;">
            <table class="simple-table simple-table-dynamic">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>部门</th>
                    <th>岗位</th>
                    <th>职务</th>
                    <th>入职日期</th>
                    <th>转正日期</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody id="tbody">
                <tr>
                    <td>西西</td>
                    <td>财务部</td>
                    <td>出纳</td>
                    <td>员工</td>
                    <td>2019-03-01</td>
                    <td>2019-05-01</td>
                    <td>办理转正</td>
                </tr>
                </tbody>
            </table>

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
        </div>
    </div>
</div>

<%--离职--%>
<div id="quit" style="display: none">
    <div style="width: 97%;margin: 0 auto;display: table;">
        <div style="text-align: center;float: left;width: 130px;height: 60px;line-height: 70px;">
            <span>待离职<h2
                    style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">${soonLeave}</h2>人</span>
        </div>

        <div style="text-align: center;float: left;height: 60px;line-height: 70px;width: 130px;">
            <span>已离职<h2 style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">${leave}</h2>人</span>
        </div>
    </div>

    <div class="table-margin" style="background-color: #ffffff;min-height: 160px;">
        <div>
            <span style="font-size: 13px;">待离职</span>
            <span class="more-data">查看更多>></span>
        </div>

        <div style="padding: 10px 25px;">
            <table class="simple-table simple-table-dynamic">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>部门</th>
                    <th>岗位</th>
                    <th>职务</th>
                    <th>入职日期</th>
                    <th>预离职日期</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${soonLeaveData}" var="soonLeave">
                    <tr>
                        <td>${soonLeave.name}</td>
                        <td>${soonLeave.dep}</td>
                        <td>${soonLeave.pos}</td>
                        <td>${soonLeave.job}</td>
                        <td>${soonLeave.entryDateStr}</td>
                        <td>${soonLeave.soonLeaveDateStr}</td>
                        <td>确认离职</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="table-margin" style="background-color: #ffffff;min-height: 300px;">
        <div>
            <span style="font-size: 13px;">已离职</span>
            <span class="more-data">查看更多>></span>
        </div>

        <div style="padding: 10px 25px;">
            <table class="simple-table simple-table-dynamic">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>部门</th>
                    <th>岗位</th>
                    <th>职务</th>
                    <th>入职日期</th>
                    <th>离职日期</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${leaveData}" var="leave">
                    <tr>
                        <td>${leave.name}</td>
                        <td>${leave.dep}</td>
                        <td>${leave.pos}</td>
                        <td>${leave.job}</td>
                        <td>${leave.entryDateStr}</td>
                        <td>${leave.leaveDateStr}</td>
                        <td>重新入职</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script>

    $(function () {
        $('#entryBorder').addClass('dynamic-category');
        $('#entry').show();
    });

    $('#entryBorder').on('click', function () {
        $('#entryBorder').addClass('dynamic-category');
        $('#quitBorder').removeClass('dynamic-category');
        $('#entry').show();
        $('#quit').hide();
    });

    $('#quitBorder').on('click', function () {
        $('#quitBorder').addClass('dynamic-category');
        $('#entryBorder').removeClass('dynamic-category');
        $('#quit').show();
        $('#entry').hide();
    });


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
            url: '/personnel/dynamicData',
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
        var count = 0;
        //结果集
        var userInfoList = userInfos.list;
        //当前页
        var pageNum = userInfos.pageNum;
        //插入tbody
        var userInfo = '';
        if (userInfoList.length === 0) {
            userInfo += '<tr>';
            userInfo += '<td colspan="7">' + '暂无数据' + '</td>';
            userInfo += '</tr>';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                if (userInfoList[i].expire === 1) {
                    count++;
                    userInfo += '<tr style="background: #fbdcb5;">';
                } else {
                    userInfo += '<tr>';
                }

                userInfo += '<td>' + userInfoList[i].name + '</td>';

                if (userInfoList[i].dep !== undefined) {
                    userInfo += '<td>' + userInfoList[i].dep + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].pos !== undefined) {
                    userInfo += '<td>' + userInfoList[i].pos + '</td>';
                } else {
                    userInfo += '<td></td>';
                }


                if (userInfoList[i].job !== undefined) {
                    userInfo += '<td>' + userInfoList[i].job + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].entryDateStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].entryDateStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].positiveDateStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].positiveDateStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                userInfo += '<td style="cursor: pointer">办理入职</td>';

                userInfo += '</tr>';
            }

            $('#expire').text(count);
        }
        $('#tbody').html(userInfo);
    }
</script>
</html>
