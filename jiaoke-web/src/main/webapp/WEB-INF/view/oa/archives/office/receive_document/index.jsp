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
    <title>公司收文</title>
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
                        <i onclick="searchButton(1,2)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
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
    <th style="width: 22%;">收文编号</th>
    <th style="width: 10%;">
        <select id="publishingDepartment" onchange="typeFilter(1)"
                style="background: #92ebff;width:100%;height: 100%;outline: none;text-align: center;text-align-last: center">
            <option style="background: #fff;" value="888">发文部室</option>
            <option style="background: #fff;" value="0">安全管理部</option>
            <option style="background: #fff;" value="1">办公室</option>
            <option style="background: #fff;" value="2">财务管理部</option>
            <option style="background: #fff;" value="3">纪检监察部</option>
            <option style="background: #fff;" value="4">企业管理部</option>
            <option style="background: #fff;" value="5">生产经营部</option>
            <option style="background: #fff;" value="6">组织人事部</option>
            <option style="background: #fff;" value="7">建材集团党发</option>
            <option style="background: #fff;" value="8">建材集团工会发</option>
            <option style="background: #fff;" value="9">共青团发</option>
            <option style="background: #fff;" value="10">市政路桥集团发</option>
            <option style="background: #fff;" value="11">其他收文</option>
        </select>
    </th>
    <th style="width: 15%;">标题</th>
    <th style="width: 12%;">来文字号</th>
    <th style="width: 13%;">接收时间</th>
    <th style="width: 20%;">备注</th>

    </thead>

    <tbody id="tbody">

    </tbody>
</table>

<div id="fenye" style="right: 10px;height: 35px;position: absolute;bottom: 10px;">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
            <input type="hidden" id="PageCount" runat="server"/>
            <input type="hidden" id="PageSize" runat="server"/>
            <input type="hidden" id="countindex" runat="server"/>
            <!--设置最多显示的页码数 可以手动设置 默认为7-->
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
                $("#PageSize").val("15");
                parseList(oaReceiveDocuments);
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
            }
        })
    }

    //文件类型筛选
    function typeFilter(page) {
        var publishingDepartment = $('#publishingDepartment').val();
        $.ajax({
            type: 'POST',
            url: '/receiveDocument/docTypeFilter',
            data: {'publishingDepartment': publishingDepartment, 'page': page},
            async: false,
            success: function (result) {
                var oaReceiveDocuments = JSON.parse(result);
                //总数
                $("#PageCount").val(oaReceiveDocuments.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaReceiveDocuments);
                loadPage(2);
            },
            error: function () {
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
                $("#PageSize").val("15");
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
            oaReceiveDocument += '<td colspan="8">' + '暂无数据' + '</td>';
            oaReceiveDocument += '</tr>';
        } else {
            for (let i = 0; i < oaReceiveDocumentList.length; i++) {
                oaReceiveDocument += '<tr onclick="particulars(' + oaReceiveDocumentList[i].id + ')">';
                oaReceiveDocument += '<td><input type="checkbox" value="' + oaReceiveDocumentList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                oaReceiveDocument += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                oaReceiveDocument += '<td>' + oaReceiveDocumentList[i].documentNumber + '</td>';
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
                oaReceiveDocument += '<td>' + oaReceiveDocumentList[i].documentName + '</td>';
                oaReceiveDocument += '<td>' + oaReceiveDocumentList[i].documentReceivedNumber + '</td>';
                oaReceiveDocument += '<td>' + oaReceiveDocumentList[i].receiveDateStr + '</td>';
                oaReceiveDocument += '<td>' + oaReceiveDocumentList[i].remarks + '</td>';

                oaReceiveDocument += '</tr>';
            }
        }
        $('#tbody').html(oaReceiveDocument);
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

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });


    //新建公司收文
    function add() {
        var prev = $('#page').val();
        window.location.href = '${path}/receiveDocument/toNewReceiveDocument?prev=' + prev;
    }

    //公司收文详情
    function particulars(id) {
        var prev = $('#page').val();
        window.location.href = "${path}/receiveDocument/toReceiveDocumentDetails?id=" + id + "&prev=" + prev;
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
            window.location.href = "${path}/receiveDocument/toEdit?id=" + id + "&prev=" + prev;
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
            window.top.deleteArchivesData('/receiveDocument', id, $('#page').val());
        }
    }

    //重载页面
    function reloadArchivesData(page) {
        window.location.href = "${path}/receiveDocument/toReceiveDocument?page=" + page;
    }

</script>
</html>
