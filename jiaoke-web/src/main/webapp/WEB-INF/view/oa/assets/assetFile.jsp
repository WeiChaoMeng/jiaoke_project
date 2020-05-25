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
    <title>资产档案</title>
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
        <a><cite>资产管理</cite></a>
        <a><cite>资产档案</cite></a>
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
                    <button class="layui-btn layui-btn-danger" data-type="getid" onclick="operatingRecord()">
                        <i class="layui-icon">&#xe6b2;</i>操作记录
                    </button>

                    <button class="layui-btn" onclick="addAssets()">
                        <i class="layui-icon">&#xe61f;</i>添加
                    </button>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;margin-left: 10px;">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="searchButton(1,2)">
                            <i class="layui-icon">&#xe615;</i></button>
                    </div>

                    <div class="layui-input-inline layui-show-xs-block" style="float: right;">
                        <input type="text" id="assetName" placeholder="请输入资产名称" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-filter="demo">
                        <thead>
                        <tr>
                            <th style="width: 7%">序号</th>
                            <th style="width: 25%">资产名字</th>
                            <th style="width: 10%">库存数量</th>
                            <th style="width: 12%">录入人员</th>
                            <th style="width: 12%">存放地点</th>
                            <th style="width: 12%">保管人员</th>
                            <th style="width: 8%">状态</th>
                            <th style="width: 14%">操作</th>
                        </thead>

                        <tbody id="tbody">
                        <tr>
                            <td colspan="8" style="text-align: center;">没有查询到匹配记录</td>
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
            url: '/assetsManagement/index',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaAssetsManagements = JSON.parse(data);
                //总数
                $("#PageCount").val(oaAssetsManagements.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(oaAssetsManagements);
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
            }
        })
    }

    //名字搜索
    function searchButton(page, parameter) {
        var assetsName = $('#assetName').val();
        $.ajax({
            type: "post",
            url: '/assetsManagement/assetsNameFilter',
            data: {'page': page, 'assetsName': assetsName},
            async: false,
            success: function (data) {
                var oaAssetsManagements = JSON.parse(data);
                //总数
                $("#PageCount").val(oaAssetsManagements.total);
                //每页显示条数
                $("#PageSize").val("12");
                parseResult(oaAssetsManagements);
                loadPage(parameter);
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
            }
        })
    }

    //分页
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
    function parseResult(oaAssetsManagements) {
        //结果集
        var oaAssetsManagementList = oaAssetsManagements.list;
        //当前页
        var pageNum = oaAssetsManagements.pageNum;
        //插入tbody
        var oaAssetsManagement = '';
        if (oaAssetsManagementList.length === 0) {
            oaAssetsManagement += '<tr>';
            oaAssetsManagement += '<td colspan="8" style="text-align: center">' + '没有查询到匹配记录' + '</td>';
            oaAssetsManagement += '</tr>';
        } else {
            for (let i = 0; i < oaAssetsManagementList.length; i++) {
                oaAssetsManagement += '<tr>';
                oaAssetsManagement += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 12 + i + 1) + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].assetsName + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].productQuantity + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].entryPerson + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].storageLocation + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].custodian + '</td>';
                if (oaAssetsManagementList[i].state == 0) {
                    oaAssetsManagement += '<td><input type="checkbox" lay-skin="switch" value="' + oaAssetsManagementList[i].id + '" lay-filter="switchFilter" checked lay-text="开启|关闭"></td>';
                } else {
                    oaAssetsManagement += '<td><input type="checkbox" lay-skin="switch" value="' + oaAssetsManagementList[i].id + '" lay-filter="switchFilter" lay-text="开启|关闭"></td>';
                }
                oaAssetsManagement +=
                    '<td class="td-manage" style="white-space: nowrap;">\n' +
                    '<button class="layui-btn layui-btn layui-btn-xs" onclick="edit(' + oaAssetsManagementList[i].id + ')"><i class="layui-icon">&#xe642;</i>编辑</button>\n' +
                    // '<button class="layui-btn-danger layui-btn layui-btn-xs" onclick="del(' + oaAssetsManagementList[i].id + ')"><i class="layui-icon">&#xe640;</i>删除</button>\n' +
                    '<button class="layui-btn layui-btn-warm layui-btn-xs" onclick="replenishmentRecord(' + oaAssetsManagementList[i].id + ')"><i class="layui-icon">&#xe60e;</i>补货记录</button>\n' +
                    '</td>';
                oaAssetsManagement += '</tr>';
            }
        }

        $('#tbody').html(oaAssetsManagement);

        renderCheckBox();
    }

    //新增
    function addAssets() {
        window.location.href = "${path}/assetsManagement/toAddAssetsArchives";
    }

    //补货记录
    function replenishmentRecord(assetManagementId) {
        var page = $('#page').val();
        window.location.href = "${path}/assetsManagement/toAssetReplenishmentRecordPage?assetManagementId=" + assetManagementId + '&archivesPage=' + page;
    }

    //操作记录
    function operatingRecord() {
        window.location.href = "${path}/assetsManagement/toAssetOperatingRecordPage";
    }

    //重载页面
    function reloadAssetsArchivs(page) {
        window.location.href = "${path}/assetsManagement/toAssetsArchives?page=" + page;
    }

    //删除（未使用）
    function del(id) {
        window.top.deleteAssetsArchivs(id, $('#page').val(), itselfFrameId);
    }

    //编辑
    function edit(id) {
        $.ajax({
            type: "post",
            url: '/assetsManagement/selectById',
            data: {'id': id},
            async: false,
            success: function (data) {
                //主页fun
                window.top.editAssetsArchivs(JSON.parse(data), itselfFrameId);
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
            }
        });
    }

    //重新渲染checkbox
    function renderCheckBox() {
        layui.use(['form'], function () {
            var form = layui.form;
            form.render('checkbox');
        })
    }

    //状态切换：0-开启。1-关闭
    layui.use(['form'], function () {
        var form = layui.form;
        form.on('switch(switchFilter)', function (data) {
            if (this.checked === true) {
                window.top.modifyAssetsState("确认开启吗？", $(this).val(), 0, $('#page').val(),itselfFrameId);
            } else {
                window.top.modifyAssetsState("确认关闭吗？", $(this).val(), 1, $('#page').val(),itselfFrameId);
            }
        });
    });
</script>
</html>