<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>已办公文</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
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

    <div class="page_head">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe8e5; 转发
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe990; 归档
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xeaa5; 删除
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe90f; 取回
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
                                <option value="1">未结束</option>
                                <option value="2">已结束</option>
                                <option value="3">已终止</option>
                            </select>
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition1">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">标题</option>
                                <option value="2">重要程度</option>
                                <option value="3">流程状态</option>
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
        <th style="width: 36%">标题</th>
        <th style="width: 12%">公文文号</th>
        <th style="width: 6%">发起人</th>
        <th style="width: 12%">发起时间</th>
        <th style="width: 12%">处理时间</th>
        <th style="width: 6%">跟踪状态</th>
        <th style="width: 6%">流程日志</th>
        </thead>

        <tbody class="tbodys">

        <tr></tr>

        <c:forEach var="oaDocument" items="${oaDocumentList}" varStatus="status">
            <tr onclick="particulars(${oaDocument.id})">
                <td class="tdnum">
                    <input type="checkbox" onclick="window.event.cancelBubble=true;">
                </td>
                <td>
                    <c:if test="${oaDocument.rank == 1}">普通公文</c:if>
                    <c:if test="${oaDocument.rank == 2}">秘密公文</c:if>
                    <c:if test="${oaDocument.rank == 3}">机密公文</c:if>
                    <c:if test="${oaDocument.rank == 4}">绝密公文</c:if>
                </td>
                <td class="text_style"
                    title="${oaDocument.formTitle}">${oaDocument.formTitle}
                </td>
                <td>${oaDocument.textNumber}</td>
                <td>${oaDocument.userInfoId}</td>
                <td>${oaDocument.createTimeStr}</td>
                <td>${oaDocument.createTimeStr}</td>
                <td>
                    <c:if test="${oaDocument.track == 0}">无</c:if>
                    <c:if test="${oaDocument.track == 1}">全部</c:if>
                    <c:if test="${oaDocument.track == 2}">指定</c:if>
                </td>
                <td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>
            </tr>
        </c:forEach>

        </tbody>

    </table>

</div>


</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script>
    //查看详情
    function particulars(id) {
        // window.location.href = "documentDetails?id=" + id;
        window.location.href = "http://47.105.114.70/document/documentDetails?id=" + id;
    }
</script>
</html>
