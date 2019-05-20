<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="utf-8">
    <title>已发公文</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    .text_style {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .tbodys tr:hover {
        background-color: #d8d8d8;
    }
</style>
<body style="padding:15px 8px 0px 8px;">

<div>
    <div class="page_head">
        <table style="width:100%;height: 30px;">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button">
                        <button type="button" class="cursor_hand">&#xe8e5; 转发</button>
                    </div>

                    <div class="separation_line"></div>

                    <div class="head_left_button">
                        <button type="button" class="cursor_hand">&#xe90f; 取回</button>
                    </div>
                </td>

                <td>
                    <div>
                        <div class="conditional-query cursor_hand">
                            <input type="text" id="textTitle" class="search-bar" placeholder="标题" autocomplete="off">
                            <i onclick="searchButton(1,2)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="simpletable simpletable_color" style="table-layout: fixed">

        <thead>
        <th style="width: 3%"><input type="checkbox"></th>
        <th style="width: 8%">密级</th>
        <th style="width: 35%">标题</th>
        <th style="width: 15%">公文文号</th>
        <th style="width: 15%">发起时间</th>
        <th style="width: 8%">发布人</th>
        <th style="width: 8%">公文类型</th>
        <th style="width: 8%">处理期限</th>
        </thead>

        <tbody id="tbodys">

        </tbody>

    </table>

</div>

<div id="paging" class="paging-div">
    <div>
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
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //设置当前页
    var currentPage = '${page}';
    var currentPageNum = JSON.parse(currentPage);

    //初始化分页
    $(function () {
        //设置当前页
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

    //加载数据
    function loadData(page) {
        //已发
        var formState = 0;
        $.ajax({
            type: "post",
            url: '/document/issuedDocument',
            data: {'page': page, 'formState': formState},
            async: false,
            success: function (data) {
                var lists = JSON.parse(data);
                //总数
                $("#PageCount").val(lists.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(lists);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //标题搜索
    function searchButton(page, parameter) {
        var textTitle = $('#textTitle').val();
        var formState = 0;
        $.ajax({
            type: "post",
            url: '/document/textTitleFilter',
            data: {'page': page, 'textTitle': textTitle, 'formState': formState},
            async: false,
            success: function (data) {
                var lists = JSON.parse(data);
                $('#currentPage').val(1);
                //总数
                $("#PageCount").val(lists.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(lists);
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
    function parseResult(lists) {
        //结果集
        var objList = lists.list;
        //插入tbody
        var resultList = '';
        if (objList.length === 0) {
            resultList += '<tr>';
            resultList += '<td colspan="8">' + '暂无数据' + '</td>';
            resultList += '</tr>';
        } else {
            for (let i = 0; i < objList.length; i++) {
                resultList += '<tr onclick="particulars(' + objList[i].id + ')">';
                resultList += '<td><input type="checkbox" value="' + objList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                resultList += '<td>';
                if (objList[i].rank === 1) {
                    resultList += '普通公文';
                } else if (objList[i].rank === 2) {
                    resultList += '秘密公文';
                } else if (objList[i].rank === 3) {
                    resultList += '机密公文';
                } else if (objList[i].rank === 4) {
                    resultList += '绝密公文';
                }
                resultList += '</td>';
                resultList += '<td class="text_style" title="' + objList[i].textTitle + '"> ' + objList[i].textTitle + ' </td>';
                resultList += '<td>' + objList[i].textNumber + '</td>';
                resultList += '<td>' + objList[i].createTimeStr + '</td>';

                resultList += '<td>';
                if (objList[i].userInfoId != null && objList[i].userInfoId != "") {
                    resultList += objList[i].userInfoId;
                } else {
                    resultList += '无';
                }
                resultList += '</td>';
                resultList += '<td>';
                if (objList[i].docType === 0) {
                    resultList += '公文';
                } else if (objList[i].docType === 1) {
                    resultList += '会议纪要';
                } else if (objList[i].docType === 2) {
                    resultList += '请示';
                } else if (objList[i].docType === 3) {
                    resultList += '通知';
                } else if (objList[i].docType === 4) {
                    resultList += '通告';
                } else if (objList[i].docType === 5) {
                    resultList += '函';
                }
                resultList += '</td>';
                resultList += '<td>';
                if (objList[i].processDeadline === "0") {
                    resultList += '无';
                } else if (objList[i].processDeadline === "60") {
                    resultList += '1小时';
                } else if (objList[i].processDeadline === "120") {
                    resultList += '2小时';
                } else if (objList[i].processDeadline === "240") {
                    resultList += '4小时';
                } else if (objList[i].processDeadline === "1440") {
                    resultList += '1天';
                } else if (objList[i].processDeadline === "2880") {
                    resultList += '2天';
                } else if (objList[i].processDeadline === "4320") {
                    resultList += '3天';
                } else if (objList[i].processDeadline === "7200") {
                    resultList += '5天';
                } else if (objList[i].processDeadline === "10080") {
                    resultList += '1周';
                } else if (objList[i].processDeadline === "21600") {
                    resultList += '15天';
                } else if (objList[i].processDeadline === "43200") {
                    resultList += '1个月';
                } else if (objList[i].processDeadline === "129600") {
                    resultList += '3个月';
                }
                resultList += '</td>';
                resultList += '</tr>';
            }
        }
        $('#tbodys').html(resultList);
    }

    //查看详情
    function particulars(id) {
        var page = $('#page').val();
        window.location.href = "${path}/document/completeDetails?id=" + id + "&page=" + page;
    }
</script>
</html>
