<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>资产档案</title>
    <link href="../../../../static/css/oa/resource_management.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="page_head">
    <table>
        <tbody>
        <tr>
            <td>
                <div class="head_left_button" style="width: 100px">
                    <button type="button" class="cursor_hand" onclick="replenishmentRecord()">&#xe7e9; 补货记录</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="addAssets()">&#xeb86; 添加</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="edit()">&#xe7e9; 编辑</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="del()">&#xeaa5; 删除</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="switchState()">&#xea67; 关闭</button>
                </div>

                <div class="separation_line"></div>

                <div class="head_left_button">
                    <button type="button" class="cursor_hand" onclick="operatingRecord()">&#xe8db; 操作记录</button>
                </div>
            </td>

            <td>
                <div>
                    <div class="conditional-query cursor_hand">
                        <input type="text" id="assetName" class="search-bar" placeholder="资产名称" autocomplete="off">
                        <i onclick="searchButton(1,2)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<table class="simple_table">

    <thead>
    <tr>
        <th style="width: 3%;"><input type="checkbox"></th>
        <th style="width: 3%;">序号</th>
        <th style="width: 42%;">资产名字</th>
        <th style="width: 13%;">库存数量</th>
        <th style="width: 13%;">录入人员</th>
        <th style="width: 13%;">存放地点</th>
        <th style="width: 13%;">保管人员</th>
    </tr>
    </thead>

    <tbody id="tbody"></tbody>

</table>

<div id="fenye" style="right: 10px;height: 35px;position: absolute;bottom: 10px;">
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
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //设置当前页
    var currentPage = '${currentPage}';
    var currentPageNum = JSON.parse(currentPage);

    //分页
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
            url: '/assetsManagement/index',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaAssetsManagements = JSON.parse(data);
                //总数
                $("#PageCount").val(oaAssetsManagements.total);
                //每页显示条数
                $("#PageSize").val("15");
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
                $("#PageSize").val("15");
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
            oaAssetsManagement += '<td colspan="7">' + '暂无数据' + '</td>';
            oaAssetsManagement += '</tr>';
        } else {
            for (let i = 0; i < oaAssetsManagementList.length; i++) {
                oaAssetsManagement += '<tr onclick="checkboxEvent(this)">';
                oaAssetsManagement += '<td><input type="checkbox" value="' + oaAssetsManagementList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                oaAssetsManagement += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                oaAssetsManagement += '<td style="text-align: left;text-indent: 10px;">' + oaAssetsManagementList[i].assetsName + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].productQuantity + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].entryPerson + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].storageLocation + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].custodian + '</td>';
                oaAssetsManagement += '</tr>';
            }
        }

        $('#tbody').html(oaAssetsManagement);
    }

    function addAssets() {
        window.location.href = "${path}/assetsManagement/toAddAssetsArchives";
    }

    //补货记录
    function replenishmentRecord() {
        let length = $("tbody input:checked").length;
        if (length != 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var page = $('#page').val();
            var assetManagementId = $("tbody input:checked").val();
            window.location.href = "${path}/assetsManagement/toAssetReplenishmentRecordPage?assetManagementId=" + assetManagementId + '&archivesPage=' + page;
        }
    }

    //操作记录
    function operatingRecord() {
        window.location.href = "${path}/assetsManagement/toAssetOperatingRecordPage";
    }

    //删除
    function del() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var val = $("#tbody input:checked").val();
            //主页fun
            window.top.deleteAssetsArchivs(val, $('#page').val());
        }
    }

    //切换状态
    function switchState() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var id = $("#tbody input:checked").val();

            $.ajax({
                type: "post",
                url: '/assetsManagement/updateState',
                data: {'id': id, 'state': 1},
                success: function (data) {
                    if (data === 'success') {
                        window.top.tips("处理成功！", 0, 1, 1000);
                        window.location.href = "${path}/assetsManagement/toAssetsArchives?page=1";
                    } else {
                        window.top.tips("处理失败！", 0, 1, 1000);
                    }
                },
                error: function (result) {
                    window.top.tips("出错！", 6, 2, 1000);
                }
            });
        }
    }

    //编辑
    function edit() {
        let length = $("#tbody input:checked").length;
        if (length !== 1) {
            layer.msg("请选择一条数据！");
            return false;
        } else {
            var id = $("#tbody input:checked").val();

            $.ajax({
                type: "post",
                url: '/assetsManagement/selectById',
                data: {'id': id},
                async: false,
                success: function (data) {
                    //主页fun
                    window.top.editAssetsArchivs(JSON.parse(data));
                },
                error: function (result) {
                    window.top.tips("出错！", 6, 2, 1000);
                }
            });
        }
    }

    //重载页面
    function reloadAssetsArchivs(page) {
        window.location.href = "${path}/assetsManagement/toAssetsArchives?page=" + page;
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
