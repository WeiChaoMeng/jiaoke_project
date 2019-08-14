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
    <title>员工合同</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div style="width: 97%;margin: 0 auto;padding-top: 20px;display: table;">
    <div style="text-align: center;float: left;height: 60px;line-height: 70px;width: 150px;">
        <span>已签订合同<h2 style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">${sing}</h2>人</span>
    </div>

    <div style="text-align: center;float: left;height: 60px;line-height: 70px;width: 150px;">
        <span>未签订合同<h2 style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">${probation}</h2>人</span>
    </div>

    <div style="text-align: center;float: left;height: 60px;line-height: 70px;width: 150px;">
        <span>即将到期合同<h2 id="expire" style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">3</h2>人</span>
    </div>
</div>

<div class="table-margin">
    <table class="simple-table simple-table-contract">
        <thead>
        <tr>
            <th>姓名</th>
            <th>入职日期</th>
            <th>工作性质</th>
            <th>合同类型</th>
            <th>合同期限</th>
            <th>合同开始日期</th>
            <th>合同结束日期</th>
            <th>合同签订日期</th>
        </tr>
        </thead>

        <tbody id="tbody">
        <tr>
            <td>西西</td>
            <td>2019-02-10</td>
            <td>全职</td>
            <td>固定期限劳动合同</td>
            <td>1年</td>
            <td>2018-09-01</td>
            <td>2019-09-01</td>
            <td>2018-08-30</td>
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
            url: '/personnel/userContractData',
            data: {'page': page},
            async: false,
            success: function (data) {
                var userInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(userInfos.total);
                $("#totalNumberPeople").text(userInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(userInfos);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //名字搜索
    function searchButton(page, parameter) {
        var username = $('#logonName').val();
        $.ajax({
            type: "post",
            url: '/personnel/usernameFilter',
            data: {'page': page, 'username': username},
            async: false,
            success: function (data) {
                $('#page').val(1);
                var userInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(userInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(userInfos);
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
            userInfo += '<td colspan="8">' + '暂无数据' + '</td>';
            userInfo += '</tr>';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                if (userInfoList[i].expire === 1) {
                    count++;
                    userInfo += '<tr style="background: #fbdcb5;">';
                }else {
                    userInfo += '<tr>';
                }

                userInfo += '<td>' + userInfoList[i].name + '</td>';

                if (userInfoList[i].entryDateStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].entryDateStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                userInfo += '<td>' + userInfoList[i].nature + '</td>';

                if (userInfoList[i].type === 1){
                    userInfo += '<td>固定期限劳动合同</td>';
                }else {
                    userInfo += '<td>无固定期限劳动合同</td>';
                }

                if (userInfoList[i].term !== undefined) {
                    userInfo += '<td>' + userInfoList[i].term + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].startDateStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].startDateStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].endDateStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].endDateStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].singDateStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].singDateStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }
                userInfo += '</tr>';
            }

            $('#expire').text(count);
        }
        $('#tbody').html(userInfo);
    }
</script>
</html>
