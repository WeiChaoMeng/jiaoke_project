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
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link href="../../../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="cursor_hand">
    <div class="page_head">
        <table>
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" id="newContractAgreement" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xeb86; 新建
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" id="replenishment" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xe7e9; 补货
                    </div>

                </td>
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
        <th style="width: 3%;"><input type="checkbox"></th>
        <th style="width: 3%;">序号</th>
        <th style="width: 17%;">资产名字</th>
        <th style="width: 10%;">
            <select id="asset" onchange="typeFilter(1)">
                <option style="background: #fff;" value="888">资产类别</option>
                <option style="background: #fff;" value="0">办公用品</option>
                <option style="background: #fff;" value="1">生产设备</option>
            </select>
        </th>
        <th style="width: 17%;">规格型号</th>
        <th style="width: 10%;">购买数量</th>
        <th style="width: 10%;">
            <select id="source" onchange="typeFilter(1)">
                <option style="background: #fff;" value="888">来源</option>
                <option style="background: #fff;" value="0">行政购置</option>
                <option style="background: #fff;" value="1">设备购置</option>
            </select>
        </th>
        <th style="width: 10%;">录入人员</th>
        <th style="width: 10%;">存放地点</th>
        <th style="width: 10%;">保管人员</th>
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

    //功能选中颜色
    function select_color(itself) {
        itself.style.background = "#fff";
    }

    //功能未选中颜色
    function unselected_color(itself) {
        itself.style.background = "#f1f1f1";
    }

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

    $(function () {
        loadData(1);
        loadPage(1);
    });

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
                        oaAssetsManagement += '<tr onclick="particulars(' + oaAssetsManagementList[i].id + ')">';
                        oaAssetsManagement += '<td><input type="checkbox" value="' + oaAssetsManagementList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        oaAssetsManagement += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                        oaAssetsManagement += '<td>' + oaAssetsManagementList[i].assetsName + '</td>';
                        if (oaAssetsManagementList[i].assetsCategory === 0) {
                            oaAssetsManagement += '<td>' + '办公用品' + '</td>';
                        }else if(oaAssetsManagementList[i].assetsCategory === 1){
                            oaAssetsManagement += '<td>' + '生产设备' + '</td>';
                        }
                        oaAssetsManagement += '<td>' + oaAssetsManagementList[i].productSpecification + '</td>';
                        oaAssetsManagement += '<td>' + oaAssetsManagementList[i].productQuantity + '</td>';
                        if (oaAssetsManagementList[i].productSource === 0){
                            oaAssetsManagement += '<td>' + '行政购置' + '</td>';
                        }else if (oaAssetsManagementList[i].productSource === 1){
                            oaAssetsManagement += '<td>' + '设备购置' + '</td>';
                        }
                        oaAssetsManagement += '<td>' + oaAssetsManagementList[i].entryPerson + '</td>';
                        oaAssetsManagement += '<td>' + oaAssetsManagementList[i].storageLocation + '</td>';
                        oaAssetsManagement += '<td>' + oaAssetsManagementList[i].custodian + '</td>';
                        oaAssetsManagement += '</tr>';
                    }
                }

                $('#tbody').html(oaAssetsManagement);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //新增
    $('#newContractAgreement').on('click',function () {
        window.location.href = '${path}/assetsManagement/toAssetsManagement';
    })

    //补货
    $('#replenishment').on('click',function () {
        let length = $("tbody input:checked").length;
        if (length != 1) {
            alert("一次只能选择一条数据");
            return false;
        } else {
            var id = $("tbody input:checked").val();
            window.location.href = "${path}/assetsManagement/toAssetReplenishmentPage?id=" + id;
        }
    });

</script>
</html>
