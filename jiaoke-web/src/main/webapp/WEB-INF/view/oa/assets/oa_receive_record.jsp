<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>领用记录</title>
    <link href="../../../../static/css/oa/resource_management.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="cursor_hand">
    <div class="page_head">
        <table>
            <tbody>
            <tr>
                <td>
                    <div class="conditional_query">
                        <!--搜索按钮-->
                        <i class="iconfont search" id="conditional_search" onmousemove="select_color(this)"
                           onmouseout="unselected_color(this)" onclick="searchButton(1,0)">&#xe7e7;</i>
                        <!--标题-->
                        <div id="div2" class="head_right_side_input matter_title">
                            <input type="text" id="titleName" value="">
                        </div>

                        <!--日期选择-->
                        <div id="div3" class="head_right_side_input matter_importance" style="height: 30px;">
                            <input type="text" id="datePicker" name="datePicker" value=""
                                   onfocus="this.blur()" style="width: 200px">
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">文件名称</option>
                                <option value="2">访问日期</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <table class="simple_table">

        <thead>
        <th style="width: 3%;">序号</th>
        <th style="width: 17%;">资产名字</th>
        <th style="width: 10%;">保管人</th>
        <th style="width: 11%;">领用前剩余数量</th>
        <th style="width: 11%;">领用数量</th>
        <th style="width: 11%;">领用后剩余数量</th>
        <th style="width: 12%;">领用人员</th>
        <th style="width: 15%;">备注</th>
        <th style="width: 10%;">领用时间</th>
        </thead>

        <tbody id="tbody">
        <tr>
            <td colspan="9">暂无数据</td>
        </tr>
        </tbody>

    </table>
</div>

<div id="fenye" style="right: 10px;height: 35px;position: absolute;bottom: 10px;">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
            <input type="hidden" id="PageCount" runat="server"/>
            <input type="hidden" id="PageSize" runat="server"/>
            <input type="hidden" id="countindex" runat="server"/>
            <!--设置最多显示的页码数 可以手动设置 默认为10-->
            <input type="hidden" id="visiblePages" runat="server" value="10"/>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/date_pickers/jquery.date_input.pack.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script>
    //搜索
    $("#condition").on("change", function () {
        var opt = $("#condition").val();
        if (opt == 1) {
            $(".matter_title").css("display", "block");
            $(".matter_importance").css("display", "none");
            $(".matter_importance").children('input').val('');
        } else if (opt == 2) {
            $(".matter_importance").css("display", "block");
            $(".matter_title").css("display", "none");
            $(".matter_title").children('input').val('');
        } else {
            $(".head_right_side_input").css("display", "none");
            $(".head_right_side_select").css("display", "none");
        }
    });

    //日期选择器
    $('#datePicker').on('click', function () {
        $('#datePicker').date_input();
    });


    //分页
    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //类型
        } else if (parameter === 2) {
            typeFilter(page);
            loadPage(parameter);

            //搜索
        } else if (parameter === 3 || parameter === 4) {
            searchButton(page);
            loadPage(parameter);
        }

    }

    function loadPage(parameter) {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = Math.ceil(myPageCount / myPageSize);
        $("#countindex").val(countindex);

        $.jqPaginator('#pagination', {
            totalPages: parseInt($("#countindex").val()),
            visiblePages: parseInt($("#visiblePages").val()),
            currentPage: 1,
            first: '<li class="first"><a href="javascript:;">首页</a></li>',
            prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
            next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
            last: '<li class="last"><a href="javascript:;">末页</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (page, type) {
                if (type == "change") {
                    exeData(page, type, parameter);
                }
            }
        });
    }

   /* $(function () {
        loadData(1);
        loadPage(1);
    });*/

    function loadData(page) {
        var assetManagementId = $('#assetManagementId').val();
        $.ajax({
            type: "post",
            url: '/assetsManagement/assetReplenishmentRecord',
            data: {'page': page, 'assetManagementId': assetManagementId},
            async: false,
            success: function (data) {
                var oaAssetReplenishment = JSON.parse(data);
                //总数
                $("#PageCount").val(oaAssetReplenishment.total);
                //每页显示条数
                $("#PageSize").val("15");
                //结果集
                var oaAssetReplenishmentList = oaAssetReplenishment.list;
                //当前页
                var pageNum = oaAssetReplenishment.pageNum;
                //插入tbody
                var assetReplenishment = '';
                if (oaAssetReplenishmentList.length === 0) {
                    assetReplenishment += '<tr>';
                    assetReplenishment += '<td colspan="9">' + '暂无数据' + '</td>';
                    assetReplenishment += '</tr>';
                } else {
                    for (let i = 0; i < oaAssetReplenishmentList.length; i++) {
                        assetReplenishment += '<tr>';
                        assetReplenishment += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].assetsName + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].assetsCustodian + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentBeforeQuantity + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentQuantity + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentPerson + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentStorageLocation + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].replenishmentRemarks + '</td>';
                        assetReplenishment += '<td>' + oaAssetReplenishmentList[i].createTimeStr + '</td>';
                        assetReplenishment += '</tr>';
                    }
                }

                $('#tbody').html(assetReplenishment);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }
</script>
</html>
