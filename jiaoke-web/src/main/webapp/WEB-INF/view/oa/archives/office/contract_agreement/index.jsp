<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>公司发文</title>
    <link href="../../../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="page-head">
    <table>
        <tbody>
        <tr>
            <td>
                <div class="head-left-button">
                    <button type="button" class="cursor_hand" onclick="add()">&#xeb86; 新建</button>
                </div>

                <div class="separation_line"></div>

                <div class="head-left-button">
                    <button type="button" class="cursor_hand" onclick="edit()">&#xe7e9; 编辑</button>
                </div>

                <div class="separation_line"></div>

                <div class="head-left-button">
                    <button type="button" class="cursor_hand" onclick="remove()">&#xeaa5; 删除</button>
                </div>
            </td>

            <td>
                <div>
                    <div class="conditional-query cursor_hand">
                        <input type="text" id="fileName" class="search-bar" placeholder="文件名称" autocomplete="off">
                        <i onclick="searchButton(1,3)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<table class="simpletable">

    <thead>
    <th style="width: 3%;"><input type="checkbox"></th>
    <th style="width: 3%;">序号</th>
    <th style="width: 15%;">合同标号</th>
    <th style="width: 22%;">合同/协议名称</th>
    <th style="width: 12%;">类型</th>
    <th style="width: 12%;">年限</th>
    <th style="width: 13%;">日期</th>
    <th style="width: 20%;">备注</th>
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
            <input type="hidden" id="page"/>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../../../../static/js/oa/layer/layer.js"></script>
<script>

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/contractAgreement/index',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaContractAgreements = JSON.parse(data);
                //总数
                $("#PageCount").val(oaContractAgreements.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaContractAgreements);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //文件类型筛选
    function typeFilter(page) {
        var contractAgreementType = $('#contractAgreementType').val();
        $.ajax({
            type: 'POST',
            url: '/contractAgreement/typeFilter',
            data: {'contractAgreementType': contractAgreementType, 'page': page},
            async: false,
            success: function (result) {
                var oaReleaseDocuments = JSON.parse(result);
                //总数
                $("#PageCount").val(oaReleaseDocuments.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaReleaseDocuments);
                loadPage(2);
            },
            error: function () {
                alert("Connection error");
            }
        })
    }

    //搜索按钮
    function searchButton(page, parameter) {
        var contractAgreementName = $('#fileName').val();
        currentPageNum = page;
        $.ajax({
            type: 'POST',
            url: '/contractAgreement/contractAgreementNameFilter',
            data: {'contractAgreementName': contractAgreementName, 'page': page},
            async: false,
            success: function (result) {
                $('#tbody').empty();
                var oaContractAgreements = JSON.parse(result);
                //总数
                $("#PageCount").val(oaContractAgreements.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaContractAgreements);
                loadPage(parameter);
            },
            error: function () {
                alert("Connection error");
            }
        })
    }

    //解析筛选后的list
    function parseList(oaContractAgreements) {
        //结果集
        var oaContractAgreementList = oaContractAgreements.list;
        //当前页
        var pageNum = oaContractAgreements.pageNum;

        var oaReleaseDocument = '';
        if (oaContractAgreementList.length === 0) {
            oaReleaseDocument += '<tr>';
            oaReleaseDocument += '<td colspan="8">' + '暂无数据' + '</td>';
            oaReleaseDocument += '</tr>';
        } else {
            for (let i = 0; i < oaContractAgreementList.length; i++) {
                oaReleaseDocument += '<tr onclick="particulars(' + oaContractAgreementList[i].id + ')">';
                oaReleaseDocument += '<td><input type="checkbox" value="' + oaContractAgreementList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                oaReleaseDocument += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                oaReleaseDocument += '<td>' + oaContractAgreementList[i].contractLabel + '</td>';
                oaReleaseDocument += '<td>' + oaContractAgreementList[i].contractAgreementName + '</td>';
                oaReleaseDocument += '<td>' + oaContractAgreementList[i].type + '</td>';
                oaReleaseDocument += '<td>' + oaContractAgreementList[i].years + '</td>';
                oaReleaseDocument += '<td>' + oaContractAgreementList[i].dateStr + '</td>';
                oaReleaseDocument += '<td>' + oaContractAgreementList[i].remarks + '</td>';
                oaReleaseDocument += '</tr>';
            }
        }
        $('#tbody').html(oaReleaseDocument);
    }

    //内容列表选中颜色
    $("#tbody").on('click', 'tr', function () {
        if ($(this).hasClass("clickColor")) {
            $(this).removeClass("clickColor");
        } else {
            var trs = $(this).parent().find("tr");
            trs.removeClass("clickColor");
            $(this).addClass("clickColor");
        }
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
        } else if (parameter === 3) {
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
        window.location.href = '${path}/contractAgreement/toNewContractAgreement?prev=' + prev;
    }

    //公司发文详情
    function particulars(id) {
        var prev = $('#page').val();
        window.location.href = "${path}/contractAgreement/toContractAgreementDetails?id=" + id + "&prev=" + prev;
    }

    //修改
    function edit() {
        let length = $("tbody input:checked").length;
        if (length != 1) {
            layer.msg('请选择一条数据！');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            var prev = $('#page').val();
            window.location.href = "${path}/contractAgreement/toEdit?id=" + id + "&prev=" + prev;
        }
    }

    //删除
    function remove() {
        let length = $("tbody input:checked").length;
        if (length !== 1) {
            layer.msg('请选择一条数据！');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            //主页fun
            window.top.deleteArchivesData('/contractAgreement', id, $('#page').val());
        }
    }

    //重载页面
    function reloadArchivesData(page) {
        window.location.href = "${path}/contractAgreement/toContractAgreement?page=" + page;
    }
</script>
</html>
