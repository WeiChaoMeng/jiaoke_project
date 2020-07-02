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
        <button type="button" class="add-personnel" onclick="addPersonnel()">添加员工
        </button>
    </div>
    <table class="simple-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>姓名</th>
            <th>部门</th>
            <th>职务</th>
            <th>生日</th>
            <th>年龄</th>
            <th>手机号码</th>
            <th>入职日期</th>
            <th>用工类型</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody id="tbody">

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
    var itselfFrameId;

    //初始化分页
    $(function () {
        //设置当前页
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //加载数据
    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/personnel/userBasicInfo',
            data: {'page': page},
            async: false,
            success: function (data) {
                var personnelInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(personnelInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(personnelInfos);
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
                var personnelInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(personnelInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(personnelInfos);
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
    function parseResult(personnelInfos) {
        //结果集
        var personnelInfoList = personnelInfos.list;
        //当前页
        var pageNum = personnelInfos.pageNum;
        //插入tbody
        var userInfo = '';
        if (personnelInfoList.length === 0) {
            userInfo += '<tr>';
            userInfo += '<td colspan="10">' + '暂无数据' + '</td>';
            userInfo += '</tr>';
        } else {
            for (let i = 0; i < personnelInfoList.length; i++) {
                userInfo += '<tr>';
                userInfo += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                userInfo += '<td class="username" onclick="window.event.cancelBubble=true;userDetailsShow(\'' + personnelInfoList[i].id + '\')"><span>' + personnelInfoList[i].name + '</span></td>';
                if (personnelInfoList[i].department !== undefined) {
                    userInfo += '<td>' + personnelInfoList[i].department + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (personnelInfoList[i].job !== undefined) {
                    userInfo += '<td>' + personnelInfoList[i].job + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (personnelInfoList[i].birthday !== undefined) {
                    userInfo += '<td>' + personnelInfoList[i].birthday + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (personnelInfoList[i].age !== undefined) {
                    userInfo += '<td>' + personnelInfoList[i].age + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (personnelInfoList[i].phone !== undefined) {
                    userInfo += '<td>' + personnelInfoList[i].phone + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (personnelInfoList[i].joinWorkDate !== undefined) {
                    userInfo += '<td>' + personnelInfoList[i].joinWorkDate + '</td>';
                } else {
                    userInfo += '<td></td>';
                }

                if (personnelInfoList[i].workType === 0) {
                    userInfo += '<td>自有职工</td>';
                } else {
                    userInfo += '<td>外包职工</td>';
                }
                userInfo += '<td>';
                userInfo += '<button type="button" class="basic-info-operation" onclick="del(\'' + personnelInfoList[i].id + '\')">删除</button>';
                userInfo += '<button type="button" class="basic-info-operation" onclick="edit(\'' + personnelInfoList[i].id + '\')">编辑</button>';
                userInfo += '<button type="button" class="basic-info-operation" onclick="particulars(\'' + personnelInfoList[i].id + '\')">详情</button>';
                if(personnelInfoList[i].contractFlag === 0){
                    userInfo += '<button type="button" class="basic-info-operation" onclick="contract(\'' + personnelInfoList[i].id + '\')">添加合同</button>';
                }else {
                    userInfo += '<button type="button" class="basic-info-operation" style="background-color: #b3b4b4;">添加合同</button>';
                }
                userInfo += '</td>';
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

    function del(id) {
        window.top.deletePersonnel(id, $('#page').val(),itselfFrameId);
    }

    //重载页面
    function reloadPersonnelPage(page) {
        window.location.href = "${path}/personnel/toBasic?page=" + page;
    }

    function edit(id) {
        window.location.href = "${path}/personnel/toEdit?id=" + id;
    }

    function particulars(id) {
        window.top.personnelDetails(id);
    }

    //添加合同
    function contract(id) {
        $.ajax({
            type: "post",
            url: '${path}/personnel/appendContract',
            data: {'id': id},
            success: function (data) {
                if (data === "success") {
                    window.location.href = "${path}/personnel/toBasic?page=" + $('#page').val();
                    top.window.tips("添加成功,请到合同管理中查看！", 0, 1, 2000);
                } else {
                    layer.msg("添加失败！");
                }

            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }
</script>
</html>
