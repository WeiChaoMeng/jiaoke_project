<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>部门管理</title>
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
        <a><cite>后台管理</cite></a>
        <a><cite>部门管理</cite></a>
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

                    <button class="layui-btn" onclick="addDepartment()">
                        <i class="layui-icon"></i>添加
                    </button>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;margin-left: 10px;">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="searchButton(1,2)">
                            <i class="layui-icon">&#xe615;</i></button>
                    </div>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;">
                        <input type="text" id="departmentName" placeholder="请输入部门名称" autocomplete="off"
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
                            <th style="width: 20%">部门名称</th>
                            <th style="width: 20%">部门负责人</th>
                            <th style="width: 20%">部门主管领导</th>
                            <th style="width: 30%">操作</th>
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
        $.ajax({
            type: "post",
            url: '/backstageManagement/departmentManager',
            data: {'page': page},
            async: false,
            success: function (data) {
                var departments = JSON.parse(data);
                //总数
                $("#PageCount").val(departments.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(departments);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //名字搜索
    function searchButton(page, parameter) {
        var departmentName = $('#departmentName').val();
        $.ajax({
            type: "post",
            url: '/backstageManagement/departmentFilter',
            data: {'page': page, 'departmentName': departmentName},
            async: false,
            success: function (data) {
                $('#page').val(1);
                var departments = JSON.parse(data);
                //总数
                $("#PageCount").val(departments.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(departments);
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
    function parseResult(departments) {
        //结果集
        var departmentList = departments.list;
        //当前页
        var pageNum = departments.pageNum;
        //插入tbody
        var department = '';
        if (departmentList.length === 0) {
            department += '<tr>';
            department += '<td colspan="6"  style="text-align: center;">' + '没有查询到匹配记录' + '</td>';
            department += '</tr>';
        } else {
            for (let i = 0; i < departmentList.length; i++) {
                department += '<tr>';
                department += '<td><input type="checkbox" name="show" lay-skin="primary" lay-filter="choose" value="' + departmentList[i].id + '">' +
                    '<div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div></td>';
                department += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 12 + i + 1) + '</td>';
                department += '<td>' + departmentList[i].departmentName + '</td>';
                if (typeof(departmentList[i].principal) == "undefined") {
                    department += '<td></td>';
                } else {
                    department += '<td>' + departmentList[i].principal + '</td>';
                }

                if (typeof(departmentList[i].supervisor) == "undefined") {
                    department += '<td></td>';
                } else {
                    department += '<td>' + departmentList[i].supervisor + '</td>';
                }
                department +=
                    '<td class="td-manage" style="white-space: nowrap;">\n' +
                    '<button class="layui-btn layui-btn layui-btn-xs" onclick="editDepartment(' + departmentList[i].id + ')"><i class="layui-icon">&#xe642;</i>编辑</button>\n' +
                    '<button class="layui-btn-danger layui-btn layui-btn-xs" onclick="del(' + departmentList[i].id + ')"><i class="layui-icon">&#xe640;</i>删除</button>\n' +
                    '<button class="layui-btn layui-btn-warm layui-btn-xs" onclick="binding(1,' + departmentList[i].id + ')"><i class="layui-icon">&#xe64c;</i>绑定负责人</button>\n' +
                    '<button class="layui-btn layui-btn-normal layui-btn-xs" onclick="binding(2,' + departmentList[i].id + ')"><i class="layui-icon">&#xe64c;</i>绑定主管领导</button>\n' +
                    '</td>';
                department += '</tr>';
            }
        }
        $('#tbody').html(department);
        renderCheckBox();
    }

    //新增
    function addDepartment() {
        //主页fun
        window.top.addDepartment($('#page').val(), itselfFrameId);
    }

    //重载页面
    function departmentInfoPageReload(page) {
        window.location.href = "${path}/backstageManagement/toDepartmentManager?page=" + page;
    }

    //编辑
    function editDepartment(id) {
        $.ajax({
            type: "post",
            url: '/backstageManagement/toDepartmentEdit',
            data: {'id': id},
            success: function (data) {
                //部门信息
                var department = JSON.parse(data);
                //主页fun
                window.top.editDepartment(department, $('#page').val(), itselfFrameId);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //绑定部门主管
    function binding(target, id) {
        var page = $('#page').val();
        //用户
        var userInfoList = JSON.parse('${userInfoList}');
        //部门
        var departmentList = JSON.parse('${departmentList}');
        window.top.bindingDepartmentHead(userInfoList, departmentList, id, page, target, itselfFrameId);
    }

    //删除用户
    function del(id) {
        window.top.deleteDepartment(id, itselfFrameId);
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

        window.top.batchDeleteData("/backstageManagement/batchDeleteDepartment", ids, itselfFrameId);
    }

    //重载页面（批量删除）
    function batchDeletePageReload(page) {
        window.location.href = "${path}/backstageManagement/toDepartmentManager?page=" + page;
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