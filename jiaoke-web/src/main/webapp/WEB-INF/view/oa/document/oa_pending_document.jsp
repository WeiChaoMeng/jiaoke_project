<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>待办公文</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
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

    <div class="page_head">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button">
                        <button type="button" class="cursor_hand">&#xe990; 归档</button>
                    </div>

                    <div class="separation_line"></div>

                    <div class="head_left_button">
                        <button type="button" class="cursor_hand">&#xeaa5; 删除</button>
                    </div>

                    <div class="separation_line"></div>

                    <div class="head_left_button">
                        <button type="button" class="cursor_hand">&#xe8cb; 批处理</button>
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

                        <!--发起人-->
                        <div id="div4" class="head_right_side_input Initiator">
                            <input type="text">
                        </div>

                        <!--状态-->
                        <div id="div5" class="head_right_side_select matter_status">
                            <select>
                                <option value="1">未读</option>
                                <option value="2">已读</option>
                                <option value="3">暂存待办</option>
                                <option value="4">被回退</option>
                                <option value="5">指定回退</option>
                            </select>
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition2">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">标题</option>
                                <option value="2">重要程度</option>
                                <option value="3">发起人</option>
                                <option value="4">处理状态</option>
                            </select>
                        </div>
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="simpletable simpletable_color">

        <table class="simpletable simpletable_color" style="table-layout: fixed">

            <thead>
            <th style="width: 3%;"><input type="checkbox"></th>
            <th style="width: 6%;">密级</th>
            <th style="width: 25%;">标题</th>
            <th style="width: 12%;">公文文号</th>
            <th style="width: 6%;">发起人</th>
            <th style="width: 12%">发起时间</th>
            <th style="width: 12%;">接收时间</th>
            <th style="width: 6%;">处理期限</th>
            <th style="width: 6%;">催办次数</th>
            <th style="width: 6%;">处理状态</th>
            <th style="width: 6%;">流程日志</th>
            </thead>
            <tbody>

            <c:choose>
                <c:when test="${oaDocumentList.size() == 0}">
                    <tr>
                        <td colspan="11">没有查询到匹配记录</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr></tr>

                    <c:forEach var="oaDocument" items="${oaDocumentList}" varStatus="status">
                        <tr onclick="particulars(${oaDocument.id})">
                            <td class="tdnum">
                                <input type="hidden" id="taskId" value="${oaDocument.taskId}">
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
                            <td>${oaDocument.urgingNumber}</td>
                            <td>
                                <c:if test="${oaDocument.processState == 0}">未读</c:if>
                                <c:if test="${oaDocument.processState == 1}">已读</c:if>
                            </td>
                            <td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>


            </tbody>

        </table>
    </div>

</div>


</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>

<script>
    //查看详情
    function particulars(id) {
        var taskId = $("#taskId").val();
        window.location.href = "${path}/document/documentDetails?id=" + id + "&taskId=" + taskId;
    }
</script>
</html>
