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
    <title>公司收文</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../../../../../../static/new/css/font.css">
    <script src="../../../../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../../../../static/new/css/xadmin.css">
    <link rel="stylesheet" href="../../../../../../static/new/css/paging.css">
    <style>
        table {
            table-layout: fixed;
        }

        .text-too-long {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a><cite>主页</cite></a>
        <a><cite>OA系统</cite></a>
        <a><cite>档案管理</cite></a>
        <a><cite>公司收文</cite></a>
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
                <div class="layui-card-body" style="min-height: 30px;">

                    <button class="layui-btn layui-btn-danger" data-type="getid" onclick="delAll()">
                        <i class="layui-icon"></i>批量删除
                    </button>

                    <button class="layui-btn" onclick="add()">
                        <i class="layui-icon"></i>添加
                    </button>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;margin-left: 10px;">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="searchButton(1,2)">
                            <i class="layui-icon">&#xe615;</i></button>
                    </div>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;">
                        <input type="text" id="fileName" placeholder="请输入文件名称" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-filter="demo">
                        <thead>
                        <tr>
                            <th style="width: 4%;">
                                <input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose">
                            </th>
                            <th style="width: 5%">序号</th>
                            <th style="width: 14%">收文编号</th>
                            <th style="width: 11%">发文部室</th>
                            <th style="width: 14%">标题</th>
                            <th style="width: 10%">来文字号</th>
                            <th style="width: 10%">接收时间</th>
                            <th style="width: 14%">备注</th>
                            <th style="width: 18%">操作</th>
                        </thead>

                        <tbody id="tbody">
                        <tr>
                            <td colspan="9" style="text-align: center;">没有查询到匹配记录</td>
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
<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/js/paging/jqPaginator.js"></script>
<script type="text/javascript" src="../../../../../../static/new/js/xadmin.js"></script>
<script>
    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    var itselfFrameId;

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/receiveDocument/index',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaReceiveDocuments = JSON.parse(data);
                //总数
                $("#PageCount").val(oaReceiveDocuments.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseList(oaReceiveDocuments);
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
            }
        })
    }

    //搜索按钮
    function searchButton(page) {
        var documentName = $('#fileName').val();
        currentPageNum = page;

        $.ajax({
            type: 'POST',
            url: '/receiveDocument/documentNameFilter',
            data: {'documentName': documentName, 'page': page},
            async: false,
            success: function (result) {
                $('#tbody').empty();
                var oaReceiveDocuments = JSON.parse(result);
                //总数
                $("#PageCount").val(oaReceiveDocuments.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseList(oaReceiveDocuments);
                loadPage(3);
            },
            error: function () {
                window.top.tips("出错！", 6, 2, 1000);
            }
        })
    }

    //解析筛选后的list
    function parseList(oaReceiveDocuments) {
        //结果集
        var oaReceiveDocumentList = oaReceiveDocuments.list;
        //当前页
        var pageNum = oaReceiveDocuments.pageNum;

        var oaReceiveDocument = '';
        if (oaReceiveDocumentList.length === 0) {
            oaReceiveDocument += '<tr>';
            oaReceiveDocument += '<td colspan="9" style="text-align: center">' + '没有查询到匹配记录' + '</td>';
            oaReceiveDocument += '</tr>';
        } else {
            for (let i = 0; i < oaReceiveDocumentList.length; i++) {
                oaReceiveDocument += '<tr>';
                oaReceiveDocument += '<td><input type="checkbox" name="show" lay-skin="primary" lay-filter="choose" value="' + oaReceiveDocumentList[i].id + '">' +
                    '<div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div></td>';
                oaReceiveDocument += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 12 + i + 1) + '</td>';
                oaReceiveDocument += '<td class="text-too-long">' + oaReceiveDocumentList[i].documentNumber + '</td>';
                if (oaReceiveDocumentList[i].publishingDepartment === 0) {
                    oaReceiveDocument += '<td>' + '安全管理部' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 1) {
                    oaReceiveDocument += '<td>' + '办公室' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 2) {
                    oaReceiveDocument += '<td>' + '财务管理部' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 3) {
                    oaReceiveDocument += '<td>' + '纪检监察部' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 4) {
                    oaReceiveDocument += '<td>' + '企业管理部' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 5) {
                    oaReceiveDocument += '<td>' + '生产经营部' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 6) {
                    oaReceiveDocument += '<td>' + '组织人事部' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 7) {
                    oaReceiveDocument += '<td>' + '建材集团党发' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 8) {
                    oaReceiveDocument += '<td>' + '建材集团工会发' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 9) {
                    oaReceiveDocument += '<td>' + '共青团发' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 10) {
                    oaReceiveDocument += '<td>' + '市政路桥集团发' + '</td>';
                } else if (oaReceiveDocumentList[i].publishingDepartment === 11) {
                    oaReceiveDocument += '<td>' + '其他收文' + '</td>';
                }
                oaReceiveDocument += '<td class="text-too-long">' + oaReceiveDocumentList[i].documentName + '</td>';
                oaReceiveDocument += '<td class="text-too-long">' + oaReceiveDocumentList[i].documentReceivedNumber + '</td>';
                oaReceiveDocument += '<td>' + oaReceiveDocumentList[i].receiveDateStr + '</td>';
                oaReceiveDocument += '<td class="text-too-long">' + oaReceiveDocumentList[i].remarks + '</td>';
                oaReceiveDocument +=
                    '<td class="td-manage" style="white-space: nowrap;">\n' +
                    '<button class="layui-btn layui-btn layui-btn-xs" onclick="edit(' + oaReceiveDocumentList[i].id + ')"><i class="layui-icon">&#xe642;</i>编辑</button>\n' +
                    '<button class="layui-btn-danger layui-btn layui-btn-xs" onclick="remove(' + oaReceiveDocumentList[i].id + ')"><i class="layui-icon">&#xe640;</i>删除</button>\n' +
                    '<button class="layui-btn layui-btn-normal layui-btn-xs" onclick="particulars(' + oaReceiveDocumentList[i].id + ')"><i class="layui-icon">&#xe63c;</i>详情</button>\n' +
                    '</td>';
                oaReceiveDocument += '</tr>';
            }
        }
        $('#tbody').html(oaReceiveDocument);
        renderCheckBox();
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

    //新建公司发文
    function add() {
        var prev = $('#page').val();
        window.location.href = '${path}/receiveDocument/toNewReceiveDocument?prev=' + prev;
    }

    //公司发文详情
    function particulars(id) {
        var prev = $('#page').val();
        window.location.href = "${path}/receiveDocument/toReceiveDocumentDetails?id=" + id + "&prev=" + prev;
    }

    //修改
    function edit(id) {
        var prev = $('#page').val();
        window.location.href = "${path}/receiveDocument/toEdit?id=" + id + "&prev=" + prev;
    }

    //删除
    function remove(id) {
        window.top.deleteArchivesData('/receiveDocument', id, itselfFrameId);
    }

    //重载页面
    function reloadArchivesData(page) {
        window.location.href = "${path}/receiveDocument/toReceiveDocument?page=" + page;
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

        window.top.batchDeleteData("/receiveDocument/batchDelete", ids, itselfFrameId);
    }

    //重载页面（批量删除）
    function batchDeletePageReload(page) {
        window.location.href = "${path}/receiveDocument/toReceiveDocument?page=" + page;
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