<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-8
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>基本信息</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="table-margin">
    <div style="padding: 15px;">
        <button type="button"
                style="padding: 5px 15px;border: 0;cursor: pointer;background: #38adff;outline: none;border-radius: 5px;color: #FFFFFF;font-size: 13px;"
                onclick="addPersonnel()">添加员工
        </button>
    </div>
    <table class="simple-table">
        <thead>
        <tr>
            <th>姓名</th>
            <th>部门</th>
            <th>岗位</th>
            <th>年龄</th>
            <th>生日</th>
            <th>手机号码</th>
            <th>入职日期</th>
            <th>工作性质</th>
        </tr>
        </thead>

        <tbody id="tbody">
        <tr>
            <td>西西</td>
            <td>综合办公室</td>
            <td>员工</td>
            <td>22</td>
            <td>9月9日</td>
            <td>18827167321</td>
            <td>2017-12-05</td>
            <td>正式</td>
        </tr>

        <tr>
            <td>楠楠</td>
            <td>综合办公室</td>
            <td>员工</td>
            <td>25</td>
            <td>7月18日</td>
            <td>15682471623</td>
            <td>2017-04-08</td>
            <td>外包</td>
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
</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script>

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    //初始化分页
    $(function () {
        //人员统计数
        var statisticalNum = JSON.parse('${statistical}');


        $("#official").text(statisticalNum[0]);
        $("#outsourcing").text(statisticalNum[1]);

        if (statisticalNum[2] !== undefined) {
            $("#probation").text(statisticalNum[2]);
            $("#totalNumberPeople").text(statisticalNum[0] + statisticalNum[1] + statisticalNum[2]);
        } else {
            $("#probation").text(0);
            $("#totalNumberPeople").text(statisticalNum[0] + statisticalNum[1]);
        }

        //设置当前页
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

    //加载数据
    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/personnel/userBasicInfo',
            data: {'page': page},
            async: false,
            success: function (data) {
                var userInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(userInfos.total);
                // $("#totalNumberPeople").text(userInfos.total);
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
                userInfo += '<tr>';
                userInfo += '<td class="username" onclick="window.event.cancelBubble=true;userDetailsShow(\'' + userInfoList[i].id + '\')"><span>' + userInfoList[i].nickname + '</span></td>';
                if (userInfoList[i].department !== undefined) {
                    userInfo += '<td>' + userInfoList[i].department + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].position !== undefined) {
                    userInfo += '<td class="width-overstep">' + userInfoList[i].position + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].age !== undefined) {
                    userInfo += '<td>' + userInfoList[i].age + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].birthdayStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].birthdayStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].phone !== undefined) {
                    userInfo += '<td>' + userInfoList[i].phone + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (userInfoList[i].entryDateStr !== undefined) {
                    userInfo += '<td>' + userInfoList[i].entryDateStr + '</td>';
                } else {
                    userInfo += '<td></td>';
                }
                userInfo += '<td>' + userInfoList[i].nature + '</td>';
                userInfo += '</tr>';
            }
        }
        $('#tbody').html(userInfo);
    }

    //用户详情信息
    function userDetailsShow(userInfoId) {
        window.top.userDetails(userInfoId);
    }

    //跳转添加员工
    function addPersonnel() {
        window.location.href = '${path}/personnel/toAddPersonnel';
    }
</script>
</html>
