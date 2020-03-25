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
        <th style="width: 17%;">资产名字</th>
        <th style="width: 10%;">资产类别</th>
        <th style="width: 17%;">规格型号</th>
        <th style="width: 10%;">库存数量</th>
        <th style="width: 10%;">来源</th>
        <th style="width: 10%;">录入人员</th>
        <th style="width: 10%;">存放地点</th>
        <th style="width: 10%;">保管人员</th>
    </tr>
    </thead>

    <tbody id="tbody">
    <tr>
        <td><input type="checkbox"></td>
        <td>1</td>
        <td>得力打印纸</td>
        <td>办公用品</td>
        <td>A4</td>
        <td>1</td>
        <td>行政购置</td>
        <td>张三</td>
        <td>办公室</td>
        <td>李四</td>
    </tr>
    </tbody>

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
                layer.msg("出错！");
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
                layer.msg("出错！");
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
            oaAssetsManagement += '<td colspan="10">' + '暂无数据' + '</td>';
            oaAssetsManagement += '</tr>';
        } else {
            for (let i = 0; i < oaAssetsManagementList.length; i++) {
                oaAssetsManagement += '<tr onclick="checkboxEvent(this)">';
                oaAssetsManagement += '<td><input type="checkbox" value="' + oaAssetsManagementList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                oaAssetsManagement += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                oaAssetsManagement += '<td style="text-align: left;text-indent: 10px;">' + oaAssetsManagementList[i].assetsName + '</td>';
                if (oaAssetsManagementList[i].assetsCategory === 0) {
                    oaAssetsManagement += '<td>' + '办公用品' + '</td>';
                } else if (oaAssetsManagementList[i].assetsCategory === 1) {
                    oaAssetsManagement += '<td>' + '生产设备' + '</td>';
                }
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].productSpecification + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].productQuantity + '</td>';
                if (oaAssetsManagementList[i].productSource === 0) {
                    oaAssetsManagement += '<td>' + '行政购置' + '</td>';
                } else if (oaAssetsManagementList[i].productSource === 1) {
                    oaAssetsManagement += '<td>' + '设备购置' + '</td>';
                }
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].entryPerson + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].storageLocation + '</td>';
                oaAssetsManagement += '<td>' + oaAssetsManagementList[i].custodian + '</td>';
                oaAssetsManagement += '</tr>';
            }
        }

        $('#tbody').html(oaAssetsManagement);
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
