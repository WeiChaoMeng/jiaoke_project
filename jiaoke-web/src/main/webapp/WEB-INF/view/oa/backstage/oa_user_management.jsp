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
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <link href="../../../../static/css/oa/backstage_user.css" rel="stylesheet" type="text/css">
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
                    <button type="button" class="cursor_hand" onclick="addUser()">&#xeb86; 添加</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="editUser()">&#xe7e9; 编辑</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="del()">&#xeaa5; 删除</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="binding()">&#xeb14; 绑定角色</button>
                </div>
            </td>
            <td>
                <div>
                    <div class="conditional-query cursor_hand">
                        <input type="text" id="logonName" class="search-bar" placeholder="登录名" autocomplete="off">
                        <i onclick="searchButton(1,2)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
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
    <th style="width: 19%;">姓名</th>
    <th style="width: 19%;">登录名</th>
    <th style="width: 19%;">密码</th>
    <th style="width: 20%;">部门</th>
    <th style="width: 17%;">岗位</th>
    </thead>

    <tbody id="tbody">
    <tr>
        <td><input type="checkbox"></td>
        <td>1</td>
        <td>管理员</td>
        <td>admin</td>
        <td>admin</td>
        <td>其他</td>
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

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/backstage_user.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //设置当前页
    var currentPage = '${currentPage}';
    var currentPageNum = JSON.parse(currentPage);

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
            url: '/backstageManagement/userManager',
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

    //名字搜索
    function searchButton(page, parameter) {
        var username = $('#logonName').val();
        $.ajax({
            type: "post",
            url: '/backstageManagement/usernameFilter',
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
            userInfo += '<td colspan="5">' + '暂无数据' + '</td>';
            userInfo += '</tr>';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                userInfo += '<tr onclick="checkboxEvent(this)">';
                userInfo += '<td><input type="checkbox" value="' + userInfoList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                userInfo += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                userInfo += '<td>' + userInfoList[i].nickname + '</td>';
                userInfo += '<td>' + userInfoList[i].username + '</td>';
                userInfo += '<td>' + userInfoList[i].password + '</td>';
                userInfo += '<td>' + userInfoList[i].department + '</td>';
                userInfo += '<td>' + userInfoList[i].position + '</td>';
                userInfo += '</tr>';
            }
        }
        $('#tbody').html(userInfo);
    }

    //新增用户
    function addUser() {
        //部门列表信息
        var departmentAllList = '${departmentList}';
        var department = JSON.parse(departmentAllList);
        //主页fun
        window.top.addUser(department, $('#page').val());
    }

    //编辑用户
    function editUser() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var id = $("#tbody input:checked").val();
            $.ajax({
                type: "post",
                url: '/backstageManagement/toEdit',
                data: {'id': id},
                success: function (data) {
                    //部门list
                    var departmentAllList = '${departmentList}';
                    var department = JSON.parse(departmentAllList);

                    //用户信息
                    var userInfo = JSON.parse(data);
                    //主页fun
                    window.top.editUser(userInfo, department, $('#page').val());
                },
                error: function (result) {
                    alert("出错！");
                }
            })
        }
    }

    //绑定角色
    function binding() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var id = $("#tbody input:checked").val();
            $.ajax({
                type: "post",
                url: '/backstageManagement/toBinding',
                data: {'id': id},
                success: function (data) {
                    //角色信息
                    var roleInfo = JSON.parse(data);
                    //主页fun
                    window.top.bindingRole(roleInfo, id, $('#page').val());
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    }

    //删除用户
    function del() {
        let length = $("tbody input:checked").length;
        if (length !== 1) {
            layer.msg('请选择一条数据！');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            //主页fun
            window.top.deleteUser(id, $('#page').val());
        }
    }

    //重载页面
    function reloadPage(page) {
        window.location.href = "${path}/backstageManagement/toUserManager?page=" + page;
    }

    //checkbox选中事件
    function checkboxEvent(own) {
        var checkbox = $(own).children('td').children('input').prop('checked');
        if (checkbox) {
            $(own).children('td').children('input').attr("checked", false);
        } else {
            $(own).children('td').children('input').attr("checked", true);
        }
    }
</script>
</html>