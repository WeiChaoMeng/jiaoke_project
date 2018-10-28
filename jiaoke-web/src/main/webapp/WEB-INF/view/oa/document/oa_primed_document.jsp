<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>待发公文</title>
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

<div class="">
    <input type="hidden" id="total" value="${total}">
    <div class="revoke_mmeeting_head" style="height: 30px;width: 100%;background: #f1f1f1">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe990; 发送
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe7e9; 编辑
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe8e5; 转发
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xeaa5; 删除
                    </div>
                </td>
                <td>
                    <div class="conditional_query">
                        <!--搜索按钮-->
                        <i class="iconfont search" id="conditional_search" onmousemove="select_color(this)"
                           onmouseout="unselected_color(this)">&#xe7e7;</i>
                        <!--标题-->
                        <div id="div2" class="head_right_side_input matter_title">
                            <input type="text">
                        </div>

                        <!--重要程度-->
                        <div id="div3" class="head_right_side_select matter_importance">
                            <select>
                                <option value="1">普通</option>
                                <option value="2">重要</option>
                                <option value="3">非常重要</option>
                            </select>
                        </div>

                        <!--状态-->
                        <div id="div4" class="head_right_side_select matter_status">
                            <select>
                                <option value="1">撤销</option>
                                <option value="2">草稿</option>
                                <option value="3">被回退</option>
                            </select>
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">标题</option>
                                <option value="2">重要程度</option>
                                <option value="3">状态</option>
                            </select>
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
        <th style="width: 6%">密级</th>
        <th style="width: 43%">标题</th>
        <th style="width: 15%">公文文号</th>
        <th style="width: 15%">创建时间</th>
        <th style="width: 6%">重要程度</th>
        <th style="width: 6%">处理期限</th>
        <th style="width: 6%">流程日志</th>
        </thead>

        <tbody class="tbodys">

        </tbody>

    </table>

</div>

<div id="fenye" style="right: 10px;height: 35px;position: absolute;bottom: 10px;">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script>

    //获取总数
    let total = $("#total").val();

    //分页
    $.jqPaginator('#pagination', {
        totalPages: Math.ceil(total / 10), //(10 + 5 -1) / 5,// 总页数 = （当前页 + 每页大小 - 1） / 每页大小
        visiblePages: 10,
        currentPage: 1,
        prev: '<li class="prev"><a href="javascript:;">前一页</a></li>',
        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: function (page) {
            let rows = 10;

            $.ajax({
                type: "post",
                // url: '/document/pagingList',
                url: 'http://47.105.114.70/document/pagingList',
                data: {"formState": 1, "page": page, "rows": rows},
                success: function (data) {
                    if (data == "error") {
                        alert("没有数据")
                    } else {
                        var pagingHtml = "";
                        for (let i = 0; i < data.length; i++) {
                            pagingHtml += '<tr onclick="particulars('+data[i].id+')">';
                            pagingHtml += '<td class="tdnum">';
                            pagingHtml += '<input type="checkbox" onclick="window.event.cancelBubble=true;">';
                            pagingHtml += '</td>';
                            pagingHtml += '<td>';
                            if (data[i].rank === 1) {
                                pagingHtml += '普通公文';
                            } else if (data[i].rank === 2) {
                                pagingHtml += '秘密公文';
                            } else if (data[i].rank === 3) {
                                pagingHtml += '机密公文';
                            } else if (data[i].rank === 4) {
                                pagingHtml += '绝密公文';
                            }
                            pagingHtml += '</td>';
                            pagingHtml += '<td class="text_style" title="' + data[i].formTitle + '"> '+data[i].formTitle+' </td>';
                            pagingHtml += '<td>'+data[i].textNumber+'</td>';
                            pagingHtml += '<td>'+data[i].createTimeStr+'</td>';
                            pagingHtml += '<td>';
                            if (data[i].importance === 0) {
                                pagingHtml += '普通';
                            } else if (data[i].importance === 1) {
                                pagingHtml += '重要';
                            } else if (data[i].importance === 2) {
                                pagingHtml += '非常重要';
                            }
                            pagingHtml += '</td>';
                            pagingHtml += '<td>';
                            if (data[i].processDeadline === "0") {
                                pagingHtml += '无';
                            } else if (data[i].processDeadline === "60") {
                                pagingHtml += '1小时';
                            } else if (data[i].processDeadline === "120") {
                                pagingHtml += '2小时';
                            } else if (data[i].processDeadline === "240") {
                                pagingHtml += '4小时';
                            } else if (data[i].processDeadline === "1440") {
                                pagingHtml += '1天';
                            } else if (data[i].processDeadline === "2880") {
                                pagingHtml += '2天';
                            } else if (data[i].processDeadline === "4320") {
                                pagingHtml += '3天';
                            } else if (data[i].processDeadline === "7200") {
                                pagingHtml += '5天';
                            } else if (data[i].processDeadline === "10080") {
                                pagingHtml += '1周';
                            } else if (data[i].processDeadline === "21600") {
                                pagingHtml += '15天';
                            } else if (data[i].processDeadline === "43200") {
                                pagingHtml += '1个月';
                            } else if (data[i].processDeadline === "129600") {
                                pagingHtml += '3个月';
                            }
                            pagingHtml += '</td>';
                            pagingHtml += '<td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>';
                            pagingHtml += '</tr>';
                        }
                        $(".tbodys").html(pagingHtml);
                    }
                },
                error: function (msg) {
                    alert("出错了！");
                }
            });

        }
    });

    //查看详情
    function particulars(id) {
        // window.location.href = "documentDetails?id=" + id;
        window.location.href = "http://47.105.114.70/document/documentDetails?id=" + id;
    }
</script>
</html>
