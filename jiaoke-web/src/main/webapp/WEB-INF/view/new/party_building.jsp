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
    <title>组织架构</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../../../static/new/css/font.css">
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
    <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../../../static/new/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/party_building/font-awesome.min.css" >
    <link rel="stylesheet" href="../../../static/css/party_building/style2.css" >
    <link rel="stylesheet" href="../../../static/css/party_building/jquery.orgchart.css" >
<%--<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link id="layuicss-layer" rel="stylesheet" href="http://x.xuebingsi.com/x-admin/v2.2/lib/layui/css/modules/layer/default/layer.css?v=3.1.1" media="all">--%>
    <%--<link id="layuicss-laydate" rel="stylesheet" href="http://x.xuebingsi.com/x-admin/v2.2/lib/layui/css/modules/laydate/default/laydate.css?v=5.0.9" media="all">--%>
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <%--<a href="/default.do" onclick="inv()">首页</a>--%>
                <a><cite>主页</cite></a>
                <a><cite>党建工作</cite></a>
                <a><cite>组织架构</cite></a>
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
                    <div id="chart-container"></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
<script type="text/javascript" src="../../../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../../../static/js/party_building/jquery.orgchart.js"></script>
<script type="text/javascript" src="../../../static/js/party_building/scripts.js"></script>
<script type="text/javascript" src="../../../static/js/party_building/party_member.js"></script>
<script>
    //设置当前页
    var currentPage = '${currentPage}';
    var currentPageNum = JSON.parse(currentPage);

    //初始化分页
    // window.onload = function(){
    //     //设置当前页
    //     $('#page').val(currentPageNum);
    //     loadData(currentPageNum);
    //     loadPage(1);
    // }

    $(function () {
    $('#page').val(currentPageNum);
    loadData(currentPageNum);
    loadPage(1);
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
                $("#PageSize").val("15");
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
                $("#PageSize").val("15");
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
            department += '<td colspan="5">' + '没有查询到匹配记录' + '</td>';
            department += '</tr>';
        } else {
            for (let i = 0; i < departmentList.length; i++) {
                department += '<tr onclick="checkboxEvent(this)">';
                // department += '<td><input type="checkbox" value="' + departmentList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                department += '<td><input type="checkbox" name="show" lay-skin="primary" lay-filter="choose">' +
                    '<div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div></td>';
                department += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
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
                    '<td class="td-manage">\n' +
                    '<button class="layui-btn layui-btn layui-btn-xs" onclick="xadmin.open(\'编辑\',\'admin-edit.html\')"><i class="layui-icon">&#xe642;</i>编辑</button>\n' +
                    '<button class="layui-btn-danger layui-btn layui-btn-xs" onclick="member_del(this,\'要删除的id\')" href="javascript:;"><i class="layui-icon">&#xe640;</i>删除</button>\n' +
                    '<button class="layui-btn layui-btn-warm layui-btn-xs" onclick="xadmin.open(\'编辑\',\'admin-edit.html\')"><i class="layui-icon">&#xe64c;</i>绑定负责人</button>\n' +
                    '<button class="layui-btn layui-btn-warm layui-btn-xs" onclick="xadmin.open(\'编辑\',\'admin-edit.html\')"><i class="layui-icon">&#xe64c;</i>绑定主管领导</button>\n' +
                    '</td>';
                department += '</tr>';
            }
        }
        $('#tbody').html(department);
    }

    //新增
    function addDepartment() {
        //主页fun
        window.top.addDepartment($('#page').val());
    }

    //重载页面
    function departmentInfoPageReload(page) {
        window.location.href = "${path}/backstageManagement/toDepartmentManager?page=" + page;
    }

    //编辑
    function editDepartment() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var id = $("#tbody input:checked").val();
            $.ajax({
                type: "post",
                url: '/backstageManagement/toDepartmentEdit',
                data: {'id': id},
                success: function (data) {
                    //部门信息
                    var department = JSON.parse(data);
                    //主页fun
                    window.top.editDepartment(department, $('#page').val());
                },
                error: function (result) {
                    alert("出错！");
                }
            })
        }
    }

    //绑定部门主管
    function binding(target) {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var page = $('#page').val();
            var id = $("#tbody input:checked").val();
            //用户
            var userInfoList = JSON.parse('${userInfoList}');
            //部门
            var departmentList = JSON.parse('${departmentList}');
            window.top.bindingDepartmentHead(userInfoList, departmentList, id, page, target);
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
            window.top.deleteDepartment(id, $('#page').val());
        }
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
<script>
    layui.use('table', function () {
            var table = layui.table;

            //监听单元格编辑
            table.on('edit(test)',
                function (obj) {
                    var value = obj.value //得到修改后的值
                        ,
                        data = obj.data //得到所在行所有键值
                        ,
                        field = obj.field; //得到字段
                    layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
                });

            //头工具栏事件
            table.on('toolbar(test)',
                function (obj) {
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch (obj.event) {
                        case 'getCheckData':
                            var data = checkStatus.data;
                            layer.alert(JSON.stringify(data));
                            break;
                        case 'getCheckLength':
                            var data = checkStatus.data;
                            layer.msg('选中了：' + data.length + ' 个');
                            break;
                        case 'isAll':
                            layer.msg(checkStatus.isAll ? '全选' : '未全选');
                            break;
                    }
                    ;
                });
        });
</script>
<script>
    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？' + ids.toString(), function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
<script>
    layui.use(['laydate', 'form'],
        function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });
        });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？',
            function (index) {

                if ($(obj).attr('title') == '启用') {

                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用');
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });

                } else {
                    $(obj).attr('title', '启用');
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', {
                        icon: 5,
                        time: 1000
                    });
                }

            });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？',
            function (index) {
                //发异步删除数据
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });
            });
    }

    function delAll(argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？' + data,
            function (index) {
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
    }
</script>
<script>
    //不选择开关 筛选器  :not([name="show"]) ，如果你没有就去掉这个筛选器
    //全选
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        // 监听全选
        form.on('checkbox(allChoose)', function (data) {
            console.log(data.elem);
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

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });
</script>

</html>